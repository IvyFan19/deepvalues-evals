#!/usr/bin/env python3
"""
DeepValues agent evals: can a coding agent, given only the DeepValues MCP tools,
finish real value-investing tasks?

Each task in tasks/tasks.json is run through `claude -p` with the DeepValues MCP
server as its only tool source. A task passes when the agent used one of the
expected tools, the answer matches every `expect` pattern and none of `forbid`.
Results land in results/<date>.json and results/latest.md.

    python3 run.py                 # all tasks, keyed if DEEPVALUES_API_KEY is set
    python3 run.py --limit 2       # a quick check
    python3 run.py --keyless       # the first-contact experience
    python3 run.py --model sonnet  # another model

Needs the Claude Code CLI (`claude`) on PATH. The run uses that CLI's account.
"""
from __future__ import annotations

import argparse
import datetime as dt
import json
import os
import pathlib
import re
import subprocess
import sys
import time

ROOT = pathlib.Path(__file__).resolve().parent
TASKS = ROOT / "tasks" / "tasks.json"
RESULTS = ROOT / "results"


def run_task(task: dict, model: str | None, mcp_config: pathlib.Path, max_turns: int, timeout: int) -> dict:
    cmd = [
        "claude", "-p", task["prompt"],
        "--output-format", "stream-json", "--verbose",
        "--mcp-config", str(mcp_config), "--strict-mcp-config",
        "--allowedTools", "mcp__deepvalues__*",
        "--max-turns", str(max_turns),
        "--permission-mode", "dontAsk",
    ]
    if model:
        cmd += ["--model", model]
    t0 = time.time()
    try:
        proc = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout, cwd=ROOT)
    except subprocess.TimeoutExpired:
        return {"id": task["id"], "pass": False, "error": f"timeout after {timeout}s", "tools": [], "answer": "", "seconds": timeout}
    tools: list[str] = []
    answer = ""
    tool_errors = 0
    cost = None
    for line in proc.stdout.splitlines():
        try:
            ev = json.loads(line)
        except ValueError:
            continue
        if ev.get("type") == "assistant":
            for block in ev.get("message", {}).get("content", []):
                if block.get("type") == "tool_use":
                    tools.append(block.get("name", ""))
        elif ev.get("type") == "user":
            for block in ev.get("message", {}).get("content", []):
                if block.get("type") == "tool_result" and block.get("is_error"):
                    tool_errors += 1
        elif ev.get("type") == "result":
            answer = ev.get("result") or ""
            cost = ev.get("total_cost_usd")
    short = [t.replace("mcp__deepvalues__", "") for t in tools]
    used_expected = any(any(m in t for t in short) for m in task.get("must_use", []))
    expect_ok = all(re.search(p, answer) for p in task.get("expect", []))
    forbid_ok = not any(re.search(p, answer) for p in task.get("forbid", []))
    reasons = []
    if not used_expected:
        reasons.append(f"expected one of {task.get('must_use')} to be called; called {short or 'nothing'}")
    for p in task.get("expect", []):
        if not re.search(p, answer):
            reasons.append(f"answer lacks /{p}/")
    for p in task.get("forbid", []):
        if re.search(p, answer):
            reasons.append(f"answer matches forbidden /{p}/")
    if proc.returncode != 0 and not answer:
        reasons.append(f"claude exited {proc.returncode}: {proc.stderr.strip()[:300]}")
    return {
        "id": task["id"],
        "pass": used_expected and expect_ok and forbid_ok and bool(answer),
        "tools": short,
        "tool_errors": tool_errors,
        "answer": answer,
        "reasons": reasons,
        "cost_usd": cost,
        "seconds": round(time.time() - t0, 1),
    }


def write_report(results: list[dict], meta: dict) -> str:
    passed = sum(r["pass"] for r in results)
    lines = [
        f"# DeepValues agent evals, {meta['date']}",
        "",
        f"{passed}/{len(results)} tasks passed. Model: {meta['model'] or 'default'}. Mode: {meta['mode']}. "
        f"Cost: ${sum(r.get('cost_usd') or 0 for r in results):.2f}.",
        "",
        "| Task | Result | Tools called | Seconds | Why |",
        "|---|---|---|---|---|",
    ]
    for r in results:
        why = "; ".join(r.get("reasons", [])) or ("" if r["pass"] else r.get("error", ""))
        lines.append(f"| {r['id']} | {'pass' if r['pass'] else 'FAIL'} | {', '.join(r['tools']) or '-'} | {r['seconds']} | {why} |")
    lines += ["", "## Answers", ""]
    for r in results:
        lines += [f"### {r['id']}", "", (r["answer"] or r.get("error", "")).strip(), ""]
    return "\n".join(lines)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--limit", type=int, default=0)
    ap.add_argument("--only", help="comma-separated task ids")
    ap.add_argument("--model")
    ap.add_argument("--keyless", action="store_true", help="run with no API key, as a first-time agent would")
    ap.add_argument("--max-turns", type=int, default=10)
    ap.add_argument("--timeout", type=int, default=240)
    ap.add_argument("--threshold", type=float, default=0.8, help="exit 1 when the pass rate is below this")
    ap.add_argument("--list", action="store_true")
    a = ap.parse_args()

    tasks = json.loads(TASKS.read_text())
    if a.only:
        wanted = set(a.only.split(","))
        tasks = [t for t in tasks if t["id"] in wanted]
    if a.limit:
        tasks = tasks[: a.limit]
    if a.list:
        for t in tasks:
            print(f"{t['id']:18} {t['prompt'][:90]}")
        return 0

    keyed = bool(os.environ.get("DEEPVALUES_API_KEY")) and not a.keyless
    mcp_config = ROOT / ("mcp.json" if keyed else "mcp.keyless.json")
    date = dt.datetime.now(dt.timezone.utc).strftime("%Y-%m-%d")
    results = []
    for t in tasks:
        r = run_task(t, a.model, mcp_config, a.max_turns, a.timeout)
        results.append(r)
        print(f"{'PASS' if r['pass'] else 'FAIL'} {r['id']:18} {r['seconds']:6.1f}s  tools={','.join(r['tools']) or '-'}"
              + (f"  ({'; '.join(r['reasons'])[:140]})" if not r['pass'] else ""), flush=True)

    meta = {"date": date, "model": a.model, "mode": "keyed" if keyed else "keyless"}
    RESULTS.mkdir(exist_ok=True)
    (RESULTS / f"{date}.json").write_text(json.dumps({"meta": meta, "results": results}, indent=2))
    report = write_report(results, meta)
    (RESULTS / "latest.md").write_text(report)
    rate = sum(r["pass"] for r in results) / max(1, len(results))
    print(f"\n{sum(r['pass'] for r in results)}/{len(results)} passed; report at results/latest.md")
    return 0 if rate >= a.threshold else 1


if __name__ == "__main__":
    sys.exit(main())
