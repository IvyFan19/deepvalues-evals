# DeepValues agent evals, 2026-11-26

10/10 tasks passed. Model: default. Mode: keyless. Cost: $0.98.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | pass | ToolSearch, smart_money_holdings | 17.8 |  |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value | 16.5 |  |
| buffett-moves | pass | ToolSearch, guru_moves | 20.8 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 21.4 |  |
| grounded-nvda | pass | ToolSearch, ai_context | 18.3 |  |
| filings-msft | pass | ToolSearch, filings, filings | 18.7 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals | 17.0 |  |
| guru-lookup | pass | ToolSearch, gurus, guru | 26.3 |  |
| sentiment-tsla | pass | ToolSearch, sentiment, sentiment, sentiment | 24.7 |  |
| unknown-ticker | pass | ToolSearch, intrinsic_value | 11.3 |  |

## Answers

### holders-aapl

The data is from the quarter ending **September 30, 2026** (Q3 2026 13F filings), the most recent one available. In that quarter, **27 tracked investors** held Apple, with about **$97.5B** in AAPL combined. That combined value was 2.23% lower than the previous quarter.

**Top three by position size (USD):**

| # | Investor (Fund) | Shares | Position value | % of their portfolio | Change from prior quarter |
|---|---|---|---|---|---|
| 1 | Warren Buffett (Berkshire Hathaway) | 227.9M | $75.90B | 24.95% | Unchanged |
| 2 | Duan Yongping (H&H International) | 21.2M | $7.06B | 41.07% | Trimmed about 21.8% (−5.9M shares) |
| 3 | Cliff Asness (AQR Capital) | 20.9M | $6.96B | 2.06% | Added about 19.0% (+3.3M shares) |

Berkshire's stake alone is about 78% of the total AAPL value these investors hold. The next largest holders are D. E. Shaw ($1.67B), Citadel ($1.52B) and Two Sigma ($1.35B), and all three trimmed their stakes.

This comes from 13F filings, so it shows positions as of September 30, 2026, not current holdings. It's for information only and isn't investment advice.

### intrinsic-brkb

**The models disagree, so there's no clean answer.** One model puts BRK.B below fair value and the other puts it above. Prices are as of Nov 25, 2026, and the valuations use FY2025 financials.

**Current price: $579.32**

| Method | Fair value (base) | Range (conservative to optimistic) | vs. price |
|---|---|---|---|
| Owner Earnings (DeepValues' headline method) | **$677.09** | $473.96 to $677.09 | ~17% upside, so the stock is **undervalued** |
| DCF on free cash flow | **$306.81** | $121.99 to $582.29 | ~47% downside, so the stock is **overvalued** |
| Damodaran two-stage | n/a | n/a | Not computed: the tool doesn't use it for financial-sector companies |
| **Equal-weight blend** | **$491.95** | n/a | **~15% downside**, so the stock is **above** intrinsic value |

**How to read it:**
- **The two models are about $370/share apart.** Even the DCF's optimistic case ($582) only roughly matches today's price, while Owner Earnings sits above it.
- **The blend says BRK.B is about 15% above intrinsic value.** The figure DeepValues headlines (Owner Earnings) says it's about 17% below. Which one you trust decides the answer.
- **Owner Earnings probably fits Berkshire better.** A plain free-cash-flow DCF tends to undervalue insurance-heavy conglomerates, because insurance float and heavy reinvestment don't show up well in FCF. Owner Earnings is also the measure Buffett himself uses. That's my judgment, not something the tool says.
- **The tool gives no confidence range.** That range comes from the Damodaran model's simulation, which didn't run here, so there's no statistical spread around the blend.

**Bottom line:** By the blended number, BRK.B is trading above intrinsic value. By the Owner Earnings number, it's trading at a modest discount.

This is data and analysis, not investment advice.

### buffett-moves

DeepValues lists these five as Warren Buffett's (Berkshire Hathaway's) most recent moves. All come from the 13F for the quarter ending **2026-09-30**, filed with the SEC on **2026-11-16**.

| # | Ticker | Company | Action | Shares (prev → now) | Change | Position value | % of portfolio |
|---|---|---|---|---|---|---|---|
| 1 | BAC | Bank of America | **Trimmed** | 483.4M → 455.9M | −5.7% | $24.8B | 8.2% |
| 2 | DAL | Delta Air Lines | **Added** | 57.32M → 64.45M | +12.4% | $5.38B | 1.8% |
| 3 | DVA | DaVita | **Trimmed** | 28.88M → 28.70M | −0.6% | $5.02B | 1.7% |
| 4 | LEN | Lennar | **Added** | 13.11M → 26.03M | +98.6% | $2.12B | 0.7% |
| 5 | KR | Kroger | **Trimmed** | 39.0M → 35.0M | −10.3% | $2.05B | 0.7% |

- **No new positions or exits in these five.** They're the top five rows of the feed, and only the top five were requested. The full filing may include others.
- **Why small changes show up:** the feed includes any position of $100M or more, not just big share changes. That's why the 0.6% DaVita trim appears. Lennar, which nearly doubled, is the biggest real change.
- **DeepValues' verdicts:** it thinks DaVita was sold below its estimated value (about $162.77 now against a mid-estimate of about $318). For Delta, Lennar and Kroger its estimates disagree too much to make a call, and it has no valuation for Bank of America.
- **Timing:** 13F filings come out with a delay, here 47 days after the quarter ended. These trades happened sometime on or before 2026-09-30, not on the filing date.

This is for information only, not investment advice.

### market-level

Yes. Both DeepValues indicators put the US market in their highest zone, **"significantly overvalued."**

| Indicator | Reading | Zone | Historical percentile | As of |
|---|---|---|---|---|
| **Buffett Indicator** (US corporate equities ÷ GDP) | **255%** | Significantly overvalued (above 135%) | **99.7th** | 2026-04-01 |
| **Shiller PE (CAPE)** | **37.2** | Significantly overvalued (above 34) | **92.0th** | 2026-11-24 |

**Buffett Indicator**
- At about 255%, it is close to twice the 135% line where "significantly overvalued" starts. Fair value on this scale is roughly 90–115%.
- Only about 0.3% of past readings have been higher.
- It was up about 16% from the previous reading (the series is quarterly) and about 44% from a year earlier.
- **This reading is about 8 months old.** It's from 2026-04-01 because the GDP and equity data behind it are released quarterly and with a lag. Treat it as a reading from spring, not today.

**Shiller PE**
- At 37.2, it is in the top ~8% of its history and above the 34 line where "significantly overvalued" starts. Fair value on this scale is roughly 22–28.
- It has come down from a peak of about 42–42.7 in August 2026 and is down about 4.4% from a year ago. It's still well above its 2022–2023 range of about 27–30.

**Bottom line:** Both measures say US stocks are priced well above their historical norms. The Buffett Indicator is near a record high, and the Shiller PE is in the top decile even after its recent pullback. High readings like these have historically been followed by below-average long-term returns. They have not been reliable for timing when a market will fall.

*This is for information only, not investment advice.*

### grounded-nvda

As of 2026-11-26T14:16:33Z, DeepValues puts NVIDIA's market cap at about $3.66 trillion and describes it as an exceptional franchise, with CUDA, integrated chips, networking and software, and developer lock-in supporting a wide moat. The returns back that up: a 71.1% gross margin, 107.2% ROIC, 76.3% ROE and 58.1% ROA. Still, a trailing P/E of 17.73 at $165 is only cheap if the roughly $9.31 of EPS is normal earning power, and the data has no normalized free cash flow, net debt, dilution, customer concentration or DeepValues intrinsic value to check that. Smart money is mostly adding, including Baillie Gifford at 9.2% of its portfolio and Tiger Global at 13.6% as of 2026-09-30, but a disciplined value investor would follow DeepValues' **WATCH** stance and wait, because modest margin compression or slower hyperscaler spending could cut normalized earnings and remove the margin of safety.

*The ai_context response was truncated partway through its debate section, so this draws only on what came back. This is for information only, not investment advice.*

### filings-msft

Microsoft last filed a 10-K on **July 29, 2026**, covering the fiscal year that ended June 30, 2026 ([filing](https://www.sec.gov/Archives/edgar/data/000789019/000119312526323660/msft-20260630.htm)). The one before it was filed July 30, 2025, for fiscal 2025.

**Filings from June to November 2026 (newest first):**

| Filing date | Form | Period / notes |
|---|---|---|
| 2026-11-05 | 8-K | Event dated Nov 4, 2026 |
| 2026-11-04 | 8-K | Event dated Oct 29, 2026 |
| 2026-10-28 | 8-K (×2) | Two filings that day; earnings were released the same day |
| 2026-10-28 | 10-Q | Q1 FY2027 (quarter ended Sep 30, 2026) |
| 2026-10-21 | DEF 14A | Proxy for the Dec 8, 2026 annual shareholder meeting |
| 2026-09-02 | 8-K | — |
| 2026-07-29 | 10-K | FY2026 annual report |
| 2026-07-29 | 8-K | Filed the same day as the 10-K (FY2026 results) |
| 2026-07-22 | PX14A6G | Proxy material from a shareholder, not from Microsoft |
| 2026-07-02 | PX14A6G | Same kind of shareholder proxy material |
| 2026-06-25 | 11-K (×2) | Annual reports for employee benefit plans, plan year 2025 |
| 2026-07-15, 07-01, 06-16, 06-15, 06-12 (×8) | Form 4 | Insider trades by officers and directors |

**Summary:**
- The most recent periodic report is the 10-Q filed October 28, 2026.
- No filings show up after November 5, 2026.
- The data doesn't say what the 8-Ks are about. The ones filed alongside the 10-K and 10-Q are probably earnings releases, but I'd need to open the documents to confirm that or find out what the others cover.

### fundamentals-ko

According to DeepValues, Coca-Cola's (KO) latest annual figures are for **fiscal year 2025**, the year ended December 31, 2025:

| Metric | FY2025 | FY2024 | Change |
|---|---|---|---|
| Revenue | $47,941M | $47,061M | +1.9% |
| Net income | $13,107M | $10,631M | +23.3% |
| Free cash flow | $5,296M | $4,741M | +11.7% |

- **Units:** DeepValues doesn't label the units. The figures match Coca-Cola's reported scale in millions of USD, so I've read them that way.
- **Free cash flow:** DeepValues calculates it as operating cash flow minus capital spending, which was $2,112M in FY2025.

This data is for information only and isn't investment advice.

### guru-lookup

I found Li Lu in the guru roster under the slug **`li-lu`** and then pulled his profile.

## Who Li Lu is, according to DeepValues

- **Fund:** Himalaya Capital, which he founded in 1997 and runs from Seattle. DeepValues classes his style as value.
- **Age:** 58.
- **Approach:** He runs a very concentrated portfolio by US standards: often fewer than 10 positions, held for years, with low single-digit annual turnover.
- **Best-known contribution:** In 2008 he introduced BYD to Charlie Munger. It became one of Berkshire Hathaway's most profitable non-US investments.
- **Background:** He was born in China and helped organise the Tiananmen-era student protests before moving to the US. He lectures at Columbia Business School now and then, and copies of those lectures circulate informally as PDFs.
- **Public profile:** Himalaya publishes no investor letters, and he gives no media interviews.

## Holdings (13F for Q3 2026, quarter ending 2026-09-30)

The filing lists 8 positions worth about **$3.78B** in total, sorted here by weight:

| # | Ticker | Company | Value | % of portfolio | Change vs. Q2 |
|---|---|---|---|---|---|
| 1 | PDD | PDD Holdings | $916.7M | 24.24% | **Added** |
| 2 | GOOGL | Alphabet (Class A) | $875.1M | 23.14% | Unchanged |
| 3 | GOOG | Alphabet (Class C) | $835.3M | 22.09% | Unchanged |
| 4 | BRK.B | Berkshire Hathaway | $551.9M | 14.59% | Unchanged |
| 5 | EWBC | East West Bancorp | $344.1M | 9.10% | Unchanged |
| 6 | TME | Tencent Music Entertainment | $117.6M | 3.11% | **Added** |
| 7 | CROX | Crocs | $104.1M | 2.75% | Unchanged |
| 8 | AAPL | Apple | $36.8M | 0.97% | Unchanged |

**What stands out:**
- **Alphabet is the largest exposure.** The two share classes together make up about **45%** of the portfolio.
- **PDD is now the largest single line** after he added to it this quarter.
- **The top four (PDD, both Alphabet classes and Berkshire) make up about 84%** of the portfolio.
- **His only buys this quarter were in two China-related companies**, PDD and Tencent Music. Every other position was unchanged.

Keep in mind that a 13F only covers US-listed long positions. This means it may leave out some of his holdings, such as any BYD shares held through Hong Kong. DeepValues provides this data for information only; it isn't investment advice.

### sentiment-tsla

DeepValues has no 7-day value-investor sentiment reading for TSLA, so there's no reading or source mix to give you.

I queried the 7-day window three times: once combined, once for Reddit only and once for StockTwits only. All three came back empty:

| Source | Posts | Bullish / Bearish / Neutral | Top source |
|---|---|---|---|
| Combined | 0 | null / null / null | none |
| Reddit | 0 | null / null / null | none |
| StockTwits | 0 | null / null / null | none |

The `as_of` timestamp was also null, which suggests DeepValues hasn't processed TSLA for this period at all. It doesn't mean value investors were neutral or silent. This rollup filters for value-investor discussion and leaves out general retail chatter, so a heavily traded stock like Tesla can still end up with no results.

I can try the 30-day or 24-hour windows instead, or log a missing-data request with DeepValues through `request_data`, which is free.

### unknown-ticker

DeepValues has no intrinsic value data for ZZZQ. The API returned a 404 "Ticker not found" error, so I can't give you a value, and I won't estimate one.

Possible reasons:
- **The symbol may be wrong or not exist.** If you tell me the company name, I can look up the right ticker with DeepValues' company search.
- **DeepValues may not cover it.** It only covers US SEC filers.

If ZZZQ is a real company you need, I can send DeepValues a free coverage request for it. No account or key is needed.
