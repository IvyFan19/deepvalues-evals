#!/bin/bash
# Nightly agent evals (deepvalues-evals): can an agent finish ten real tasks with
# only the DeepValues MCP tools? Runs keyless, as a first-time agent would.
# launchd: com.deepvalues.evals (06:15 daily). Run by hand:
#   bash ~/.deepvalues-evals/nightly-evals.sh
set -uo pipefail
export PATH="/Users/ivy/.local/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
REPO="/Users/ivy/Projects-LULU/deepvalues-evals"
LOG="$HOME/Library/Logs/deepvalues-evals.log"
log() { echo "$(date '+%F %T') $*" | tee -a "$LOG"; }

cd "$REPO" || { log "repo missing"; exit 1; }
log "=== run start ==="
python3 run.py --keyless --timeout 300 >> "$LOG" 2>&1
RC=$?
PASS=$(python3 -c "import json,glob;r=json.load(open(sorted(glob.glob('results/20*.json'))[-1]));print(sum(x['pass'] for x in r['results']),'/',len(r['results']))" 2>/dev/null)
log "result: $PASS passed (exit $RC)"
# Keep the history in git; the push only works once the repo has a remote.
git add results >/dev/null 2>&1 && git commit -qm "evals: $(date +%F), $PASS" >/dev/null 2>&1 && log "committed"
git remote get-url origin >/dev/null 2>&1 && { git push -q origin main 2>>"$LOG" && log "pushed" || log "push failed"; }
# A failing night is worth a glance.
# A task that failed in two of the last three runs gets a fix PR (fix-failures.sh).
bash "$HOME/.deepvalues-evals/fix-failures.sh" >>"$LOG" 2>&1
[ "$RC" -ne 0 ] && osascript -e "display notification \"$PASS passed, see results/latest.md\" with title \"DeepValues agent evals FAILED\"" 2>/dev/null
exit 0
