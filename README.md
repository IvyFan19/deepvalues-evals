# deepvalues-evals

Can a coding agent, given only the [DeepValues](https://app.deepvalues.ai/developers)
MCP tools, finish real value-investing tasks? Ten tasks, one agent run each, a pass
when the right tool was called and the answer holds the facts. The same test Supabase
runs on its own platform: if the agent gets stuck, that is our bug.

```bash
python3 run.py                 # all tasks; keyed when DEEPVALUES_API_KEY is set
python3 run.py --keyless       # the first-contact experience: no key at all
python3 run.py --limit 2       # a quick check
python3 run.py --model sonnet  # another model
```

Needs the [Claude Code CLI](https://docs.anthropic.com/claude-code) on PATH; the run uses
that CLI's account. Results land in `results/<date>.json` and `results/latest.md`; the
process exits 1 when fewer than 80% pass, so it can gate a deploy or page a human.

## Tasks

| Id | Asks the agent to | Must call |
|---|---|---|
| holders-aapl | name the top holders of Apple and the quarter | smart_money_holdings |
| intrinsic-brkb | say whether BRK.B is above or below intrinsic value | intrinsic_value |
| buffett-moves | list Buffett's latest filed moves | guru_moves / guru_portfolio / smart_money_changes |
| market-level | quote the Buffett Indicator and Shiller PE | indicators_buffett + indicators_shiller_pe |
| grounded-nvda | write a grounded take on NVDA from ai_context | ai_context |
| filings-msft | date Microsoft's last 10-K | filings |
| fundamentals-ko | report Coca-Cola's revenue, net income, FCF | fundamentals |
| guru-lookup | find Li Lu via the roster and list holdings | gurus + guru |
| sentiment-tsla | give 7-day value-investor sentiment on TSLA | sentiment |
| unknown-ticker | say "no data" for a fake ticker instead of guessing | intrinsic_value / companies_search |

Add a task by appending to `tasks/tasks.json`: `prompt`, `must_use` (any one tool name
substring), `expect` (regexes the answer must match), `forbid` (regexes it must not).

## Nightly

`launchd/com.deepvalues.evals.plist` runs the suite at 06:15 local time on a Mac with
the CLI signed in. The GitHub workflow runs on demand or on a schedule with an
`ANTHROPIC_API_KEY` secret.

MIT. Data is for research; nothing here is investment advice.
