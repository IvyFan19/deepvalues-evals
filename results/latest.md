# DeepValues agent evals, 2026-11-24

10/10 tasks passed. Model: default. Mode: keyless. Cost: $0.94.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | pass | ToolSearch, smart_money_holdings | 11.5 |  |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value | 12.1 |  |
| buffett-moves | pass | ToolSearch, guru_moves | 14.7 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 15.6 |  |
| grounded-nvda | pass | ToolSearch, ai_context | 12.7 |  |
| filings-msft | pass | ToolSearch, filings, filings | 13.8 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals | 10.5 |  |
| guru-lookup | pass | ToolSearch, gurus, guru | 19.1 |  |
| sentiment-tsla | pass | ToolSearch, sentiment, sentiment, sentiment, sentiment | 16.2 |  |
| unknown-ticker | pass | ToolSearch, intrinsic_value | 9.6 |  |

## Answers

### holders-aapl

The data is for the quarter ending **September 30, 2026 (Q3 2026)**, taken from 13F-HR filings. That's the latest quarter DeepValues has.

**27 of the investors DeepValues tracks held AAPL**, with about **$97.5B** in combined value. That total is down about 2.2% from the prior quarter.

**Top three by position size (USD):**

| # | Investor (Fund) | Shares | Position value | % of portfolio | Change vs. Q2 |
|---|---|---|---|---|---|
| 1 | Warren Buffett (Berkshire Hathaway) | 227.9M | ~$75.9B | 24.95% | Unchanged |
| 2 | Duan Yongping (H&H International) | 21.2M | ~$7.06B | 41.07% | Trimmed by ~5.9M shares (−21.8%) |
| 3 | Cliff Asness (AQR Capital) | 20.9M | ~$6.96B | 2.06% | Added ~3.3M shares (+19.0%) |

Berkshire's stake is about 10 times the next-largest. Duan Yongping's is the most concentrated bet, at 41% of his portfolio. The other holders include D. E. Shaw, Citadel (Ken Griffin), Two Sigma, Gotham (Joel Greenblatt), Millennium, Baillie Gifford and Markel (Tom Gayner). Dan Bin's Oriental Harbor opened a new position this quarter. Renaissance sold almost all of its stake (−99.8%).

This is for information only and isn't investment advice.

### intrinsic-brkb

**The models disagree, so there's no clear answer.** BRK.B's last price was **$572.36** (Nov 23, 2026). The two models that ran give fair values on opposite sides of that price.

| Method | Fair value / share | vs. price |
|---|---|---|
| **Owner Earnings** (the headline value DeepValues shows) | **$675.93** (conservative case $473.15) | **~18% above price → trading below intrinsic value** |
| **DCF on free cash flow** | **$306.17** (range $121.78–$580.98) | **~47% below price → trading above intrinsic value** |
| Damodaran two-stage | not computed | The tool doesn't run this model for financial-sector companies |
| **Equal-weight blend** (average of the two) | **$491.05** | **~14% below price → trading above intrinsic value** |

**Do they agree?** No. The gap between them is about $370 per share.
- The Owner Earnings model, which DeepValues headlines, says BRK.B is about 18% **undervalued**.
- The DCF and the blend say it is **overvalued**, by about 47% and 14%.
- Only the DCF's most optimistic case ($581) gets above today's price. Only Owner Earnings' conservative case ($473) falls below it.
- No probability range is available because that comes from the Damodaran model, which didn't run.

**Why they split:** free-cash-flow models usually undervalue Berkshire. Its insurance float, its large holdings of stocks and cash, and its heavy capital spending in railroads and utilities don't show up well in plain free cash flow. Owner Earnings is Buffett's own measure and suits a conglomerate like this better, which is probably why DeepValues uses it as the headline. Still, the tools don't settle it. On Owner Earnings BRK.B looks modestly cheap. On the blend it looks somewhat expensive.

The valuations use FY2025 SEC filings and passed all of the tool's data-quality checks. This is data and analysis, not investment advice.

### buffett-moves

I pulled these from DeepValues' guru moves feed. All of them come from Buffett's (Berkshire Hathaway's) 13F for the quarter ending **2026-09-30**, which was **filed 2026-11-16**. Here are the five largest by position size:

| # | Ticker | Company | Action | Shares (prev → now) | Position | Filed |
|---|---|---|---|---|---|---|
| 1 | BAC | Bank of America | **Trimmed** | 483.4M → 455.9M | ~$24.8B (8.2% of portfolio) | 2026-11-16 |
| 2 | DAL | Delta Air Lines | **Added** | 57.3M → 64.5M | ~$5.4B (1.8%) | 2026-11-16 |
| 3 | DVA | DaVita | **Trimmed** | 28.88M → 28.70M | ~$5.0B (1.7%) | 2026-11-16 |
| 4 | LEN | Lennar | **Added** | 13.1M → 26.0M (about double) | ~$2.1B (0.7%) | 2026-11-16 |
| 5 | KR | Kroger | **Trimmed** | 39.0M → 35.0M | ~$2.1B (0.7%) | 2026-11-16 |

- **New position:** The filing's only new position is **BSP (Bending Spoons S.p.A.)**: 20.7M shares worth about $689M. It's too small to make the top five. It's also an unusual name to find in a 13F, so check it against the original SEC filing before relying on it.
- **Exits:** None appear in this filing.
- **Small changes:** The feed includes every position of $100M or more, so some rows barely changed. DaVita's trim was under 1%.
- **Other trims:** Nucor, Capital One (3.0M → 1.15M shares) and VeriSign (9.0M → 5.9M shares).

13F filings come out with a delay, so these trades happened by 2026-09-30, about 47 days before the filing. This is for information only, not investment advice.

### market-level

Yes. By both DeepValues measures, US stocks are very expensive compared with their own history.

| Indicator | Current reading | As of | Zone | Historical percentile |
|---|---|---|---|---|
| **Buffett Indicator** (US corporate equities ÷ GDP) | **255%** | 2026-04-01 | Significantly overvalued (above 135%) | **99.7th** |
| **Shiller PE** (CAPE) | **38.2** | 2026-11-23 | Significantly overvalued (above 34) | **92.7th** |

**Buffett Indicator.** At 255%, stock market value is nearly double the 135% line where "significantly overvalued" starts. Fair value on this scale is about 90–115%. The 99.7th percentile means the market has almost never been priced higher relative to the economy. The reading rose from about 153% in mid-2022 to 255% in April 2026, a new high in this series.

**Shiller PE.** At 38.2, it's well above the zone's starting point of 34 and far above fair value of about 22–28. It was higher earlier this year: it peaked at about 42.7 in mid-August and was mostly above 40 from June through early November. It has fallen in the last few weeks, hitting 36.44 on Nov 20 before bouncing to 38.21. So it's slightly less stretched than at the summer peak, but still in the top ~7% of history.

**Things to keep in mind:**
- **The Buffett reading is almost 8 months old.** It comes from quarterly data dated April 1, 2026. The market has moved since then, so read it as "extremely high as of spring" rather than today's value.
- **Some change figures from the tools don't match their own data.** The Shiller tool says CAPE is up 4.9% month-over-month, but its daily history shows a fall from about 40.6 to 38.2 (roughly −6%). The Buffett tool says it's up 43.5% year-over-year, but its history shows about +19.6% (213.3 → 255.0). I relied on the readings, zones and percentiles above, not these change fields.
- **Expensive doesn't predict timing.** High readings on both measures have historically been followed by below-average long-run (about 10-year) returns. They say little about where the market goes next month or next year. Both have also stayed above their "overvalued" levels for most of the past five years.

Overall, both readings put the US market in the most expensive part of its history. This is informational only, not investment advice.

### grounded-nvda

Pulled from DeepValues `ai_context` for NVDA, **as of 2026-11-24T14:16:07Z**:

DeepValues describes NVIDIA as an exceptional franchise. Its wide moat comes from CUDA, integrated chips, networking and software, and developer lock-in, and it earns a 71.1% gross margin, 107.2% ROIC and 76.3% ROE. At about $165 a share (roughly a $4.05 trillion market cap), the reported P/E of 17.73 looks cheap, but only if roughly $9.31 of EPS reflects normalized earning power rather than a peak in hyperscaler spending. A disciplined value investor can't yet confirm a margin of safety, because the record has no normalized free cash flow, net debt, dilution or customer-concentration data, and no DeepValues intrinsic value. That's why DeepValues rates it **WATCH** ("outstanding business quality; valuation support remains incomplete"), even though Baillie Gifford, AQR and Tiger Global added shares in the 2026-09-30 filings while D. E. Shaw trimmed.

The DeepValues record had no sector or industry for NVDA, so I left those out. This is informational only, not investment advice.

### filings-msft

According to DeepValues, Microsoft's most recent 10-K was filed on **July 29, 2026**. It covers the fiscal year that ended **June 30, 2026** ([filing](https://www.sec.gov/Archives/edgar/data/000789019/000119312526323660/msft-20260630.htm)). The one before it was filed on July 30, 2025, for the fiscal year ending June 30, 2025.

**Other filings from June through November 2026, newest first:**

| Filing date | Form | What it covers |
|---|---|---|
| 2026-11-05 | 8-K | Event dated Nov 4, 2026 |
| 2026-11-04 | 8-K | Event dated Oct 29, 2026 |
| 2026-10-28 | 8-K (×2) | Filed the same day as the 10-Q, likely the quarterly earnings release |
| 2026-10-28 | **10-Q** | Quarter ended Sep 30, 2026 (Q1 of fiscal 2027) |
| 2026-10-21 | DEF 14A | Proxy statement for the Dec 8, 2026 annual shareholder meeting |
| 2026-09-02 | 8-K | Event dated Sep 2, 2026 |
| 2026-07-29 | 8-K | Filed the same day as the 10-K, likely the annual earnings release |
| 2026-07-22, 2026-07-02 | PX14A6G (×2) | Notices from shareholders urging an "exempt solicitation" (a campaign to sway proxy votes) |
| 2026-07-15, 2026-07-01 | Form 4 | Insider trading reports |
| 2026-06-25 | 11-K (×2) | Annual reports for employee benefit plans, for the year ended Dec 31, 2025 |
| 2026-06-12 to 2026-06-16 | Form 4 (×10) | Insider trading reports: 8 on June 12, plus June 15 and June 16 |

The next 10-K should arrive around late July 2027, after the fiscal year ending June 30, 2027. The 8-K entries above are based only on their dates; I didn't open them to see what each one covers.

### fundamentals-ko

Coca-Cola's (KO) latest annual figures in DeepValues are for **fiscal year 2025**, the year ending December 31, 2025:

| Metric | FY2025 | FY2024 (for comparison) |
|---|---|---|
| Revenue | $47,941M | $47,061M |
| Net income | $13,107M | $10,631M |
| Free cash flow | $5,296M | $4,741M |

The data returns plain numbers with no units. I've assumed they are millions of US dollars because revenue of 47,941 matches Coca-Cola's roughly $48B in sales.

In FY2025, revenue rose about 1.9%, net income about 23% and free cash flow about 12%.

### guru-lookup

I found Li Lu in the guru roster under the slug **`li-lu`** and pulled his profile.

## Who he is, according to DeepValues
**Li Lu** (58) is the founder of **Himalaya Capital**, which he started in 1997 and runs from Seattle. DeepValues lists his style as **value**. The profile says:

- **Very concentrated portfolio:** often under 10 positions, held for several years, with low single-digit annual turnover.
- **Best-known public-market move:** he introduced BYD to Charlie Munger in 2008. It became one of Berkshire Hathaway's most profitable non-US investments.
- **Background:** born in China, he was an organiser of the Tiananmen-era student protests before moving to the US. He lectures occasionally at Columbia Business School, and those lectures circulate informally as PDFs.
- **Low profile:** the firm publishes no public investor letters, and the profile says Li gives no media interviews.

## Top holdings (13F filing for Q3 2026, quarter ending Sept 30, 2026)
The portfolio is about **$3.78B** across **8 positions**. DeepValues didn't return them in size order, so I re-sorted them:

| # | Ticker | Company | Value | % of portfolio | Q3 change |
|---|---|---|---|---|---|
| 1 | PDD | PDD Holdings | $917M | 24.2% | **Added** |
| 2 | GOOGL | Alphabet (Class A) | $875M | 23.1% | Unchanged |
| 3 | GOOG | Alphabet (Class C) | $835M | 22.1% | Unchanged |
| 4 | BRK.B | Berkshire Hathaway | $552M | 14.6% | Unchanged |
| 5 | EWBC | East West Bancorp | $344M | 9.1% | Unchanged |
| 6 | TME | Tencent Music | $118M | 3.1% | **Added** |
| 7 | CROX | Crocs | $104M | 2.8% | Unchanged |
| 8 | AAPL | Apple | $37M | 1.0% | Unchanged |

**What stands out:**
- **Alphabet is the biggest position.** The two share classes together are about **45%** of the portfolio.
- **Alphabet, PDD and Berkshire make up about 84%** of the portfolio.
- **The only changes this quarter were adds to PDD and Tencent Music.** Both are China-linked, and PDD is now the largest single line. No positions were trimmed or sold.

A 13F only covers US-listed long positions. So this list leaves out holdings on other exchanges, such as the Hong Kong and China-listed shares Himalaya is known for (BYD, for example).

### sentiment-tsla

DeepValues has no sentiment reading for TSLA over the last 7 days, so there's nothing to report.

| Query | Bullish / Bearish / Neutral | Posts | Top source |
|---|---|---|---|
| Combined, 7d | null / null / null | 0 | none |
| Reddit, 7d | null / null / null | 0 | none |
| StockTwits, 7d | null / null / null | 0 | none |
| Combined, 30d (checked too) | null / null / null | 0 | none |

- **Reading:** none. There's no bullish/bearish split and no sample quotes, and `as_of` is null. That means DeepValues has no data for TSLA here. It doesn't mean sentiment is neutral.
- **Source mix:** none. Reddit and StockTwits both returned 0 posts, and the longer 30-day window was empty as well.

TSLA is one of the most-discussed tickers, so this is almost certainly missing coverage on DeepValues' side rather than a real lack of posts.

If you want, I can file a free `request_data` request asking DeepValues to add TSLA sentiment coverage. I can also pull other value-investor signals for TSLA, such as guru and smart-money holdings, intrinsic value, or theses.

### unknown-ticker

DeepValues has no intrinsic value for **ZZZQ**. The API returned a 404 "Ticker not found" error, so I can't give you a value, and I won't estimate one.

This usually means one of two things:
- **The symbol is wrong or doesn't exist.** DeepValues only covers companies that file with the US SEC (Securities and Exchange Commission). If you tell me the company name, I can search DeepValues for its correct ticker.
- **DeepValues doesn't cover this company.** I can send DeepValues a free request to add coverage for ZZZQ, if you'd like.

You weren't charged for this call, because no data came back.
