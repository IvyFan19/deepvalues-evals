# DeepValues agent evals, 2026-11-01

10/10 tasks passed. Model: default. Mode: keyless. Cost: $1.91.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | pass | ToolSearch, smart_money_holdings, smart_money_holdings | 15.9 |  |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value, company_overview, companies_search, companies_search, intrinsic_value, company_overview | 26.6 |  |
| buffett-moves | pass | ToolSearch, gurus, guru_moves | 9.8 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 13.4 |  |
| grounded-nvda | pass | ToolSearch, ai_context | 12.7 |  |
| filings-msft | pass | ToolSearch, filings, filings | 9.6 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals | 5.6 |  |
| guru-lookup | pass | ToolSearch, gurus, guru | 14.6 |  |
| sentiment-tsla | pass | ToolSearch, sentiment, sentiment, sentiment, sentiment | 13.1 |  |
| unknown-ticker | pass | ToolSearch, intrinsic_value, companies_search | 5.1 |  |

## Answers

### holders-aapl

**The most recent quarter with complete data is Q2 2026 (quarter ended June 30, 2026), and its top three Apple holders are Berkshire, H&H International and AQR.** DeepValues' latest quarter is Q3 2026, but it lists only two holders, so it can't give a top three.

**Q2 2026: 27 tracked holders, about $86.6B combined**

| Rank | Investor | Fund | Shares | Position | % of portfolio | Change from prior quarter |
|---|---|---|---|---|---|---|
| 1 | Warren Buffett | Berkshire Hathaway | 227,917,808 | $65.95B | 22.04% | Unchanged |
| 2 | Duan Yongping | H&H International Investment | 27,098,707 | $7.84B | 41.05% | Trimmed 6.38% |
| 3 | Cliff Asness | AQR Capital Management | 17,560,970 | $5.01B | 1.75% | Added 20.33% |

**Q3 2026 (quarter ended September 30, 2026): 2 holders so far, about $500M combined**

| Rank | Investor | Fund | Shares | Position | % of portfolio | Change from prior quarter |
|---|---|---|---|---|---|---|
| 1 | Tom Gayner | Markel Group | 1,227,290 | $408.7M | 3.18% | Unchanged |
| 2 | Dan Bin | Oriental Harbor Investment | 274,351 | $91.4M | 6.22% | New position |

The Q3 list looks partial rather than a sign that the others sold. Q3 13F filings aren't due until around November 14, and today is November 1. Berkshire and the other Q2 holders are probably just missing because they haven't filed yet, though the tool doesn't confirm filing status. The Q3 ranking should change once those filings arrive.

### intrinsic-brkb

**BRK.B is trading almost exactly at DeepValues' fair value, neither meaningfully above nor below it, but the models don't agree.** The blended fair value is **$543.46** against a price of **$543.48**, a gap of 2 cents (-0.003%). Today is Sunday, so that price is presumably Friday's close.

| Method | Conservative | Base | Optimistic | Base vs. price |
|---|---|---|---|---|
| DCF (5-year free cash flow) | $129.09 | **$327.07** | $622.24 | Price is 66% above it |
| Owner Earnings | $531.91 | **$759.86** | $759.86 | Price is 28% below it |
| Damodaran two-stage | none | none | none | Not available for BRK-B |

- **Disagreement:** The two base estimates are about 2.3x apart, with DCF saying overvalued and Owner Earnings saying undervalued. The blend lands near the price only because it averages those two opposite answers, so it isn't confirmation from either model.
- **Where they overlap:** The two ranges overlap at roughly $532–$622, and the current price is near the bottom of that zone. That supports "about fairly valued, perhaps slightly cheap", but only loosely.
- **Band check:** DeepValues' ±25% band around the blend is about $408–$679, so the price sits inside it. The 2.3x gap is under the 3x limit where it would label a stock "too uncertain". I worked this out from the rule in its verdict tool's description, because that tool only runs for a specific guru's move.

**Reasons to be cautious about these numbers:**
- **No Damodaran value:** The blend rests on only two methods, and there are no confidence bounds because those come from the Damodaran Monte Carlo.
- **DCF probably runs low for Berkshire:** A free-cash-flow model likely doesn't capture its large equity portfolio, cash pile and insurance float. This is my judgment, not something the tool reports, but it's why I'd give the $327 less weight.
- **Possible data quirk:** Owner Earnings has the same base and optimistic value, so its upside case adds nothing.
- **Unusually close match:** A blend within 2 cents of the price looks like coincidence, since it does equal the plain average of the two base values. I can't rule out from this output that something circular feeds into it.

The ticker has to be entered as `BRK-B`, because `BRK.B` returns not found. This is informational, not investment advice.

### buffett-moves

DeepValues shows these as Warren Buffett's (Berkshire Hathaway) five most recent moves. All five come from the 13F filed on **2026-08-14**, covering the quarter ended 2026-06-30.

| Ticker | Company | Action | Shares (prior → new) | Position value | Filing date |
|---|---|---|---|---|---|
| GOOGL | Alphabet Class A | Added | 54,249,798 → 78,791,167 | $28.16B | 2026-08-14 |
| BAC | Bank of America | Trimmed | 513,624,165 → 483,394,015 | $27.54B | 2026-08-14 |
| GOOG | Alphabet Class C | Added | 3,585,215 → 27,188,433 | $9.61B | 2026-08-14 |
| DVA | DaVita | Trimmed | 30,100,585 → 28,880,209 | $6.43B | 2026-08-14 |
| DAL | Delta Air Lines | Added | 39,809,456 → 57,320,000 | $5.37B | 2026-08-14 |

- **Other moves in this filing:** I capped the request at five, and the rows came back largest position first. Any smaller moves from the same filing, including new positions or exits, wouldn't appear here. None of these five is a new position or an exit.
- **Timing:** 13F filings are delayed, so these trades happened by 2026-06-30 and were only disclosed 45 days later. They may not reflect what Berkshire holds today.

### market-level

**Yes, the US stock market is expensive: both DeepValues indicators are in their top zone and near the highest levels in their history.**

| Indicator | Reading | Zone | Historical percentile | As of |
|---|---|---|---|---|
| Buffett Indicator (US corporate equities ÷ GDP) | 255.0% | Significantly overvalued (above 135) | 99.7th | 2026-04-01 |
| Shiller PE | 40.13 | Significantly overvalued (above 34) | 98.6th | 2026-10-30 |

- **Distance from fair value:** the Buffett Indicator is about 2.2x the 115 top of its fair-value band. The Shiller PE is about 1.4x the 28 top of its band.
- **Recent trend:** the Shiller PE has stayed around 40 since May 2026. It is down 1.7% from October 1 and up 2.5% from a year ago.

**Data caveats**
- **Buffett reading is stale:** it is a quarterly figure from April 1, seven months old, so it doesn't count as a read on today's market. The Shiller PE is the current one, from two days ago.
- **Buffett change figures look wrong:** the tool reports a 43.5% year-over-year change, but its own history shows 213.3 to 255.0, or about +19.6%. The 43.5% matches a comparison with April 2023 instead. Its 16.2% "month-over-month" change is really quarter-over-quarter, from 219.5 in January. Neither issue affects the level, zone or percentile quoted above.
- **What these measures don't do:** valuation signals like these say little about near-term timing. They can stay elevated for years, as they have here. They are better suited to judging long-run expected returns.

This is informational only, not investment advice.

### grounded-nvda

**NVIDIA (NVDA): value take, per DeepValues ai_context as of `2026-11-01T20:04:44.555Z`**

NVIDIA is an exceptional business: CUDA, networking, systems and developer familiarity create real switching costs, and it reports a 71.1% gross margin, 76.3% ROE and 107.2% ROIC. Quality isn't the same as a bargain, though, and at about $211–$212 per share (a market cap near $4.98 trillion, or roughly 27x EPS by my math) the evidence doesn't establish a dependable margin of safety. The key question is whether the $7.86 EPS represents sustainable owner earnings or unusually favorable cycle earnings, and the smart-money data doesn't settle it: five of the eight listed investors added and three trimmed in filings as of 2026-06-30. DeepValues' stance is therefore WATCH: existing owners can hold within prudent concentration limits, while new investors should take at most a small, unleveraged starter position and save most of their capital for stronger cash-flow evidence or a better price.

**Data limits:**
- **Dates:** the as-of date is when the context was generated. The guru positions are from 2026-06-30, and the undated $211–$212 price and $7.86 EPS come from the research briefing, so they may be older.
- **Truncation:** the briefing cut off partway through its bullish analysis, so I didn't see the rest of it, including any bear case. The caution above comes only from the Executive Briefing.

### filings-msft

Microsoft last filed a 10-K on **July 29, 2026**, for the fiscal year ended June 30, 2026 ([filing](https://www.sec.gov/Archives/edgar/data/000789019/000119312526323660/msft-20260630.htm)). The one before that was filed on July 30, 2025.

**Other recent filings, newest first:**

| Filing date | Form | Notes |
|---|---|---|
| Oct 28, 2026 | 8-K (two filings) | Both dated Oct 28 |
| Oct 28, 2026 | 10-Q | Quarter ended Sept 30, 2026 |
| Oct 21, 2026 | DEF 14A | Proxy statement; lists a Dec 8, 2026 date, likely the annual meeting |
| Sept 2, 2026 | 8-K | |
| July 29, 2026 | 8-K | Filed the same day as the 10-K |
| July 22, 2026 | PX14A6G | Shareholder proxy solicitation notice |
| July 15, 2026 | Form 4 | Insider transaction report |
| July 2, 2026 | PX14A6G | Shareholder proxy solicitation notice |
| July 1, 2026 | Form 4 | Insider transaction report |
| June 25, 2026 | 11-K (two filings) | Annual employee benefit plan reports |
| June 16, 2026 | Form 4 | |
| June 15, 2026 | Form 4 | |
| June 12, 2026 | Form 4 (at least nine) | |

I pulled only the 25 most recent filings, so the list stops at June 12 and there may be more Form 4s from that date. The results don't show what the 8-Ks are about.

### fundamentals-ko

**Coca-Cola (KO), FY2025 (fiscal year ended 2025-12-31)**, the latest annual period in DeepValues:

| Metric | Amount |
|---|---:|
| Revenue | $47,941M |
| Net income | $13,107M |
| Free cash flow | $5,296M |

The API response doesn't state units. I've read the figures as USD millions, which fits KO's scale.

### guru-lookup

**Li Lu's slug in the guru roster is `li-lu`.** DeepValues lists Li Lu as the founder of Himalaya Capital, a value investor who started the firm in 1997 and runs it from Seattle.

- **Style:** The portfolio is highly concentrated, often under 10 positions, with multi-year holding periods and low single-digit annual turnover.
- **Best-known contribution:** Li introduced BYD to Charlie Munger in 2008, which became one of Berkshire Hathaway's most profitable non-US investments.
- **Background:** Li was born in China and organised student protests in the Tiananmen era before moving to the US. Li also lectures occasionally at Columbia Business School.
- **Public profile:** DeepValues says the firm publishes no investor letters and that Li gives no media interviews.

**Holdings as of the June 30, 2026 filing:** there are 8 positions worth about $3.70B. The API doesn't return them in size order, so I sorted them by value.

| # | Ticker | Value | % of portfolio | Shares | Change |
|---|---|---|---|---|---|
| 1 | GOOGL | $908.9M | 24.55% | 2,543,300 | Unchanged |
| 2 | GOOG | $866.1M | 23.39% | 2,451,300 | Unchanged |
| 3 | PDD | $820.9M | 22.17% | 10,761,119 | Added |
| 4 | BRK.B | $554.6M | 14.98% | 1,108,318 | Added |
| 5 | EWBC | $358.4M | 9.68% | 2,776,351 | Unchanged |
| 6 | CROX | $107.0M | 2.89% | 887,093 | Unchanged |
| 7 | TME | $55.0M | 1.49% | 6,590,836 | Unchanged |
| 8 | AAPL | $32.0M | 0.86% | 110,600 | Unchanged |

Alphabet is the largest holding once its two share classes are combined, at about $1.78B or 47.9% of the portfolio. With PDD and Berkshire, the top three companies make up about 85%. PDD and Berkshire were the only positions added to last quarter.

The bio gives Li's age as 58, which looks out of date. This is a 13F-based view, so it covers only US-listed long positions, and the data is as of June 30, four months ago.

### sentiment-tsla

**DeepValues has no sentiment reading for TSLA over the last 7 days, so there's no source mix to report.** The call succeeded, but it returned no data:

| Query | Bullish / bearish / neutral | Posts | Top source | As of |
|---|---|---|---|---|
| Combined, 7d | null | 0 | null | null |
| Reddit, 7d | null | 0 | null | null |
| StockTwits, 7d | null | 0 | null | null |
| Combined, 30d | null | 0 | null | null |

Don't read this as neutral sentiment: the percentages are null, not 0%, and there are no sample quotes.

Zero posts for a ticker as heavily discussed as TSLA, across both sources and even over 30 days, more likely means the sentiment feed isn't populated than that nobody posted. The null `as_of` fits that too, since it suggests there's no snapshot behind the response. That's my inference from these responses; I didn't check other tickers or the pipeline itself, so I can't say whether the gap is specific to TSLA.

### unknown-ticker

DeepValues has no data for ZZZQ, so I can't give an intrinsic value for it.

The intrinsic value lookup returned a 404 ("No intrinsic value data found for ticker ZZZQ"), and a company search for ZZZQ returned zero matches. DeepValues doesn't appear to cover this ticker at all, which may mean it doesn't exist or is mistyped.
