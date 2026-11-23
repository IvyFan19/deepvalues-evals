# DeepValues agent evals, 2026-11-23

10/10 tasks passed. Model: default. Mode: keyless. Cost: $0.81.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | pass | ToolSearch, smart_money_holdings | 10.1 |  |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value | 11.7 |  |
| buffett-moves | pass | ToolSearch, guru_moves | 11.7 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 14.1 |  |
| grounded-nvda | pass | ToolSearch, ai_context | 14.5 |  |
| filings-msft | pass | ToolSearch, filings, filings | 13.1 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals | 9.3 |  |
| guru-lookup | pass | ToolSearch, gurus, guru | 16.6 |  |
| sentiment-tsla | pass | ToolSearch, sentiment | 9.8 |  |
| unknown-ticker | pass | ToolSearch, intrinsic_value | 7.2 |  |

## Answers

### holders-aapl

In the most recent quarter, **Q3 2026 (13F filings for the quarter ending Sept 30, 2026)**, **27 of DeepValues' 60 tracked investors** held Apple. Together they held about **$97.5B** of AAPL, which is 2.2% less than the previous quarter.

**Top three by position size:**

| # | Investor (Fund) | Shares | Position value | % of their portfolio | Change vs. prior quarter |
|---|---|---|---|---|---|
| 1 | **Warren Buffett** (Berkshire Hathaway) | 227.9M | ~$75.9B | 24.95% | Unchanged |
| 2 | **Duan Yongping** (H&H International) | 21.2M | ~$7.06B | 41.07% | Trimmed ~22% (−5.9M shares) |
| 3 | **Cliff Asness** (AQR Capital) | 20.9M | ~$6.96B | 2.06% | Added ~19% (+3.3M shares) |

- **Position size:** Berkshire's holding alone is about 78% of the AAPL value across all tracked investors.
- **Weight in the portfolio:** Duan Yongping has the most concentrated bet. Apple is 41% of his portfolio, even after he trimmed it.
- **Rest of the list:** The next holders are D. E. Shaw (~$1.67B), Citadel/Ken Griffin (~$1.52B) and Two Sigma (~$1.35B). More of the 27 trimmed their position than added to it. Dan Bin (Oriental Harbor) is the only new buyer. Jim Simons' Renaissance sold almost all of its stake (−99.8%).

13F filings come out up to 45 days after the quarter ends, so these figures reflect positions as of Sept 30 and may have changed since. This is informational only, not investment advice.

### intrinsic-brkb

**The models disagree, so there's no clean answer.** The blended fair value says Berkshire is trading above intrinsic value. The method DeepValues headlines says it's trading below.

BRK.B was at **$570** at the Nov 20, 2026 close.

| Method | Fair value / share (base case) | vs. $570 | Range (conservative to optimistic) |
|---|---|---|---|
| DCF on free cash flow | **$306** | −46% (overvalued) | $122 to $581 |
| Owner Earnings (DeepValues' headline method) | **$676** | **+18.6% (undervalued)** | $473 to $676 |
| Damodaran two-stage | Not produced | — | Skipped because it doesn't suit financial-sector companies |
| **Equal-weight blend** (average of DCF and Owner Earnings) | **$491** | **−13.9% (overvalued)** | — |

**How far apart they are:** the two working models differ by more than 2x ($306 vs. $676), and they disagree on direction. Owner Earnings puts the price below its value; the DCF puts it well above, and the price is above almost all of the DCF's range. Because Damodaran was skipped, there are no Monte Carlo confidence bounds either. The $491 blend is just the average of two estimates that conflict.

**Which to trust more:** I'd lean toward Owner Earnings, which gives a modest discount of about 16% (or about 19% upside). A DCF on free cash flow fits a business like Berkshire poorly. Its cash flow depends on insurance float and gains on its stock holdings, so it tends to understate value. Owner Earnings is also the method DeepValues itself puts forward. Even so, its own conservative case ($473) sits below the current price, so how undervalued it looks depends on your assumptions.

The DeepValues tool notes this is data and analysis, not investment advice.

### buffett-moves

According to DeepValues, Buffett's five most recent moves all come from Berkshire Hathaway's Q3 2026 13F, which covers the quarter ended 2026‑09‑30 and was **filed on 2026‑11‑16**:

| # | Ticker | Company | Action | Shares (prev → now) | Position value |
|---|---|---|---|---|---|
| 1 | BAC | Bank of America | **Trimmed** | 483.4M → 455.9M (−5.7%) | ~$24.8B (8.2% of portfolio) |
| 2 | DAL | Delta Air Lines | **Added** | 57.3M → 64.5M (+12.4%) | ~$5.4B (1.8%) |
| 3 | DVA | DaVita | **Trimmed** | 28.88M → 28.70M (−0.6%) | ~$5.0B (1.7%) |
| 4 | LEN | Lennar | **Added** | 13.1M → 26.0M (+98.6%, about doubled) | ~$2.1B (0.7%) |
| 5 | KR | Kroger | **Trimmed** | 39.0M → 35.0M (−10.3%) | ~$2.1B (0.7%) |

- **No new positions or full exits** are among these five. I asked for only five rows, so the filing may include other moves, possibly new buys or exits, that this list doesn't show.
- **The DaVita trim is very small.** DeepValues lists every position worth $100M or more, so a 0.6% trim still shows up. In its view the shares were sold below its intrinsic value estimate (midpoint about $317 against a current price of about $161).
- **13F data lags.** These trades happened by 2026‑09‑30 but weren't public until 47 days later.

This is for information only, not investment advice.

### market-level

**Yes. Both DeepValues indicators put the US market in their "significantly overvalued" zone, the highest one.**

| Indicator | Reading | Zone | Historical percentile | As of |
|---|---|---|---|---|
| **Buffett Indicator** (US corporate equities ÷ GDP) | **255%** | Significantly overvalued (above 135%) | **99.7th** | 2026-04-01 |
| **Shiller PE (CAPE)** | **36.4** | Significantly overvalued (above 34) | **91.5th** | 2026-11-20 |

**Buffett Indicator.** At 255%, it is almost twice the 135% line where the top zone starts. It is above the 2021 peak of about 219% and is close to the highest reading on record. It rose about 43% over the year to April. The latest reading is from April 1, 2026, about 8 months ago, because the GDP data comes out quarterly and late. It doesn't reflect anything since then. The "MoM" change of +16.2% that the tool reports is actually the change between quarters, from 219 to 255.

**Shiller PE.** This is the more current figure, and it has started to fall. It peaked at about 42.7 in mid-August and was 40.9 a month ago. It dropped sharply last week, from 38.6 to 36.4 over November 18–20. Even after that drop it is still above the 34 line for the top zone and higher than about 91% of history. The tool's change figures look mislabeled: its "MoM" −3.8% is really the one-day move from November 19 to 20. Measured from my own reading of the history, the one-month decline is about 11%.

**Bottom line:** By both measures, US stocks are priced near the top of their historical range. Readings like these have usually been followed by below-average long-term returns. They don't help with timing, though: the market has stayed in the "overvalued" zone on both measures since at least 2021. The recent fall in CAPE is worth watching, but it hasn't brought valuations down to normal levels.

*For information only, not investment advice.*

### grounded-nvda

**NVIDIA (NVDA): a value investor's take** *(DeepValues ai_context, as of 2026-11-23T14:16:00.080Z)*

DeepValues rates NVIDIA **WATCH**. Its research calls the company "an exceptional, asset-light compounder with a powerful full-stack moat, extraordinary profitability, and several credible growth engines," with a market cap of about $3.08 trillion. The main risk it names is not that the business is in trouble but "paying a price based on earnings and margins that may not be normalized." The quoted $126 price and 13.48 P/E imply about $9.35 of earnings per share, but DeepValues says that figure "is not reconciled with the reported $170.5 billion of owner earnings" or with a consistent reporting period and share count, so intrinsic value and the margin of safety can't be pinned down yet. Big investors are buying: Baillie Gifford (9.2% of its portfolio), AQR (3.0%) and Tiger Global (13.6%) all added in the 2026-09-30 filings while D. E. Shaw trimmed. Even so, a disciplined value investor should wait until the earnings base is reconciled and margins are tested against slower growth, customers building their own chips, and gross-margin pressure.

The data itself has an inconsistency. A $3.08 trillion market cap doesn't match a $126 share price at NVIDIA's share count, which supports the briefing's own warning that the valuation inputs aren't reconciled. The context didn't include sector or industry fields either. This is for information only and isn't investment advice.

### filings-msft

According to DeepValues, Microsoft last filed a 10-K on **July 29, 2026**. It covers the fiscal year that ended June 30, 2026 ([filing](https://www.sec.gov/Archives/edgar/data/000789019/000119312526323660/msft-20260630.htm)). The 10-K before that was filed on July 30, 2025.

**Other forms filed recently (newest first):**

| Filing date | Form | Notes |
|---|---|---|
| 2026-11-05 | 8-K | Event date Nov 4, 2026 |
| 2026-11-04 | 8-K | Event date Oct 29, 2026 |
| 2026-10-28 | 8-K (×2) | Filed the same day as the 10-Q, likely the earnings release |
| 2026-10-28 | **10-Q** | Quarter ended Sep 30, 2026 (Q1 of fiscal 2027) |
| 2026-10-21 | **DEF 14A** | Proxy statement for the shareholder meeting on Dec 8, 2026 |
| 2026-09-02 | 8-K | |
| 2026-07-29 | 8-K | Filed the same day as the 10-K, likely the fiscal-year earnings release |
| 2026-07-22 | PX14A6G | Proxy solicitation filed by a shareholder, not by Microsoft |
| 2026-07-02 | PX14A6G | Proxy solicitation filed by a shareholder |
| 2026-07-15, 07-01 | Form 4 | Insider trades |
| 2026-06-12 to 06-16 | Form 4 (×5) | Insider trades |
| 2026-06-25 | 11-K (×2) | Annual reports for employee benefit plans for 2025 |

**Summary:** Since the 10-K, Microsoft has filed one 10-Q (October 28), the proxy for its December 8 annual meeting, and five 8-Ks. The most recent filing is the 8-K from November 5, 2026. The data doesn't say what the 8-Ks are about. The links in the filing list go straight to SEC EDGAR if you want to read one.

### fundamentals-ko

The latest annual figures DeepValues has for Coca-Cola (KO) are for **fiscal year 2025**, the year ended Dec 31, 2025:

| Metric | FY2025 |
|---|---|
| Revenue | $47,941M |
| Net income | $13,107M |
| Free cash flow | $5,296M |

The data doesn't state units, so I've assumed millions of USD, which fits KO's size.

Free cash flow is much lower than net income here. DeepValues reports capex of $2,112M, so its figure implies operating cash flow of about $7.4B. That's well below KO's usual level, so check this number against the 10-K before relying on it.

### guru-lookup

I looked up the guru roster first. Li Lu's slug is **`li-lu`**, and his profile below comes from DeepValues.

## Who Li Lu is
- **Firm:** He founded Himalaya Capital in 1997 and runs it from Seattle.
- **Style:** Value investing with a very concentrated portfolio. He usually holds fewer than 10 positions, keeps them for years and trades very little.
- **Best-known move:** In 2008 he introduced BYD to Charlie Munger. It became one of Berkshire Hathaway's most profitable investments outside the US.
- **Background:** He was born in China and helped organise the student protests around Tiananmen. He later moved to the US and sometimes lectures at Columbia Business School.
- **Public profile:** Himalaya publishes no public investor letters, and DeepValues says Li Lu gives no media interviews.
- **Small data issue:** DeepValues lists his age as 58. He was born in 1966, so he's about 60 now.

## Top holdings (13F filing for Q3 2026, quarter ending 30 Sep 2026)
The portfolio holds 8 positions worth about **$3.78B** in total.

| # | Ticker | Company | Value | % of portfolio | Change this quarter |
|---|---|---|---|---|---|
| 1 | PDD | PDD Holdings | $917M | 24.2% | **Added** |
| 2 | GOOGL | Alphabet (Class A) | $875M | 23.1% | Unchanged |
| 3 | GOOG | Alphabet (Class C) | $835M | 22.1% | Unchanged |
| 4 | BRK.B | Berkshire Hathaway | $552M | 14.6% | Unchanged |
| 5 | EWBC | East West Bancorp | $344M | 9.1% | Unchanged |
| 6 | TME | Tencent Music | $118M | 3.1% | **Added** |
| 7 | CROX | Crocs | $104M | 2.8% | Unchanged |
| 8 | AAPL | Apple | $37M | 1.0% | Unchanged |

**Key points:**
- **Alphabet is his biggest bet.** Counting both share classes, it makes up about **45%** of the portfolio.
- **He added to PDD and Tencent Music this quarter.** PDD is now his largest single ticker. The other six positions didn't change.
- **The portfolio is very concentrated.** Alphabet, PDD and Berkshire together make up about 84%.

A 13F filing only covers US-listed long positions, so it leaves out his non-US holdings. Notably, it doesn't show any BYD shares Himalaya may own in Hong Kong.

### sentiment-tsla

DeepValues has no sentiment reading for TSLA over the last 7 days. I asked its sentiment tool for the combined Reddit and StockTwits rollup, and it came back empty:

- **Reading:** none. The bullish, bearish and neutral percentages are all null.
- **Source mix:** none. It counted 0 posts, named no top source and gave no sample quotes.
- **Date of the data:** none given.

This means DeepValues has no data for this window, not that sentiment is neutral. Either nothing was collected for TSLA, or it hasn't been processed yet.

I can try the 30-day window or query Reddit and StockTwits separately to see if either has posts. I can also file a free `request_data` request with DeepValues to report that TSLA sentiment is missing.

### unknown-ticker

DeepValues has no intrinsic value data for **ZZZQ**. The API returned a 404 ("Ticker not found"), so I can't give you a value and won't estimate one.

The symbol may be mistyped or not exist. It could also be a company DeepValues doesn't cover, since it only covers US SEC filers. If you tell me the company name, I can look up the correct ticker. If you know ZZZQ is a real ticker, I can also send DeepValues a free coverage request for it.
