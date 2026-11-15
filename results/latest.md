# DeepValues agent evals, 2026-11-15

10/10 tasks passed. Model: default. Mode: keyless. Cost: $0.91.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | pass | ToolSearch, smart_money_holdings | 24.0 |  |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value | 17.5 |  |
| buffett-moves | pass | ToolSearch, guru_moves | 20.6 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 15.1 |  |
| grounded-nvda | pass | ToolSearch, ai_context | 14.0 |  |
| filings-msft | pass | ToolSearch, filings, filings | 15.0 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals | 9.7 |  |
| guru-lookup | pass | ToolSearch, gurus, guru | 22.8 |  |
| sentiment-tsla | pass | ToolSearch, sentiment, sentiment, sentiment | 13.9 |  |
| unknown-ticker | pass | ToolSearch, intrinsic_value | 11.0 |  |

## Answers

### holders-aapl

The data is from the **Q3 2026 13F filings (quarter ended 2026-09-30)**, the latest available. **11** of the 60 investors DeepValues tracks held AAPL, with about **$1.24B** combined. That combined total is down 29.9% from the prior quarter.

**Top three by position size:**

| # | Investor (Fund) | Shares | Position value | % of portfolio | Change vs. Q2 |
|---|---|---|---|---|---|
| 1 | Baillie Gifford | 1,626,854 | $541.8M | 0.51% | Trimmed 7.6% |
| 2 | Tom Gayner (Markel Group) | 1,227,290 | $408.7M | 3.18% | Unchanged |
| 3 | George Soros (Soros Fund Management) | 393,680 | $131.1M | 2.47% | Trimmed 25.7% |

**Other holders:** Dan Bin (new $91.4M position, 6.2% of his portfolio), Mario Gabelli, Francis Chou (6.3% of his portfolio), Dodge & Cox, François Rochon, Tom Russo, Jim Simons/Renaissance and Polen Capital. Renaissance sold 99.8% of its shares.

Berkshire Hathaway is not in the list, even though it has historically been one of Apple's largest holders. This result alone doesn't tell me whether Berkshire sold out or just isn't covered, so check that separately if it matters to you.

These are 13F snapshots as of quarter-end, not current holdings. This is not investment advice.

### intrinsic-brkb

**The models disagree, so there's no clear answer.** BRK.B last closed at **$592.94** (Nov 13, 2026). One model says it's undervalued and the other says it's well overvalued.

| Method | Conservative | Base | Optimistic | Base vs. price |
|---|---|---|---|---|
| **Owner Earnings** (the headline value DeepValues shows) | $460.53 | **$657.90** | $657.90 | **+11%** (below intrinsic value) |
| **DCF on free cash flow** (9.35% discount rate, 4.5% terminal growth) | $117.38 | **$292.26** | $552.30 | **−51%** (above intrinsic value) |
| **Damodaran two-stage** | — | not run | — | Not used for financial companies |
| **Equal-weight blend** (DCF + Owner Earnings) | | **$475.08** | | **−20%** (above intrinsic value) |

**How to read it:**
- **Headline view:** DeepValues leads with Owner Earnings. On that model, BRK.B trades about 10% below a fair value of ~$658, a modest margin of safety.
- **Blended view:** Averaging the two models gives ~$475, which puts the stock about 20% above fair value.
- **Why they differ so much:** The DCF uses projected free cash flow of only about $25–33B a year. That likely misses much of Berkshire's value, because it's an insurer that holds a large securities portfolio and float, which free cash flow doesn't capture. That's why it comes out at about half the Owner Earnings figure. Owner Earnings is probably the better fit for Berkshire, but even its conservative case ($461) is below today's price.
- **No uncertainty range:** That range normally comes from the Damodaran model's simulation, and that model wasn't run here.

**Bottom line:** On its preferred method, BRK.B is modestly undervalued. Across both models it's roughly fairly valued to overvalued. The gap between the models is too big to treat any single fair value as solid. For a financial company like Berkshire, a book-value or sum-of-the-parts approach would be a useful cross-check.

*This is data and analysis from DeepValues, not investment advice.*

### buffett-moves

DeepValues' five most recent Warren Buffett (Berkshire Hathaway) moves all come from one 13F filing: the one for the quarter ending June 30, 2026, filed on **2026-08-14**.

| # | Ticker | Company | Action | Shares (before → after) | Position value | Filing date |
|---|---|---|---|---|---|---|
| 1 | GOOGL | Alphabet Inc. (Class A) | **Added** | 54.2M → 78.8M (+45%) | ~$28.2B (9.4% of portfolio) | 2026-08-14 |
| 2 | BAC | Bank of America | **Trimmed** | 513.6M → 483.4M (−6%) | ~$27.5B (9.2%) | 2026-08-14 |
| 3 | GOOG | Alphabet Inc. (Class C) | **Added** | 3.6M → 27.2M (~7.6×) | ~$9.6B (3.2%) | 2026-08-14 |
| 4 | DVA | DaVita Inc. | **Trimmed** | 30.1M → 28.9M (−4%) | ~$6.4B (2.2%) | 2026-08-14 |
| 5 | DAL | Delta Air Lines | **Added** | 39.8M → 57.3M (+44%) | ~$5.4B (1.8%) | 2026-08-14 |

- **No new positions or exits** show up in these five. The two Alphabet share classes together were the biggest buy.
- **Why the small trims appear:** DeepValues lists a move if the share count changed by 25% or more, or if the position is worth $100M or more. The BAC and DaVita trims are small in percentage terms but qualify because the positions are so large.
- **The next filing may be out already.** The 13F for the quarter ending September 30 was due around 2026-11-14, but DeepValues doesn't have it yet. Its moves could replace these once it's added.

This is informational only, not investment advice.

### market-level

Yes. Both indicators put the US stock market in their most expensive zone.

| Indicator | Reading | Zone | Percentile vs. history | As of |
|---|---|---|---|---|
| **Buffett Indicator** (US corporate equities ÷ GDP) | **255%** | Significantly overvalued (above 135%) | **99.7th** | 2026-04-01 |
| **Shiller PE** (CAPE) | **39.95** | Significantly overvalued (above 34) | **93.8th** | 2026-11-13 |

**Buffett Indicator**
- At 255%, it is nearly double the 135% line where "significantly overvalued" starts. Fair value is around 115% or below.
- It is up 43.5% year over year, and the latest reading is its highest in the 5-year history I pulled. The previous high was about 229% in Oct 2025.
- **The data is old:** the latest reading is from April 1, 2026, about 7½ months ago, because GDP figures are reported quarterly and late. The tool labels the jump from 219% to 255% as "month-over-month," but the data is quarterly, so that is really a one-quarter change.

**Shiller PE**
- This reading is current, as of Nov 13, 2026. At 39.95, it is about 6 points above the "significantly overvalued" line of 34. Fair value runs roughly 22–28.
- It has eased a little from its 2026 highs of about 42–42.6 in July and August. It is down 0.3% over the past month and 2.3% over the past year.
- It has been above 34 almost continuously since mid-2024.

**Bottom line:** By both measures, US stocks are more expensive than at almost any point on record. Historically, readings this high have come before weaker long-term returns. They have not been reliable for timing the market in the short term, though; valuations can stay high for years.

*This is information only, not investment advice.*

### grounded-nvda

**NVIDIA (NVDA): a value investor's take** (DeepValues ai_context, as of **2026-11-15T14:16:30.905Z**)

NVIDIA is an exceptional business: CUDA, its software tools, networking and full systems make it costly for customers to switch, and a 71.1% gross margin with 107.2% ROIC shows strong pricing power and very efficient use of capital. The long-term risk isn't share-price swings but the chance that cloud providers' in-house chips, competition in inference and a concentrated customer base wear down its ability to keep raising prices. With a market cap of about $3.99 trillion, DeepValues' research rates it **WATCH**, because its source data quotes conflicting prices of $163, $220 and $230+ without matching per-share free cash flow, net cash or stock compensation for the same date, so a margin of safety can't be confirmed. Big investors are split: Baillie Gifford added to 42.6M shares (9.2% of its portfolio) as of 9/30, while Millennium, Citadel and Tiger Global trimmed as of 6/30. Under DeepValues' plan, a starter position is only worth taking near $163 with $6–8 of normalized free cash flow per share, and not at $220–230.

The context block doesn't say what NVDA is trading at today, so check the live price before acting on the $163 versus $220–230 thresholds. This is informational only, not investment advice.

### filings-msft

According to DeepValues, Microsoft last filed a 10-K on **July 29, 2026**. It covers fiscal year 2026, which ended June 30, 2026 ([filing](https://www.sec.gov/Archives/edgar/data/000789019/000119312526323660/msft-20260630.htm)). The 10-K before that was filed July 30, 2025.

**Other recent filings, newest first:**

| Filing date | Form | Notes |
|---|---|---|
| 2026-11-05 | 8-K | Event dated Nov 4 |
| 2026-11-04 | 8-K | Event dated Oct 29 |
| 2026-10-28 | 8-K (two filings) | Same day as the 10-Q; probably the FY27 Q1 earnings release and a related filing |
| 2026-10-28 | 10-Q | Quarterly report for the quarter ended Sep 30, 2026 |
| 2026-10-21 | DEF 14A | Proxy statement for the annual meeting on Dec 8, 2026 |
| 2026-09-02 | 8-K | |
| 2026-07-29 | 8-K | Same day as the 10-K; probably the FY26 Q4 earnings release |
| 2026-07-22 | PX14A6G | Shareholder voting material filed by an outside party |
| 2026-07-15 | Form 4 | Insider transaction |
| 2026-07-02 | PX14A6G | Shareholder voting material filed by an outside party |
| 2026-07-01 | Form 4 | Insider transaction |
| 2026-06-25 | 11-K (two filings) | Annual reports for employee benefit plans |
| 2026-06-12 to 06-16 | Form 4 (five filings) | Insider transactions |

Overall, Microsoft is on its usual schedule: a 10-K in late July, a 10-Q in late October, a proxy statement in October ahead of a December annual meeting, and regular 8-Ks and insider Form 4s. The DeepValues data only gives form types and dates. I haven't opened the 8-Ks, so the earnings-release labels are guesses based on their timing.

### fundamentals-ko

DeepValues' latest annual figures for Coca-Cola (KO) are for **fiscal year 2025**, the year ending December 31, 2025:

| Metric | FY2025 | FY2024 |
|---|---|---|
| Revenue | $47,941M | $47,061M |
| Net income | $13,107M | $10,631M |
| Free cash flow | $5,296M | $4,741M |

The figures are in millions of US dollars. The API didn't state the units, but I inferred them from the size of the numbers.

From FY2024 to FY2025, revenue grew about 1.9%, net income about 23% and free cash flow about 12%.

### guru-lookup

I found him in the roster under the slug **`li-lu`**.

## Who Li Lu is, according to DeepValues

- **Fund:** Himalaya Capital, which he founded in 1997. It's based in Seattle, and DeepValues classes him as a value investor.
- **Approach:** His portfolio is very concentrated for a US fund. It often has fewer than 10 positions, he holds them for several years, and he trades very little.
- **Best-known contribution:** In 2008 he introduced BYD to Charlie Munger. It became one of Berkshire Hathaway's most profitable investments outside the US.
- **Background:** He was born in China and helped organise the Tiananmen-era student protests before moving to the US. He sometimes lectures at Columbia Business School, and those lectures circulate informally as PDFs.
- **Size:** His latest filing covers the quarter ending June 30, 2026. It shows 8 positions worth about **$3.70B**.

A few details in the DeepValues bio may be out of date. It gives his age as 58, but he was born in 1966, so he would be about 60 now. It also says he "gives no media interviews" and publishes nothing for the public. Neither quite fits his record: he has given talks and interviews, and he has published writing.

## Holdings as of June 30, 2026

| # | Ticker | Company | Value | % of portfolio | Change vs. prior quarter |
|---|---|---|---|---|---|
| 1 | GOOGL | Alphabet (Class A) | $908.9M | 24.55% | Unchanged |
| 2 | GOOG | Alphabet (Class C) | $866.1M | 23.39% | Unchanged |
| 3 | PDD | PDD Holdings | $820.9M | 22.17% | **Added** |
| 4 | BRK.B | Berkshire Hathaway | $554.6M | 14.98% | **Added** |
| 5 | EWBC | East West Bancorp | $358.4M | 9.68% | Unchanged |
| 6 | CROX | Crocs | $107.0M | 2.89% | Unchanged |
| 7 | TME | Tencent Music | $55.0M | 1.49% | Unchanged |
| 8 | AAPL | Apple | $32.0M | 0.86% | Unchanged |

**What stands out:**
- **Alphabet is the largest position.** Counting both share classes, it makes up about **48%** of the portfolio, or roughly $1.78B.
- **Four positions make up about 85%** of the portfolio: Alphabet, PDD and Berkshire. That fits the concentrated style described above.
- **He added to only two positions this quarter**, PDD and Berkshire. Both are now large stakes, while the other six didn't change.

This is a US 13F filing, so it shows only his US-listed long positions. Himalaya's holdings in Asia, such as BYD or other shares listed in Hong Kong or China, may not appear in it. The next quarterly filing (for Q3 2026) would normally have been due around mid-November, but DeepValues hasn't loaded it yet.

### sentiment-tsla

DeepValues has no sentiment data for TSLA over the last 7 days, so there's no reading and no source mix to give.

I queried the 7-day window three ways: Reddit, StockTwits and the combined rollup. All three came back the same:

| Source | Posts | Bullish | Bearish | Neutral | Top source | As of |
|---|---|---|---|---|---|---|
| Combined | 0 | — | — | — | — | — |
| Reddit | 0 | — | — | — | — | — |
| StockTwits | 0 | — | — | — | — | — |

The fields are null, not zero, so this is missing coverage. It doesn't mean sentiment was neutral. The `as_of` timestamp is also null, which suggests the sentiment feed for TSLA hasn't been filled in, not that there was simply no discussion. That's very unlikely for a ticker as widely discussed as Tesla.

Options:
- **Try a longer window:** I can check the 30-day window, though it may be empty for the same reason.
- **Report the gap:** I can send a free `request_data` report to DeepValues saying TSLA sentiment is missing.
- **Use other DeepValues data:** recent buying and selling by well-known value investors ("gurus") and institutional holders, or the news feed, would show how they view TSLA.

### unknown-ticker

DeepValues has no intrinsic value data for ZZZQ. The API returned a 404 "Ticker not found" error, so I don't have a valuation to give you and I won't estimate one.

ZZZQ may not be a real listed ticker, or DeepValues may just not cover it. If you meant a different ticker, I can look it up with DeepValues' company search. If ZZZQ is real and you need it covered, DeepValues lets you ask them to add it for free. I haven't sent that request, so tell me if you want me to.
