#!/bin/bash
# Turn a repeated agent-eval failure into a fix PR. A task that failed in at least two of
# the last three nightly runs is handed to Claude in two fresh worktrees: deepvalues-evals
# (the task's prompt and regexes) and buffett-values-0927 (the MCP tools behind
# app.deepvalues.ai/api/mcp, apps/next/lib/api/mcp-server.ts). Claude decides which side is
# wrong, commits there, and this script opens the PR. Nothing is merged or deployed.
# Called by nightly-evals.sh after the run. By hand:
#   bash ~/.deepvalues-evals/fix-failures.sh              # every repeated failure
#   bash ~/.deepvalues-evals/fix-failures.sh --task <id>  # one task, even if it failed once
set -uo pipefail
export PATH="/Users/ivy/.local/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
CLAUDE="/Users/ivy/.local/bin/claude"
EVALS="/Users/ivy/Projects-LULU/deepvalues-evals"
WEB="/Users/ivy/Projects-LULU/buffett-values-0927"
LOG="$HOME/Library/Logs/deepvalues-evals.log"
log() { echo "$(date '+%F %T') fix: $*" | tee -a "$LOG"; }

ONLY=""
[ "${1:-}" = "--task" ] && ONLY="$2"

cd "$EVALS" || exit 1
TASKS="$(python3 - "$ONLY" <<'EOF'
import json, glob, sys
only = sys.argv[1]
files = sorted(glob.glob("results/20*.json"))[-3:]
runs = [json.load(open(f)) for f in files]
fails = {}
for f, r in zip(files, runs):
    for x in r["results"]:
        if not x["pass"]:
            fails.setdefault(x["id"], []).append(f)
for tid, fs in fails.items():
    if only and tid != only: continue
    if not only and len(fs) < 2: continue
    print(tid)
EOF
)"
[ -n "$TASKS" ] || { log "no repeated failures"; exit 0; }

for TID in $TASKS; do
  BRANCH="evals/fix-$TID"
  git -C "$EVALS" fetch -q origin; git -C "$WEB" fetch -q origin
  if git -C "$EVALS" rev-parse --verify -q "origin/$BRANCH" >/dev/null || git -C "$WEB" rev-parse --verify -q "origin/$BRANCH" >/dev/null; then
    log "$TID: $BRANCH already on origin; skipped"; continue
  fi
  WT_E="/tmp/dv-evals-fix-$TID"; WT_W="/tmp/dv-evals-fix-web-$TID"
  rm -rf "$WT_E" "$WT_W"; git -C "$EVALS" worktree prune; git -C "$WEB" worktree prune
  git -C "$EVALS" worktree add -q -b "$BRANCH" "$WT_E" origin/main || { log "$TID: evals worktree failed"; continue; }
  git -C "$WEB" worktree add -q -b "$BRANCH" "$WT_W" origin/main || { log "$TID: web worktree failed"; git -C "$EVALS" worktree remove --force "$WT_E"; continue; }
  [ -d "$WEB/node_modules" ] && ln -s "$WEB/node_modules" "$WT_W/node_modules"
  # The brief: the task and its last three outcomes (answer, tools, reasons).
  python3 - "$TID" > "$WT_E/.failure-brief.json" <<'EOF'
import json, glob, sys
tid = sys.argv[1]
task = next(t for t in json.load(open("tasks/tasks.json")) if t["id"] == tid)
hist = []
for f in sorted(glob.glob("results/20*.json"))[-3:]:
    r = json.load(open(f))
    x = next((x for x in r["results"] if x["id"] == tid), None)
    if x: hist.append({"date": f[8:18], "pass": x["pass"], "tools": x.get("tools"), "tool_errors": x.get("tool_errors"),
                       "reasons": x.get("reasons"), "answer": (x.get("answer") or "")[:3000]})
print(json.dumps({"task": task, "history": hist}, indent=2, ensure_ascii=False))
EOF
  PROMPT="$(sed -e "s#WEB_WORKTREE#$WT_W#g" -e "s#TASK_ID#$TID#g" "$HOME/.deepvalues-evals/fix-failures.prompt.md")"
  log "$TID: running Claude"
  SUMMARY="$(cd "$WT_E" && "$CLAUDE" -p "$PROMPT" --add-dir "$WT_W" \
    --permission-mode acceptEdits \
    --allowedTools "Read,Edit,Write,Grep,Glob,Bash(git add *),Bash(git commit *),Bash(git -C * add *),Bash(git -C * commit *),Bash(git status*),Bash(git diff*),Bash(git -C * status*),Bash(git -C * diff*),Bash(python3 *),Bash(yarn typecheck*),Bash(yarn lint*),Bash(yarn vitest *),Bash(cat *),Bash(ls *),Bash(head *),Bash(curl -s https://app.deepvalues.ai/*)" \
    --disallowedTools "Bash(yarn install*),Bash(npm install*),Bash(rm *),Bash(git push*),Bash(git reset*),Bash(git checkout*)" 2>>"$LOG")"
  rm -f "$WT_E/.failure-brief.json" "$WT_W/node_modules"
  OPENED=""
  for PAIR in "$EVALS|$WT_E|deepvalues-evals" "$WEB|$WT_W|buffett-values-0927"; do
    R="${PAIR%%|*}"; REST="${PAIR#*|}"; W="${REST%%|*}"; NAME="${REST#*|}"
    if (cd "$W" && git log origin/main..HEAD --oneline | grep -q .); then
      (cd "$W" && git push -q -u origin "$BRANCH") || { log "$TID: push to $NAME failed"; continue; }
      PR_URL="$(cd "$W" && gh pr create --base main --head "$BRANCH" --title "Agent evals: fix repeated failure of $TID" \
        --body "$(printf 'The nightly agent evals (deepvalues-evals) failed task `%s` in at least two of the last three runs. Opened by fix-failures.sh; review before merging, nothing is deployed.\n\n%s' "$TID" "$SUMMARY")" 2>>"$LOG")"
      log "$TID: PR in $NAME: $PR_URL"; OPENED=1
      osascript -e "display notification \"$PR_URL\" with title \"Agent evals fix PR: $TID\"" 2>/dev/null || true
    fi
  done
  [ -n "$OPENED" ] || log "$TID: no commit. Agent said: $(printf '%s' "$SUMMARY" | head -c 400)"
  git -C "$EVALS" worktree remove --force "$WT_E" 2>/dev/null; git -C "$WEB" worktree remove --force "$WT_W" 2>/dev/null
  [ -n "$OPENED" ] || { git -C "$EVALS" branch -D "$BRANCH" >/dev/null 2>&1; git -C "$WEB" branch -D "$BRANCH" >/dev/null 2>&1; }
done
exit 0
