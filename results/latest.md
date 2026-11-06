# DeepValues agent evals, 2026-11-06

9/10 tasks passed. Model: default. Mode: keyless. Cost: $0.77.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | pass | ToolSearch, smart_money_holdings | 14.8 |  |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value, companies_search, intrinsic_value | 31.2 |  |
| buffett-moves | pass | ToolSearch, guru_moves | 18.8 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 21.0 |  |
| grounded-nvda | pass | ToolSearch, ai_context | 15.9 |  |
| filings-msft | pass | ToolSearch, filings, filings | 16.5 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals | 12.0 |  |
| guru-lookup | pass | ToolSearch, gurus, guru | 22.8 |  |
| sentiment-tsla | pass | ToolSearch, sentiment, sentiment | 18.1 |  |
| unknown-ticker | FAIL | ToolSearch, intrinsic_value | 13.6 | answer lacks /(?i)no data|not found|unknown|does ?n[o']t (exist|have)|could ?n[o']t find|no (such|matching)/ |

## Answers

### holders-aapl

The DeepValues data is from the **quarter ending 2026-09-30** (Q3 2026, from 13F-HR filings). You asked for the top three, but only **two** investors on its 60-guru roster held Apple that quarter:

| Rank | Investor (Fund) | Shares | Position value | % of portfolio | Change from prior quarter |
|---|---|---|---|---|---|
| 1 | **Tom Gayner** (Markel Group) | 1,227,290 | ~$408.7M | 3.18% | Unchanged |
| 2 | **Dan Bin** (Oriental Harbor Investment) | 274,351 | ~$91.4M | 6.22% | New position this quarter |

Together the two hold about **$500.1M** of Apple, up 22.35% from the prior quarter. Most of that increase comes from Dan Bin's new position.

Warren Buffett's Berkshire Hathaway, a well-known Apple holder, isn't among the holders the tool returned for this quarter. That could mean it's not in this data for Q3 2026, or that its Apple position isn't counted here. If that matters to you, it's worth checking Berkshire's 13F directly.

This is for information only, not investment advice.

### intrinsic-brkb

**BRK.B is trading slightly above the blended fair value, but that reading is weak because the two models disagree sharply.**

The price is $572.33 (as of Nov 5, 2026). DeepValues lists the ticker as `BRK-B`.

| Method | Conservative | Base | Optimistic |
|---|---|---|---|
| DCF on free cash flow (9.1% discount rate, 4.5% terminal growth) | $128.66 | **$325.70** | $619.42 |
| Owner earnings (Buffett-style, 8.28% discount rate) | $534.66 | **$763.80** | $763.80 |
| Damodaran two-stage | — | not run | — |
| **Blend (equal-weight average of the base values)** | | **$544.75** | |

- **Against the blend:** the price is about 4.8% above the $544.75 blend, which is close to fair.
- **The models don't agree:** the DCF base of ~$326 says the stock is about 43% overvalued. The owner-earnings base of ~$764 says it's about 33% undervalued. The blend only lands near the price because it averages two estimates on opposite sides of it.
- **Why the DCF is likely too low:** free cash flow is a poor fit for Berkshire. A lot of its value comes from insurance float, its equity portfolio and its cash pile, which a DCF on free cash flow mostly misses. Owner earnings is closer to how Buffett himself values the company, though its base and optimistic cases are identical, so it doesn't show a range.
- **Missing pieces:** the Damodaran method wasn't run because it isn't suitable for financial-sector companies. That method also supplies the Monte Carlo confidence ranges, so there are none here. Only two methods feed the blend.

All three of the tool's data-quality checks passed (fresh price, values within a sensible range of the price, consistent currency), so nothing was held back. On these models, Berkshire looks roughly fairly valued to slightly expensive, but the result depends almost entirely on which method you trust. This is data and analysis, not investment advice.

### buffett-moves

DeepValues' five most recent Warren Buffett (Berkshire Hathaway) moves all come from one 13F filing. It covers the quarter ending 2026-06-30 and was filed on **2026-08-14**.

| # | Ticker | Company | Action | Shares (previous → now) | Position value | % of portfolio |
|---|---|---|---|---|---|---|
| 1 | GOOGL | Alphabet Inc. (Class A) | **Added** | 54.25M → 78.79M | ~$28.2B | 9.4% |
| 2 | BAC | Bank of America | **Trimmed** | 513.6M → 483.4M | ~$27.5B | 9.2% |
| 3 | GOOG | Alphabet (Class C) | **Added** | 3.59M → 27.19M | ~$9.6B | 3.2% |
| 4 | DVA | DaVita Inc. | **Trimmed** | 30.10M → 28.88M | ~$6.4B | 2.2% |
| 5 | DAL | Delta Air Lines | **Added** | 39.81M → 57.32M | ~$5.4B | 1.8% |

None of these five are new positions or exits.

- **Combined Alphabet stake:** Adding both share classes, the Alphabet holding grew to about $37.8B, or roughly 12.6% of the portfolio.
- **What gets listed:** DeepValues only lists "material" moves. That means a new position, a full exit, a share count that changed by 25% or more, or a position worth $100M or more. I asked for five rows, so other moves from the same filing may not appear here.
- **Filing delay:** 13F filings come out about 45 days after the quarter ends, so these trades happened by 2026-06-30. The next Berkshire 13F, for Q3, should be filed around mid-November 2026.
- **DeepValues' valuation notes:**
  - It says GOOGL is trading above its estimated value range: "the move has played out."
  - It says the DVA trim was made inside its value range.
  - It doesn't have a valuation for BAC or GOOG.
  - Its estimates for DAL disagree too much to make a call.

These notes are informational only, not investment advice.

### market-level

Yes. By both measures the US market is expensive, near the top of its historical range.

| Indicator | Reading | Zone | Historical percentile | As of |
|---|---|---|---|---|
| **Buffett Indicator** (US corporate equities ÷ GDP) | **255%** | Significantly overvalued (the zone starts above 135%) | **99.7th** | 2026-04-01 |
| **Shiller PE (CAPE)** | **38.79** | Significantly overvalued (the zone starts above 34) | **93.4th** | 2026-11-05 |

**Buffett Indicator**
- 255% is the highest reading in the 5-year history I pulled. It sits far above the tool's "fair value" band of 90–115%.
- It rose about 43.5% year over year and about 16% from the previous data point (January 2026, at about 219%).
- This reading is about 7 months old. It's tied to quarterly GDP and equity data, so it doesn't show any market moves since April.

**Shiller PE**
- 38.79 is well above the tool's "fair value" band of 22–28.
- It has come down from this year's highs of about 42–42.6 in July–August. It's also lower than a year ago (down about 4.7%).
- Most of the latest drop happened on the last day: it went from 40.62 on Nov 4 to 38.79 on Nov 5. That's a large one-day move, so the latest number may get revised.

**What this means:** Both indicators are in their most expensive zone. By history, today's prices imply below-average long-term returns. But these are poor timing tools: the Shiller PE has stayed above 34 for most of the past two years while the market kept rising. The pullback from the summer peak is small compared with how far valuations sit above their historical norms.

This is for information only, not investment advice.

### grounded-nvda

**NVIDIA (NVDA): a value investor's take** *(DeepValues ai_context as of 2026-11-06T14:16:37.531Z)*

NVIDIA is a very high-return business: gross margin is 71.1%, ROE 76.3%, ROA 58.1% and reported ROIC 107.2%, and CUDA plus its full-stack platform create real switching costs. But with a market cap of about $4.45 trillion and the stock at roughly $211–$212, DeepValues' research rates it **WATCH** and says the evidence doesn't show a dependable margin of safety. The key open question is whether the $7.86 of EPS is sustainable owner earnings or a peak in the cycle. Big investors were split as of 2026-06-30, with Baillie Gifford, AQR and Altimeter (19.2% of its portfolio) adding while Citadel, Millennium and Tiger Global trimmed, so a disciplined investor might hold an existing position or start small without leverage and keep most of their cash until cash flow looks stronger or the price is lower.

**Caveats:**
- The big-investor holdings come from 13F filings dated 2026-06-30, so they're more than four months older than the as-of date.
- The context the tool returned was cut off partway through the research section, so I only used what was visible.
- The data doesn't list NVIDIA's sector or industry.
- This is for information only, not investment advice.

### filings-msft

According to DeepValues, Microsoft's most recent 10-K was filed on **July 29, 2026**. It covers the fiscal year that ended June 30, 2026 (accession 0001193125-26-323660, [document](https://www.sec.gov/Archives/edgar/data/000789019/000119312526323660/msft-20260630.htm)). The 10-K before that was filed on July 30, 2025, for fiscal 2025.

**Filings since then (newest first):**

| Filed | Form | Period | What it is |
|---|---|---|---|
| 2026-11-05 | 8-K | 2026-11-04 | Current report |
| 2026-11-04 | 8-K | 2026-10-29 | Current report |
| 2026-10-28 | 8-K | 2026-10-28 | Current report (two filed that day) |
| 2026-10-28 | 10-Q | 2026-09-30 | Quarterly report, Q1 of fiscal 2027 |
| 2026-10-28 | 8-K | 2026-10-28 | Current report |
| 2026-10-21 | DEF 14A | Meeting 2026-12-08 | Final proxy statement for the annual shareholder meeting |
| 2026-09-02 | 8-K | 2026-09-02 | Current report |
| 2026-07-29 | 8-K | 2026-07-29 | Filed the same day as the 10-K |

**Earlier in summer 2026:**
- **PX14A6G** (2026-07-02 and 2026-07-22): Exempt solicitations, usually filed by shareholders campaigning on proxy proposals.
- **Form 4** (2026-06-12 to 2026-07-15): Insider trading reports. There were about 12, including 8 on June 12, and more on June 15 and 16, July 1 and July 15.
- **11-K** (two on 2026-06-25): Annual reports for the employee benefit plans, covering the 2025 plan year.

DeepValues doesn't say what each 8-K is about. The ones filed on October 28 and July 29 match the earnings release dates, so they are probably earnings announcements. I can open any of them to confirm what's in it.

### fundamentals-ko

The latest annual figures in DeepValues for Coca-Cola (KO) are for **fiscal year 2025**, the year ending Dec 31, 2025:

| Metric | FY2025 | FY2024 | Change |
|---|---|---|---|
| Revenue | $47,941M | $47,061M | +1.9% |
| Net income | $13,107M | $10,631M | +23.3% |
| Free cash flow | $5,296M | $4,741M | +11.7% |

The data doesn't state its units. I've assumed millions of USD, since that matches the size of Coca-Cola's reported financials.

Diluted EPS was $3.04 in FY2025, up from $2.46. Free cash flow is well below net income in both years. The data doesn't say why, so check the company's cash flow statement if that gap matters for your analysis.

### guru-lookup

In the DeepValues guru roster Li Lu's slug is `li-lu`, filed under the "value" style.

## Who he is (DeepValues bio)

Li Lu founded **Himalaya Capital** in 1997 and runs it from Seattle. DeepValues says:

- **Style:** He runs a very concentrated portfolio by US-fund standards. It often has fewer than 10 positions, he holds them for years, and annual turnover is in the low single digits.
- **Best-known contribution:** In 2008 he introduced **BYD** to Charlie Munger, and it became one of Berkshire Hathaway's most profitable non-US investments.
- **Background:** He was born in China and helped organise the Tiananmen-era student protests before moving to the US. He lectures now and then at Columbia Business School.
- The bio also says the firm publishes no investor letters and that Li gives no media interviews.

Two parts of the bio look off. It gives his age as 58, but he is usually reported as born in 1966, which would make him about 60 now. And "no media interviews" overstates it, because he has given some public talks and interviews. I'd check these details elsewhere before quoting them.

## Holdings (13F for Q2 2026, quarter ending June 30, 2026)

The portfolio holds 8 stocks worth about **$3.70B**.

| # | Ticker | Company | Value | % of portfolio | Change vs. prior quarter |
|---|---|---|---|---|---|
| 1 | GOOGL | Alphabet Class A | $908.9M | 24.55% | Unchanged |
| 2 | GOOG | Alphabet Class C | $866.1M | 23.39% | Unchanged |
| 3 | PDD | PDD Holdings | $820.9M | 22.17% | **Added** |
| 4 | BRK.B | Berkshire Hathaway | $554.6M | 14.98% | **Added** |
| 5 | EWBC | East West Bancorp | $358.4M | 9.68% | Unchanged |
| 6 | CROX | Crocs | $107.0M | 2.89% | Unchanged |
| 7 | TME | Tencent Music | $55.0M | 1.49% | Unchanged |
| 8 | AAPL | Apple | $32.0M | 0.86% | Unchanged |

**Main points:**
- **Alphabet is about 48% of the portfolio** when you add the two share classes together, making it by far his biggest bet.
- Alphabet, PDD and Berkshire together make up about **85%**.
- This quarter he **added to PDD and Berkshire**. Every other position stayed the same.

13F filings only cover US-listed long positions and are released about 45 days after the quarter ends. Holdings Himalaya keeps outside the US, such as any remaining BYD stake, won't show up here. This is informational only, not investment advice.

### sentiment-tsla

DeepValues has no TSLA sentiment reading for the last 7 days, so I can't give you a reading or a source mix.

The 7-day combined query (Reddit plus StockTwits) came back empty:

- **Bullish / bearish / neutral:** all null
- **Post count:** 0
- **Top source:** none
- **Sample quotes:** none
- **As-of timestamp:** null

The 30-day window was empty in the same way. That makes it unlikely sentiment is just neutral or quiet this week. More likely, DeepValues hasn't scored any TSLA posts yet or isn't tracking the ticker. Its feed only counts value-investor communities, not general retail chatter, and a megacap like TSLA should still show some posts.

If you want, I can pull other DeepValues data on TSLA instead: guru and smart-money position changes, the research brief, or recent news. That would give you a sense of value-investor positioning without the sentiment feed.

### unknown-ticker

DeepValues has no intrinsic value for ZZZQ. The request came back "404 – No intrinsic value data found for ticker ZZZQ," so I can't give you a figure, and I won't estimate one.

ZZZQ may not be a real ticker, or DeepValues may not cover it. If you meant a different symbol or have the company name, I can look it up with the DeepValues company search and get its valuation.
