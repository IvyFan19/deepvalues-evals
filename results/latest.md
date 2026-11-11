# DeepValues agent evals, 2026-11-11

0/10 tasks passed. Model: default. Mode: keyless. Cost: $0.00.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | FAIL | - | 2.2 | expected one of ['smart_money_holdings'] to be called; called nothing; answer lacks /(?i)apple|AAPL/; answer lacks /20\d\d/ |
| intrinsic-brkb | FAIL | - | 2.2 | expected one of ['intrinsic_value'] to be called; called nothing; answer lacks /(?i)intrinsic|fair value/; answer lacks /\$?\d{2,4}/ |
| buffett-moves | FAIL | - | 1.7 | expected one of ['guru_moves', 'guru_portfolio', 'smart_money_changes'] to be called; called nothing; answer lacks /(?i)buffett|berkshire/; answer lacks /(?i)new|added|trimmed|exited|bought|sold/ |
| market-level | FAIL | - | 1.8 | expected one of ['indicators_buffett', 'indicators_shiller_pe'] to be called; called nothing; answer lacks /(?i)buffett indicator/; answer lacks /(?i)shiller/; answer lacks /\d+(\.\d+)?\s?%|\d+(\.\d+)?x|\d{2,3}/ |
| grounded-nvda | FAIL | - | 4.5 | expected one of ['ai_context'] to be called; called nothing; answer lacks /(?i)nvidia|NVDA/; answer lacks /20\d\d/ |
| filings-msft | FAIL | - | 1.2 | expected one of ['filings'] to be called; called nothing; answer lacks /10-K/; answer lacks /20\d\d/ |
| fundamentals-ko | FAIL | - | 1.3 | expected one of ['fundamentals'] to be called; called nothing; answer lacks /(?i)revenue/; answer lacks /(?i)net income/; answer lacks /20\d\d/ |
| guru-lookup | FAIL | - | 1.4 | expected one of ['gurus', 'guru'] to be called; called nothing; answer lacks /(?i)li lu/; answer lacks /(?i)holding|position/ |
| sentiment-tsla | FAIL | - | 1.8 | expected one of ['sentiment'] to be called; called nothing; answer lacks /(?i)tesla|TSLA/; answer lacks /(?i)bullish|bearish|neutral|sentiment/ |
| unknown-ticker | FAIL | - | 1.9 | expected one of ['intrinsic_value', 'companies_search'] to be called; called nothing; answer lacks /(?i)no data|not found|unknown|does ?n[o']t (exist|have)|could ?n[o']t find|no (such|matching)/ |

## Answers

### holders-aapl

Failed to authenticate: OAuth session expired and could not be refreshed

### intrinsic-brkb

Failed to authenticate: OAuth session expired and could not be refreshed

### buffett-moves

Failed to authenticate: OAuth session expired and could not be refreshed

### market-level

Failed to authenticate: OAuth session expired and could not be refreshed

### grounded-nvda

Failed to authenticate: OAuth session expired and could not be refreshed

### filings-msft

Failed to authenticate: OAuth session expired and could not be refreshed

### fundamentals-ko

Failed to authenticate: OAuth session expired and could not be refreshed

### guru-lookup

Failed to authenticate: OAuth session expired and could not be refreshed

### sentiment-tsla

Failed to authenticate: OAuth session expired and could not be refreshed

### unknown-ticker

Failed to authenticate: OAuth session expired and could not be refreshed
