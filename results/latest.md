# DeepValues agent evals, 2026-11-25

10/10 tasks passed. Model: default. Mode: keyless. Cost: $0.85.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | pass | ToolSearch, smart_money_holdings | 13.3 |  |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value | 11.2 |  |
| buffett-moves | pass | ToolSearch, guru_moves | 14.6 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 18.0 |  |
| grounded-nvda | pass | ToolSearch, ai_context | 16.3 |  |
| filings-msft | pass | ToolSearch, filings, filings | 12.0 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals | 8.3 |  |
| guru-lookup | pass | ToolSearch, gurus, guru | 17.1 |  |
| sentiment-tsla | pass | ToolSearch, sentiment, sentiment, sentiment | 12.8 |  |
| unknown-ticker | pass | ToolSearch, intrinsic_value | 8.1 |  |

## Answers

### holders-aapl

The data is from the **quarter ending September 30, 2026 (Q3 2026)**, the latest 13F quarter available. **27 tracked investors** hold Apple, with about **$97.5B** in AAPL between them. That total is down 2.2% from the prior quarter.

**Top three by position size (USD value):**

| # | Investor (Fund) | Shares | Value | % of Their Portfolio | Change vs. Q2 |
|---|---|---|---|---|---|
| 1 | **Warren Buffett** (Berkshire Hathaway) | 227.9M | ~$75.9B | 24.95% | Unchanged |
| 2 | **Duan Yongping** (H&H International) | 21.2M | ~$7.06B | 41.07% | Trimmed 21.8% |
| 3 | **Cliff Asness** (AQR Capital) | 20.9M | ~$6.96B | 2.06% | Added 19.0% |

- Berkshire's stake alone is about 78% of the AAPL value held by tracked investors.
- Duan Yongping has the most concentrated bet: AAPL is about 41% of their portfolio.
- The next largest holders are D. E. Shaw (~$1.67B), Citadel/Ken Griffin (~$1.52B) and Two Sigma (~$1.35B).
- Jim Simons' Renaissance Technologies sold almost all its shares (−99.8%). Dan Bin's Oriental Harbor opened a new position.

This comes from 13F filings, which are released up to 45 days after the quarter ends, so current holdings may be different. It's for information only, not investment advice.

### intrinsic-brkb

**The models don't agree, so there's no single answer.** One says BRK.B is about 18% below intrinsic value and the other says it's well above. The equal-weight blend puts it about 15% above fair value.

Price: **$577.21** (close on Nov 24, 2026)

| Method | Fair value per share (base) | Range (conservative to optimistic) | vs. price |
|---|---|---|---|
| Owner Earnings (the headline "lead" figure) | **$678.25** | $474.77 to $678.25 | Price is about 15% below; implies about **+17.5%** upside |
| DCF on free cash flow | **$306.17** | $121.79 to $580.98 | Price is about 88% above; implies about **−47%** |
| Damodaran two-stage | Not computed | — | The model isn't run for financial-sector companies |
| **Equal-weight blend** | **$492.21** | — | Implies about **−14.7%** (price is above the blend) |

**How to read it:**
- The figure DeepValues shows as its headline is Owner Earnings, which calls BRK.B undervalued with about 17.5% upside.
- The DCF says it's heavily overvalued. Even its optimistic case ($581) only just reaches the current price. A free-cash-flow DCF tends to undervalue Berkshire, because its insurance float and large investment portfolio don't show up well as free cash flow. That's a known limitation of the method, not something specific to this data.
- With only two methods that are far apart, there were no Monte Carlo confidence bounds, so the $492 blend is just the average of two very different numbers.

**Bottom line:** Owner Earnings, which suits a business like Berkshire better, says it's trading **below** intrinsic value. The simple blend says **above**. I wouldn't treat either one as a firm call. The inputs are FY2025 figures from SEC filings.

*This is data and analysis, not investment advice.*

### buffett-moves

DeepValues' most recent Warren Buffett (Berkshire Hathaway) moves all come from one 13F filing, **filed 2026-11-16**, covering the quarter ended 2026-09-30. Every move in it has the same filing date, so I chose the five largest positions by dollar value:

| # | Ticker | Company | Action | Shares (before → after) | Position value | Filed |
|---|---|---|---|---|---|---|
| 1 | BAC | Bank of America | **Trimmed** | 483.4M → 455.9M | ~$24.8B | 2026-11-16 |
| 2 | DAL | Delta Air Lines | **Added** | 57.3M → 64.5M | ~$5.4B | 2026-11-16 |
| 3 | DVA | DaVita | **Trimmed** | 28.88M → 28.70M | ~$5.0B | 2026-11-16 |
| 4 | LEN | Lennar | **Added** | 13.1M → 26.0M (roughly doubled) | ~$2.1B | 2026-11-16 |
| 5 | KR | Kroger | **Trimmed** | 39.0M → 35.0M | ~$2.05B | 2026-11-16 |

- **No exits:** none of the moves in this filing were full exits.
- **One new position:** Bending Spoons (BSP), 20.7M shares worth about $689M. It's too small to make the top five.
- **Other moves in the same filing:** trims of VeriSign (VRSN), Nucor (NUE) and Capital One (COF), and a small addition to Macy's (M).
- **Prices when traded are missing:** DeepValues doesn't yet have the prices for these trades, so it can't compare those prices to today's.

This comes from 13F filings and only reflects positions as of the quarter-end, 47 days before the filing. It isn't investment advice.

### market-level

Yes. Both DeepValues indicators put the US market in their most expensive zone, **"significantly overvalued."**

| Indicator | Reading | Zone | Historical percentile | As of |
|---|---|---|---|---|
| **Buffett Indicator** (US corporate equities ÷ GDP) | **255.0%** | Significantly overvalued (above 135%) | **99.7th** | 2026-04-01 |
| **Shiller PE (CAPE)** | **37.4** | Significantly overvalued (above 34) | **92.3rd** | 2026-11-23 |

**Buffett Indicator.** At 255%, market value is nearly twice the 135% line where the top zone starts, and about 2.2× the 115% upper edge of "fair value." It is at the very top of its recorded range. The latest reading jumped sharply from 219% the quarter before. It was 153% at the 2022 low, so it has risen about two-thirds since then. One caveat: this data point is almost 8 months old, because it relies on quarterly GDP and equity data. The tool labels the 16.2% rise as month-over-month, but it is really a change between quarters.

**Shiller PE.** At 37.4, CAPE is above every level of the 2021 bubble except its 38.3 peak. It has come down from its 2026 high of about 42.7 in mid-August, and it was around 40 to 41 as recently as late October. So it is near its cheapest point of the past several months, but still well inside the top zone. Two caveats on the tool's output:
- The "+2.6% month-over-month" it reports is really the one-day bounce from 36.44 on Nov 20. Compared with a month ago, CAPE is down about 7–8%.
- The tool doesn't say what history the 92.3rd percentile is measured against. On the full record back to the 1870s, 37.4 would usually sit higher than that. Treat it as "top decile," not an exact rank.

**Bottom line:** Both measures say US stocks are historically expensive. The Buffett Indicator is at a record extreme, and CAPE is roughly in the top 5–8% of history. These gauges are poor at timing the market: they can stay high for years. They have been more useful for predicting low long-run (10-year) returns from these starting levels. This is for information only, not investment advice.

### grounded-nvda

**NVIDIA (NVDA): a value investor's take, based on DeepValues ai_context as of 2026-11-25T14:16:09.553Z**

NVIDIA looks like an exceptional franchise. DeepValues credits its wide moat to CUDA, its integrated chips, networking and software, and developer lock-in, and its returns back that up: 71.1% gross margin, 107.2% ROIC and 76.3% ROE. At about $165 and a reported P/E of 17.73, the $3.81 trillion company looks cheap, but only if roughly $9.31 of EPS is its normal earning power. Modest margin compression or slower hyperscaler spending could cut that figure sharply without damaging the business itself. Several large funds kept buying through the 2026-09-30 quarter, including AQR (44.5M shares), Baillie Gifford (42.6M, 9.2% of its portfolio) and Tiger Global (12M, 13.6% of its portfolio), while D. E. Shaw trimmed. That still doesn't prove a margin of safety, which is why DeepValues rates the stock **WATCH**: outstanding business quality, but incomplete valuation support.

---
Notes on the source data:
- The context doesn't include normalized free cash flow, net debt, dilution, customer concentration or a DeepValues intrinsic value. That missing data is why I don't call it a margin of safety.
- The research briefing was cut off partway through the debate section, so I used only the parts that came back.
- Sector and industry were listed as "n/a."

This is for information only, not investment advice.

### filings-msft

According to DeepValues, Microsoft last filed a **10-K on July 29, 2026**. It covers the fiscal year that ended June 30, 2026 ([filing](https://www.sec.gov/Archives/edgar/data/000789019/000119312526323660/msft-20260630.htm)). The 10-K before that was filed on July 30, 2025.

**Recent filings, newest first:**

| Filing date | Form | Period / notes |
|---|---|---|
| 2026-11-05 | 8-K | Event dated Nov 4, 2026 |
| 2026-11-04 | 8-K | Event dated Oct 29, 2026 |
| 2026-10-28 | 8-K (×2) | Probably the Q1 FY2027 earnings release and a related item (the data doesn't say what they're about) |
| 2026-10-28 | **10-Q** | Quarter ended Sep 30, 2026 (Q1 FY2027) |
| 2026-10-21 | DEF 14A | Proxy statement for the shareholder meeting on Dec 8, 2026 |
| 2026-09-02 | 8-K | Event dated Sep 2, 2026 |
| 2026-07-29 | **10-K** | FY ended Jun 30, 2026 |
| 2026-07-29 | 8-K | Probably the Q4 FY2026 earnings release, filed the same day as the 10-K |
| 2026-07-22 | PX14A6G | Proxy material filed by a shareholder (exempt solicitation) |
| 2026-07-15 | Form 4 | Insider transaction |
| 2026-07-02 | PX14A6G | Proxy material filed by a shareholder (exempt solicitation) |
| 2026-07-01 | Form 4 | Insider transaction |
| 2026-06-25 | 11-K (×2) | Annual reports for employee benefit plans, for plan year 2025 |
| 2026-06-12 to 06-16 | Form 4 (×5) | Insider transactions |

The most recent periodic report is the **10-Q filed on October 28, 2026**. Since then Microsoft has filed only 8-Ks. The data lists no Form 4 insider filings after July 15. DeepValues doesn't describe what each 8-K is about, but the full documents are linked from SEC EDGAR if you want me to look into any of them.

### fundamentals-ko

Coca-Cola's (KO) latest annual figures in DeepValues are for **fiscal year 2025**, which ended December 31, 2025:

| Metric | FY2025 | FY2024 |
|---|---|---|
| Revenue | $47,941M | $47,061M |
| Net income | $13,107M | $10,631M |
| Free cash flow | $5,296M | $4,741M |

The data doesn't state its units. I've read the values as millions of US dollars because the shares outstanding figure (4,313) only makes sense in millions.

FY2024 is included for comparison: revenue grew about 1.9%, net income about 23%, and free cash flow about 12%.

### guru-lookup

I looked up the guru roster first and found Li Lu's slug: `li-lu`.

## Who Li Lu is, according to DeepValues
Li Lu founded **Himalaya Capital** in 1997 and runs it from Seattle. DeepValues describes him this way:
- **Style:** Value. The portfolio is very concentrated for a US fund: often fewer than 10 positions, held for years, with very little trading each year.
- **Best-known move:** He introduced BYD to Charlie Munger in 2008. That became one of Berkshire Hathaway's most profitable investments outside the US.
- **Background:** He was born in China and helped organise the Tiananmen-era student protests before moving to the US. He lectures occasionally at Columbia Business School, and those lectures circulate informally as PDFs.
- **Public profile:** DeepValues says the firm publishes no public investor letters and Li gives no media interviews.

The bio gives his age as 58. He was born in 1966, so that number is probably out of date.

## Holdings (13F filing for the quarter ending Sept 30, 2026)
Reported value is about **$3.78B** across **8 positions**:

| # | Ticker | Company | Value | % of portfolio | Change last quarter |
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
- Alphabet is the largest holding at about **45%** when you add the two share classes together.
- Together with PDD and Berkshire, the top three companies make up about 84% of the portfolio.
- The only changes last quarter were additions to PDD and Tencent Music, both Chinese companies listed in the US. He sold nothing and cut nothing.
- A 13F filing only covers US-listed stocks. Himalaya's best-known Asian holdings, such as BYD's Hong Kong shares, don't appear here.

This is for information only and isn't investment advice.

### sentiment-tsla

DeepValues has no sentiment reading for TSLA over the last 7 days, so there's no reading or source mix to give you.

I checked three ways and all came back empty:

| Source | Window | Posts | Bullish / Bearish / Neutral | Top source | As of |
|---|---|---|---|---|---|
| Combined | 7d | 0 | null / null / null | none | null |
| Reddit | 7d | 0 | null / null / null | none | null |
| StockTwits | 7d | 0 | null / null / null | none | null |

Zero posts on a ticker as widely discussed as TSLA, plus an empty `as_of` timestamp, suggests DeepValues isn't covering TSLA in its sentiment feed right now. I wouldn't read it as a real lack of discussion. These are the only two sources this endpoint offers.

If you want, I can:
- check the 30-day window, in case there's older data;
- report the gap through DeepValues' free `request_data` tool, which their team reviews weekly;
- pull other value-investor signals for TSLA instead, such as which gurus or funds bought or sold it recently, or an intrinsic value estimate.

### unknown-ticker

DeepValues has no intrinsic value data for ZZZQ. The API returned a 404 "Ticker not found" error, so I don't have a number to give you and won't estimate one.

DeepValues only covers US SEC filers. ZZZQ may not be a real ticker, may be listed outside the US, or may just not be covered yet.

If you meant a different company, give me its name and I can look up the right ticker with DeepValues' company search. If you're sure ZZZQ is right and want it covered, I can send DeepValues a coverage request, which is free.
