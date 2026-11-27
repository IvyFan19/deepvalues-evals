# DeepValues agent evals, 2026-11-27

10/10 tasks passed. Model: default. Mode: keyless. Cost: $0.94.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | pass | ToolSearch, smart_money_holdings | 16.4 |  |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value | 18.0 |  |
| buffett-moves | pass | ToolSearch, guru_moves | 21.9 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 19.9 |  |
| grounded-nvda | pass | ToolSearch, ai_context | 21.8 |  |
| filings-msft | pass | ToolSearch, filings, filings | 15.7 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals | 17.2 |  |
| guru-lookup | pass | ToolSearch, gurus, guru | 25.3 |  |
| sentiment-tsla | pass | ToolSearch, sentiment, sentiment, sentiment | 19.9 |  |
| unknown-ticker | pass | ToolSearch, intrinsic_value | 16.8 |  |

## Answers

### holders-aapl

The latest data is from 13F filings for the **quarter ending September 30, 2026 (Q3 2026)**. In that quarter, **27 of the roughly 60 investors DeepValues tracks held Apple**, with a combined position of about **$97.5B**. That combined total was down 2.23% from the prior quarter.

**Top three by position size:**

| # | Investor (Fund) | Shares | Position value | % of their portfolio | Change vs. prior quarter |
|---|---|---|---|---|---|
| 1 | **Warren Buffett** (Berkshire Hathaway) | 227.9M | **$75.90B** | 24.95% | Unchanged |
| 2 | **Duan Yongping** (H&H International) | 21.2M | **$7.06B** | 41.07% | Sold 5.9M shares (−21.8%) |
| 3 | **Cliff Asness** (AQR Capital) | 20.9M | **$6.96B** | 2.06% | Bought 3.3M shares (+19.0%) |

- Berkshire's stake alone is about 78% of the $97.5B total.
- Duan Yongping is ranked #2 by dollar value, but Apple is a much bigger part of his portfolio (41%) than of anyone else's.
- The next largest holders were D. E. Shaw ($1.67B), Ken Griffin's Citadel ($1.52B), Two Sigma ($1.35B) and Joel Greenblatt's Gotham ($1.01B).
- Dan Bin (Oriental Harbor) was the only new buyer this quarter. Jim Simons' Renaissance Technologies sold almost its whole stake (−99.8%).

13F filings come out up to 45 days after the quarter ends, so these holdings may have changed since then. This is for information only, not investment advice.

### intrinsic-brkb

**The models don't agree, so there's no single answer.** At the current price of **$579.32** (Nov 26, 2026 close), BRK.B is **above** intrinsic value by the blended number but **below** it by the headline Owner Earnings number.

| Method | Fair value / share | vs. $579.32 |
|---|---|---|
| **Owner Earnings** (the headline value) | **$684.13** | ~18% upside (undervalued) |
| **DCF on free cash flow** | **$310.68** | ~46% downside (overvalued) |
| **Damodaran two-stage** | not produced | — |
| **Equal-weight blend** (OE + DCF) | **$497.41** | ~14% downside (overvalued) |

**How far apart they are:**
- The two models that ran are more than 2x apart. Owner Earnings says Berkshire is cheap and DCF says it's expensive.
- The ranges barely overlap. Owner Earnings runs from $479 (conservative) to $684. DCF runs from $123 to $590. Only DCF's optimistic case gets near today's price.
- Damodaran wasn't computed because DeepValues considers its method a poor fit for financial-sector businesses. That leaves the blend as an average of just two models, and there are no Monte Carlo confidence bounds.

**Why they split:** a free-cash-flow DCF tends to undervalue Berkshire, because its insurance float and its large investment portfolio don't show up well as free cash flow. Owner Earnings, which is Buffett's own way of measuring what a business earns for its owners, is the more natural fit here. That's probably why DeepValues headlines it. Still, the blended value suggests the stock is fully priced to somewhat overvalued, and the margin of safety depends heavily on which model you trust.

**Bottom line:** using DeepValues' headline Owner Earnings number, BRK.B trades about 15% below its fair value of ~$684. Using the blended number, it trades about 16% above its fair value of ~$497. The data passed all of DeepValues' quality checks (fresh price, consistent currency, FY2025 SEC filings).

This is data and analysis, not investment advice.

### buffett-moves

Buffett's most recent filing on DeepValues is the 13F for the quarter ended 2026-09-30, **filed 2026-11-16**. Here are the first five moves in the feed's order, which runs from largest position to smallest:

| # | Ticker | Company | Action | Shares (prev → now) | Position value | Filed |
|---|---|---|---|---|---|---|
| 1 | BAC | Bank of America | **Trimmed** | 483.4M → 455.9M (−5.7%) | $24.8B | 2026-11-16 |
| 2 | DAL | Delta Air Lines | **Added** | 57.3M → 64.5M (+12.4%) | $5.4B | 2026-11-16 |
| 3 | DVA | DaVita | **Trimmed** | 28.88M → 28.70M (−0.6%) | $5.0B | 2026-11-16 |
| 4 | LEN | Lennar | **Added** | 13.1M → 26.0M (about doubled) | $2.1B | 2026-11-16 |
| 5 | KR | Kroger | **Trimmed** | 39.0M → 35.0M (−10.3%) | $2.1B | 2026-11-16 |

The same filing has more moves further down the feed:
- **One new position:** Bending Spoons (BSP), 20.7M shares worth about $689M. That's an odd name to see in a 13F, so it's worth checking against the filing on EDGAR.
- **More trims:** VeriSign, from 9.0M to 5.9M shares; Nucor; and Capital One, from 3.0M to 1.15M shares.
- **One more add:** a small one in Macy's.
- **No exits** appear in this filing.

The tiny DaVita trim is listed because the feed includes every position worth $100M or more, not just big share changes. 13F data only shows holdings as of the quarter's end, so the actual trades happened at some point before 2026-09-30. This is for information only, not investment advice.

### market-level

**Yes, US stocks look expensive on both measures.** Both DeepValues indicators put the market in their highest valuation zone.

| Indicator | Reading | Zone | Percentile vs. history | As of |
|---|---|---|---|---|
| **Buffett Indicator** (US corporate equities ÷ GDP) | **255.0%** | Significantly overvalued (above 135%) | **99.7th** | 2026-04-01 |
| **Shiller PE (CAPE)** | **37.21** | Significantly overvalued (above 34) | **92.0th** | 2026-11-24 |

**Buffett Indicator**
- At 255%, it's almost twice the 135% line where "significantly overvalued" starts. It's higher than in about 99.7% of the historical record.
- It jumped from 219% in January 2026 and was up about 43.5% from a year earlier. It's the highest reading in the 5-year history I pulled, above the 2021 peak of about 219%.
- The latest data point is from April 1, 2026, nearly 8 months old, because it relies on quarterly GDP and Fed flow-of-funds data. It may not reflect where the market is today.

**Shiller PE**
- At 37.21, it's well above the 28–34 "modestly overvalued" band and higher than about 92% of history.
- It has come down from a peak of about 42–42.7 in July and August 2026, and fell sharply in November, from around 40 to about 37. It's down about 4.4% from a year ago.
- So it's still very high but falling. The tool's "month-over-month" change of −0.5% actually matches the change from the previous trading day (37.40 to 37.21), not the change over a month.

**What this means:** Both measures say US stocks are priced well above their historical norms. Readings this high have historically been followed by lower-than-average long-term returns. They say little about short-term timing, because markets can stay expensive for years. The most recent signal is that the Shiller PE has eased since summer.

*This is for information only and isn't investment advice.*

### grounded-nvda

**Value investor's take on NVDA (DeepValues ai_context, as of 2026-11-27T14:16:32Z)**

NVIDIA looks like an exceptional franchise: CUDA, its combined chips, networking and software, and developer lock-in give it a wide moat, and it earns a 71.1% gross margin, 107.2% ROIC and 76.3% ROE. At about $165 a share, the reported P/E of 17.73 looks cheap, but only if roughly $9.31 of EPS is what the business can normally earn, and the record doesn't confirm that because it has no normalized free cash flow, net debt, dilution or customer-concentration figures, and no DeepValues intrinsic value. Some well-known funds kept buying through September 30, 2026: Baillie Gifford added to 9.2% of its portfolio, Tiger Global's Chase Coleman to 13.6%, and AQR's Cliff Asness to 3.0%, while D. E. Shaw trimmed. DeepValues' own research rates it WATCH, describing a great business whose valuation support is still incomplete, so a careful value investor would wait for proof of normalized earnings or a lower price before calling this a margin of safety.

---

- **Truncated response:** the tool cut off its own text mid-way through the debate section, so these four sentences rest only on what came back (company overview, 13F moves, filings list, and the executive briefing).
- **Price mismatch:** the 13F values imply about $228 a share at September 30 (for example, AQR's $10,165M for 44.5M shares). The briefing uses $165, and the $3.66T market cap implies something lower. The data doesn't say whether the stock fell or the figures are just inconsistent, so check a current quote before relying on the P/E.
- **Missing fields:** sector and industry came back as "n/a".

This is for information only, not investment advice.

### filings-msft

Microsoft last filed a 10-K on **July 29, 2026**, covering its fiscal year that ended June 30, 2026 ([filing](https://www.sec.gov/Archives/edgar/data/000789019/000119312526323660/msft-20260630.htm)). The one before that was filed on July 30, 2025.

**Other recent filings (newest first, from DeepValues):**

| Filing date | Form | What it is |
|---|---|---|
| 2026-11-05 | 8-K | Current report (event dated Nov 4) |
| 2026-11-04 | 8-K | Current report (event dated Oct 29) |
| 2026-10-28 | 10-Q | Quarterly report for the quarter ended Sep 30, 2026 (Q1 FY27) |
| 2026-10-28 | 8-K (×2) | Current reports filed the same day as the 10-Q, probably the earnings release |
| 2026-10-21 | DEF 14A | Final proxy statement for the shareholder meeting on Dec 8, 2026 |
| 2026-09-02 | 8-K | Current report |
| 2026-07-29 | 8-K | Filed the same day as the 10-K, probably the FY26 Q4 earnings release |
| 2026-07-22 | PX14A6G | Proxy solicitation material filed by a third party, not Microsoft |
| 2026-07-15 | Form 4 | Insider trade report |
| 2026-07-02 | PX14A6G | Proxy solicitation material filed by a third party |
| 2026-07-01 | Form 4 | Insider trade report |
| 2026-06-25 | 11-K (×2) | Annual reports for employee benefit plans |
| 2026-06-12 to 06-16 | Form 4 (×5) | Insider trade reports |

The pattern for the latest round is a 10-Q plus an earnings 8-K on October 28, then a proxy ahead of the December 8 annual meeting, then two more 8-Ks in early November. The data doesn't say what those November 8-Ks are about. The links in the results will show their contents if you want them.

### fundamentals-ko

According to DeepValues, Coca-Cola's (KO) latest annual figures are for **fiscal year 2025**, the period ending December 31, 2025:

| Metric | FY2025 |
|---|---|
| Revenue | $47,941M (~$47.9B) |
| Net income | $13,107M (~$13.1B) |
| Free cash flow | $5,296M (~$5.3B) |

The figures are in millions of USD. DeepValues doesn't state the unit, but that is the only scale that fits KO's size.

Free cash flow is well below net income. Operating cash flow isn't in the data, so I can't say why; DeepValues lists capital spending at $2,112M. The gap looks large enough to check against KO's 10-K before you rely on the FCF figure.

### guru-lookup

I found Li Lu in the DeepValues guru roster under the slug **`li-lu`**.

## Who he is, according to DeepValues

Li Lu is 58 and runs **Himalaya Capital**, a value fund he founded in 1997 and runs from Seattle.

- **Style:** He holds very few stocks for a US fund, often under 10. He keeps them for years and sells very little each year.
- **Best-known move:** In 2008 he introduced BYD to Charlie Munger. It became one of Berkshire Hathaway's most profitable investments outside the US.
- **Background:** He was born in China and helped organise the Tiananmen-era student protests before moving to the US. He sometimes lectures at Columbia Business School, and his lectures get passed around informally as PDFs.
- **Public profile:** DeepValues says the firm publishes no investor letters and that he gives no media interviews.

## Top holdings (13F filing for the quarter ending Sept 30, 2026)

The portfolio is 8 positions worth about **$3.78B** in total. The API didn't return them in order, so I've sorted them by weight:

| # | Ticker | Company | % of portfolio | Value | Change vs. prior quarter |
|---|---|---|---|---|---|
| 1 | PDD | PDD Holdings | 24.24% | $916.7M | **Added** |
| 2 | GOOGL | Alphabet (Class A) | 23.14% | $875.1M | Unchanged |
| 3 | GOOG | Alphabet (Class C) | 22.09% | $835.3M | Unchanged |
| 4 | BRK.B | Berkshire Hathaway | 14.59% | $551.9M | Unchanged |
| 5 | EWBC | East West Bancorp | 9.10% | $344.1M | Unchanged |
| 6 | TME | Tencent Music | 3.11% | $117.6M | **Added** |
| 7 | CROX | Crocs | 2.75% | $104.1M | Unchanged |
| 8 | AAPL | Apple | 0.97% | $36.8M | Unchanged |

**What stands out:**
- **Alphabet is his biggest bet.** Counting both share classes, it's about **45%** of the portfolio.
- **The top four make up about 84%:** Alphabet, PDD and Berkshire.
- **The only changes last quarter were two additions:** he bought more PDD, which is now his largest single holding, and more Tencent Music. He didn't sell anything.

A 13F filing only lists US-listed stocks and is filed up to 45 days after the quarter ends. So it leaves out holdings that trade only abroad, like BYD in Hong Kong, and it may not match what he owns today.

### sentiment-tsla

DeepValues has no TSLA sentiment reading for the last 7 days, so I can't give you a reading or a source mix.

I checked three ways for the 7-day window:

| Source | Bullish / Bearish / Neutral | Posts | Top source |
|---|---|---|---|
| Combined | null / null / null | 0 | none |
| Reddit only | null / null / null | 0 | none |
| StockTwits only | null / null / null | 0 | none |

All three came back with zero posts and no `as_of` timestamp. That points to DeepValues not having sentiment data for TSLA at all, not to sentiment being neutral. It's very unlikely that nobody posted about Tesla for a whole week, so read this as missing data, not as a signal. Don't treat it as a 0% or neutral reading.

From here I can:
- **Try the 30-day or 24-hour window**, in case the 7-day rollup is the only thing missing (each call costs 0.001 credits and counts toward the free daily allowance).
- **Report the gap to DeepValues** with their free `request_data` tool, so they add TSLA sentiment coverage.
- **Get other value-investor signals on TSLA from DeepValues instead**, such as recent guru and smart-money position changes, or a research brief.

### unknown-ticker

DeepValues has no intrinsic value data for ZZZQ. The API returned a 404 "Ticker not found" error, so I can't give you a value and won't estimate one.

The API only covers companies that file with the US SEC, so ZZZQ is either not a real symbol or not a company it covers. If you meant a different company, I can look up the right ticker by company name. I can also send DeepValues a free coverage request for ZZZQ.
