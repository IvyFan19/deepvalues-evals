# DeepValues agent evals, 2026-11-09

10/10 tasks passed. Model: default. Mode: keyless. Cost: $0.95.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | pass | ToolSearch, smart_money_holdings | 10.7 |  |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value, ToolSearch, companies_search, intrinsic_value | 16.5 |  |
| buffett-moves | pass | ToolSearch, gurus, guru_moves | 16.0 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 16.1 |  |
| grounded-nvda | pass | ToolSearch, ai_context | 11.2 |  |
| filings-msft | pass | ToolSearch, filings, filings | 11.8 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals | 7.9 |  |
| guru-lookup | pass | ToolSearch, gurus, guru | 14.9 |  |
| sentiment-tsla | pass | ToolSearch, sentiment, sentiment | 9.8 |  |
| unknown-ticker | pass | ToolSearch, intrinsic_value | 7.9 |  |

## Answers

### holders-aapl

DeepValues tracks 60 investors, and only three of them held Apple at the end of the most recent quarter, **Q3 2026 (quarter ending September 30, 2026)**. The data comes from their 13F filings. Ranked by position size:

| # | Investor (Fund) | Shares | Position value | % of their portfolio | Change from Q2 |
|---|---|---|---|---|---|
| 1 | **Baillie Gifford** (Baillie Gifford & Co) | 1,626,854 | ~$541.8M | 0.51% | Cut by 133,737 shares (−7.6%) |
| 2 | **Tom Gayner** (Markel Group) | 1,227,290 | ~$408.7M | 3.18% | No change |
| 3 | **Dan Bin** (Oriental Harbor Investment) | 274,351 | ~$91.4M | 6.22% | New position this quarter |

Together these holdings were worth about $1.04B, up 4.71% from the previous quarter.

- Baillie Gifford's stake is the largest in dollars but makes up less than 1% of its portfolio.
- Apple matters most to Dan Bin's fund, at 6.22% of the portfolio.
- Berkshire Hathaway doesn't appear in this quarter's results.

13F data is reported up to 45 days after the quarter ends, so current positions may be different. This is for information only, not investment advice.

### intrinsic-brkb

By the blended model, BRK.B is trading a little above intrinsic value, about 4% over. The two models that ran disagree sharply, though, so that number isn't very reliable.

**Price:** $570.89 (close on Nov 6, 2026)

| Method | Conservative | Base | Optimistic |
|---|---|---|---|
| DCF on free cash flow (9.06% discount rate, 4.5% terminal growth) | $129.53 | **$328.45** | $625.09 |
| Owner Earnings (8.26% discount rate) | $536.51 | **$766.45** | $766.45 |
| Damodaran two-stage | — | did not run | — |

- **Blended fair value: $547.45**, the plain average of the two base cases. That puts the price about **4.1% above** fair value.
- **The models don't agree.** The DCF base case says the stock is about 42% overvalued. The Owner Earnings base case says it is about 34% undervalued. Their base cases are $438 apart, and the blend lands near the current price mostly because it averages two opposite answers.
- **Why they split:** a free-cash-flow DCF tends to undervalue Berkshire. Its insurance float, big stock portfolio and heavy reinvestment don't show up well in reported free cash flow. Owner Earnings adjusts for reinvestment, which is closer to how Buffett himself values the company. The Damodaran model didn't run because the tool treats Berkshire as a financial company and says that method doesn't suit one. With no Damodaran model there's also no Monte Carlo range, so the only range estimate is the blend itself.
- **Data checks:** the result passed all of the tool's checks (positive value, current price, consistent currency). The models use FY2025 SEC filings.

If you trust Owner Earnings more for a conglomerate like this, the stock looks undervalued. If you go by the blend, it's roughly fairly priced, slightly expensive. Pulling DeepValues' combined summary for BRK-B, which adds major holders and a verdict, would give another view if you want one.

*DeepValues lists Berkshire as `BRK-B`; `BRK.B` returned "not found." This is data and analysis, not investment advice.*

### buffett-moves

According to DeepValues, Berkshire Hathaway's most recent 13F covers the quarter ending June 30, 2026. It was filed on **August 14, 2026**. These are the top five moves it returned:

| # | Ticker | Company | Action | Shares (prev → now) | Position value | Filing date |
|---|---|---|---|---|---|---|
| 1 | GOOGL | Alphabet (Class A) | **Added** | 54.2M → 78.8M (+45%) | ~$28.2B (9.4% of portfolio) | 2026-08-14 |
| 2 | BAC | Bank of America | **Trimmed** | 513.6M → 483.4M (−6%) | ~$27.5B (9.2%) | 2026-08-14 |
| 3 | GOOG | Alphabet (Class C) | **Added** | 3.6M → 27.2M (~7.6×) | ~$9.6B (3.2%) | 2026-08-14 |
| 4 | DVA | DaVita | **Trimmed** | 30.1M → 28.9M (−4%) | ~$6.4B (2.2%) | 2026-08-14 |
| 5 | DAL | Delta Air Lines | **Added** | 39.8M → 57.3M (+44%) | ~$5.4B (1.8%) | 2026-08-14 |

- **No new positions or exits** appear in these five. I asked for only five rows, so the same filing may include other moves (including new buys or exits) that I didn't see.
- **Some rows are small trims of large holdings.** DeepValues lists every position of $100M or more, so trims like BAC (−6%) and DVA (−4%) show up next to the big adds.
- **Newer data is probably coming soon.** The 13F for the quarter ending September 30 is due around November 14, 2026. It wasn't in DeepValues yet.

This is informational only, not investment advice.

### market-level

**Yes. By both DeepValues measures, the US stock market is very expensive, in the top zone of each.**

| Indicator | Current reading | As of | Zone | Historical percentile |
|---|---|---|---|---|
| **Buffett Indicator** (US corporate equities ÷ GDP) | **255%** | 2026-04-01 | Significantly overvalued (above 135%) | **99.7th** |
| **Shiller PE (CAPE)** | **38.9** | 2026-11-06 | Significantly overvalued (above 34) | **93.5th** |

**Buffett Indicator**
- 255% is almost twice the 135% line where the "significantly overvalued" zone begins. Fair value on this scale is 90–115%.
- It is the highest level in the 5-year history the tool returned. It is above the 2021 peak of about 219% and up from about 213% a year earlier.
- **The data is old.** This reading is from April 1, 2026, more than seven months ago, because GDP and equity figures come out quarterly and late.
- The tool's change fields don't match its own history, so I've left them out. It says +43.5% year over year, but the history shows about +19.6%. Its "+16.2% month over month" is really the change from January to April.

**Shiller PE**
- 38.9 is well above the 34 line where "significantly overvalued" begins. Fair value on this scale is 22–28.
- It came down from about 42–42.6 in July and August, with a sharp drop in early November from 40.6 to 38.8. Even so, it is still around the 93rd percentile historically.
- The tool's month-over-month (+0.3%) and year-over-year (−4.8%) figures also don't match its history. Early October was about 41.9 and early November 2025 was about 39.2, so the actual changes are roughly −7% and −0.6%.

**Bottom line:** Both measures put the market in their most expensive zone, and the Buffett Indicator is near the top of its recorded history. Historically, readings this high have been followed by lower long-term returns. They have not been good at predicting when a downturn will happen. Markets can stay expensive for years, as they largely have since 2021.

*This is informational only, not investment advice.*

### grounded-nvda

**A value investor's take on NVIDIA (DeepValues ai_context as of 2026-11-09T14:16:06Z):**

NVIDIA's business quality is hard to argue with: CUDA, full-stack integration and developer familiarity create real switching costs, and current returns are exceptional, with a 71.1% gross margin, 76.3% ROE and 107.2% reported ROIC. Quality isn't the same as a bargain, though. At about $211–$212 a share, a market cap of roughly $4.58 trillion and $7.86 of EPS (about 27x earnings, my own arithmetic from those figures), the main question is whether that EPS is durable owner earnings or a high point in the cycle. Big holders are split: Baillie Gifford added up to 42.6 million shares (9.2% of its portfolio as of 2026-09-30), and Altimeter added to make NVDA 19.2% of its book, while Citadel, Millennium and Tiger Global trimmed in the June quarter. DeepValues' research stance is **WATCH**: existing owners can keep holding within sensible position limits, and new buyers should take at most a small, unleveraged starter position and keep most of their capital back until cash flow is clearly durable or the price offers more margin of safety.

The context excerpt was cut off partway through the risk commentary, so the bear-case details in the full DeepValues briefing aren't reflected here. This is informational only, not investment advice.

### filings-msft

According to DeepValues, Microsoft's most recent 10-K was filed on **July 29, 2026**. It covers the fiscal year ended June 30, 2026 ([filing](https://www.sec.gov/Archives/edgar/data/000789019/000119312526323660/msft-20260630.htm)). The 10-K before that was filed on July 30, 2025, for fiscal 2025.

**Other recent filings (newest first):**

| Filing date | Form | Notes |
|---|---|---|
| 2026-11-05 | 8-K | Event date Nov 4, 2026 |
| 2026-11-04 | 8-K | Event date Oct 29, 2026 |
| 2026-10-28 | 8-K (×2) | Filed the same day as the 10-Q, likely the Q1 FY27 earnings release |
| 2026-10-28 | **10-Q** | Quarter ended Sep 30, 2026 (Q1 FY2027) |
| 2026-10-21 | DEF 14A | Proxy statement for the annual meeting on Dec 8, 2026 |
| 2026-09-02 | 8-K | |
| 2026-07-29 | 8-K | Filed the same day as the 10-K, likely the FY26 earnings release |
| 2026-07-22 | PX14A6G | Third-party proxy solicitation (exempt filing) |
| 2026-07-15 | Form 4 | Insider transaction |
| 2026-07-02 | PX14A6G | Third-party proxy solicitation |
| 2026-07-01 | Form 4 | Insider transaction |
| 2026-06-25 | 11-K (×2) | Annual reports for employee benefit plans |
| 2026-06-12 to 06-16 | Form 4 (×5) | Insider transactions |

Over the last five months, the filings were mostly 8-Ks, plus the annual 10-K, the first-quarter 10-Q, and the proxy statement ahead of the December 8 shareholder meeting. The notes marked "likely" are guesses based on the dates; I didn't open those 8-Ks to check what's in them.

### fundamentals-ko

The latest annual figures in DeepValues are for **fiscal year 2025**, the year ending December 31, 2025.

| Metric | FY2025 | FY2024 | Change |
|---|---|---|---|
| Revenue | $47,941M | $47,061M | +1.9% |
| Net income | $13,107M | $10,631M | +23.3% |
| Free cash flow | $5,296M | $4,741M | +11.7% |

- **Units:** The response doesn't state units. I've read the figures as millions of USD, which matches the scale of Coca-Cola's reported financials.
- **Free cash flow:** This is DeepValues' own `fcf` figure. FY2025 capex was $2,112M.
- **Diluted EPS** for FY2025 was $3.04.

### guru-lookup

I looked up Li Lu in the DeepValues guru roster (slug **`li-lu`**) and pulled his profile.

## Who he is
Li Lu, 58, founded **Himalaya Capital** in 1997 and runs it from Seattle. DeepValues classes him as a **value** investor. According to its bio:

- **He runs a very concentrated portfolio by US-fund standards.** He usually holds fewer than 10 positions, keeps them for years and trades very little (low single-digit annual turnover).
- **He is best known for introducing BYD to Charlie Munger in 2008.** That became one of Berkshire Hathaway's most profitable non-US investments.
- **His background:** he was born in China and helped organise student protests during the Tiananmen era before moving to the US. He sometimes lectures at Columbia Business School, and those lectures circulate informally as PDFs.
- **He keeps a low profile.** Himalaya publishes no public investor letters, and Li gives no media interviews.

## Top holdings (13F for the quarter ending June 30, 2026)
The portfolio is about **$3.70B** across **8 positions**. The API didn't return them in order of size, so I've sorted them by weight:

| # | Ticker | Company | % of portfolio | Value | Change vs. prior quarter |
|---|---|---|---|---|---|
| 1 | GOOGL | Alphabet (Class A) | 24.55% | $908.9M | Unchanged |
| 2 | GOOG | Alphabet (Class C) | 23.39% | $866.1M | Unchanged |
| 3 | PDD | PDD Holdings | 22.17% | $820.9M | **Added** |
| 4 | BRK.B | Berkshire Hathaway | 14.98% | $554.6M | **Added** |
| 5 | EWBC | East West Bancorp | 9.68% | $358.4M | Unchanged |
| 6 | CROX | Crocs | 2.89% | $107.0M | Unchanged |
| 7 | TME | Tencent Music | 1.49% | $55.0M | Unchanged |
| 8 | AAPL | Apple | 0.86% | $32.0M | Unchanged |

**Main points:**
- **Alphabet is the largest holding, at about 48%** when you add the two share classes together.
- **Alphabet, PDD and Berkshire make up about 85%** of the reported portfolio.
- **He added to PDD and Berkshire this quarter.** Every other position stayed the same.

A 13F only covers US-listed long positions, so it won't show any Asian-listed holdings, such as stock traded in Hong Kong. This data is for information only and isn't investment advice.

### sentiment-tsla

DeepValues has no TSLA sentiment reading for the last 7 days, so there's no reading or source mix to give you.

I asked for the 7-day window across both sources (Reddit and StockTwits) and got an empty result:

- **Bullish / bearish / neutral %:** null
- **Posts counted:** 0
- **Top source:** none
- **Sample quotes:** none
- **As-of timestamp:** null

The 30-day window was also empty. Because the as-of field is null, this looks like DeepValues hasn't collected any data for TSLA at all. It doesn't mean value investors are neutral or quiet on Tesla.

If it helps, I can check what value investors are actually doing with TSLA instead. That would use DeepValues' guru holdings and recent position changes, or its research brief on the stock.

### unknown-ticker

DeepValues has no intrinsic value data for ZZZQ. The API returned a 404 "Ticker not found" error, so I can't give you a number and I won't guess one.

ZZZQ may not be a real ticker, or DeepValues may not cover it. If you meant a different company, give me its name and I'll look up the right ticker and try again.
