# DeepValues agent evals, 2026-11-02

9/10 tasks passed. Model: default. Mode: keyless. Cost: $1.18.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | FAIL | ToolSearch, smart_money_holdings, smart_money_holdings | 15.3 | answer lacks /(?i)apple|AAPL/ |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value, company_overview, companies_search, intrinsic_value, company_overview | 22.1 |  |
| buffett-moves | pass | ToolSearch, gurus, guru_moves | 17.0 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 16.1 |  |
| grounded-nvda | pass | ToolSearch, ai_context | 13.0 |  |
| filings-msft | pass | ToolSearch, filings, filings | 12.1 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals | 6.7 |  |
| guru-lookup | pass | ToolSearch, gurus, guru | 16.3 |  |
| sentiment-tsla | pass | ToolSearch, sentiment, sentiment, sentiment, sentiment | 10.8 |  |
| unknown-ticker | pass | ToolSearch, intrinsic_value, companies_search | 9.0 |  |

## Answers

### holders-aapl

**The most recent quarter is Q3 2026 (ended Sept 30, 2026), but it has only two tracked holders so far, so there isn't a top three yet.** 13F filings for that quarter aren't due until mid-November, and most of the 60 tracked investors don't appear to have filed.

| Rank | Investor | Fund | Shares | Position value | % of portfolio | Change from prior quarter |
|---|---|---|---|---|---|---|
| 1 | Tom Gayner | Markel Group | 1,227,290 | $408.7M | 3.18% | Unchanged |
| 2 | Dan Bin | Oriental Harbor Investment | 274,351 | $91.4M | 6.22% | New position |

**Q3 is misleading on its own:** Gayner ranks first only because the larger holders aren't in the Q3 data yet. Berkshire's absence doesn't mean it sold.

The latest complete quarter is **Q2 2026 (ended June 30, 2026)**, with 27 tracked holders. These are the top three by position size:

| Rank | Investor | Fund | Shares | Position value | % of portfolio |
|---|---|---|---|---|---|
| 1 | Warren Buffett | Berkshire Hathaway | 227,917,808 | $65.95B | 22.04% |
| 2 | Duan Yongping | H&H International Investment | 27,098,707 | $7.84B | 41.05% |
| 3 | Cliff Asness | AQR Capital Management | 17,560,970 | $5.01B | 1.75% |

Q2 is the better guide to who the largest holders are until the Q3 filings are in.

### intrinsic-brkb

**BRK.B is trading almost exactly at the blended fair value of about $543, but the models don't agree.** That figure is the midpoint of two estimates that are far apart, so it doesn't show the stock is fairly priced. The current price is $543.48 (data as of Nov 1, 2026), just $0.02 above the blend, or a -0.003% implied upside.

| Method | Conservative | Base | Optimistic | Base vs. price |
|---|---|---|---|---|
| DCF (5-year free cash flow) | $129.09 | **$327.07** | $622.24 | Stock about 66% above this value |
| Owner Earnings | $531.91 | **$759.86** | $759.86 | Stock about 28% below this value |
| Damodaran | none | none | none | Not produced |
| **Blended (equal-weighted)** | | **$543.46** | | Stock about at this value |

- **Disagreement:** the two base cases are about 2.3x apart, so DCF says overvalued and Owner Earnings says undervalued. That is inside the 3x gap at which DeepValues declares its estimates too uncertain to call. On its ±25% band, which I calculated rather than pulled from the tool, the range is about $408–$679, and the price sits in the middle.
- **Missing model:** Damodaran returned nothing, so the blend rests on two of the three methods. There are also no Monte Carlo confidence bounds, because those come from Damodaran.
- **Which to trust:** I'd lean toward Owner Earnings over the DCF, though I wouldn't take $760 at face value. Free cash flow is a poor fit for an insurance-heavy conglomerate because it doesn't capture insurance float or the investment portfolio well. Even so, the DCF already assumes a generous 4.5% terminal growth rate against a 9.08% discount rate.

The match between the price and the blend looks like a coincidence: the blend is a simple average of the two base values, and I checked that arithmetic. DeepValues lists the stock as `BRK-B`; `BRK.B` returns a not-found error.

This is informational only, not investment advice.

### buffett-moves

According to DeepValues, Berkshire Hathaway's latest 13F was filed on **2026-08-14** and covers the quarter ended June 30, 2026. It shows 15 moves, and these five are the largest buys and sells plus the only new position and the only exit:

| Ticker | Action | Shares (prior → current) | Position value | Filed |
|---|---|---|---|---|
| Alphabet (GOOGL) | Added | 54.2M → 78.8M | $28.2B | 2026-08-14 |
| Bank of America (BAC) | Trimmed | 513.6M → 483.4M | $27.5B | 2026-08-14 |
| Delta Air Lines (DAL) | Added | 39.8M → 57.3M | $5.4B | 2026-08-14 |
| D.R. Horton (DHI) | New | 0 → 3,564 | $0.6M | 2026-08-14 |
| Constellation Brands (STZ) | Exited | 632,890 → 0 | $0 | 2026-08-14 |

- **D.R. Horton:** this stake is tiny for Berkshire, at about $580K, so it isn't a meaningful bet.
- **Alphabet:** Berkshire also added to its GOOG class shares, going from 3.6M to 27.2M shares ($9.6B). That makes Alphabet the biggest buy of the quarter across both share classes.
- **Timing:** 13Fs are filed up to 45 days after quarter-end, so these moves are at least four months old. The next filing, for the September quarter, is due by mid-November.

### market-level

**Yes, the US stock market is expensive today: both indicators are in DeepValues' top zone, "significantly overvalued," at about the 99th percentile of their history.**

| Indicator | Reading | Zone | Percentile vs. history | As of | Top zone starts at |
|---|---|---|---|---|---|
| Buffett Indicator (US corporate equities ÷ GDP) | 255.0% | Significantly overvalued | 99.7th | 2026-04-01 | 135% |
| Shiller PE | 40.13 | Significantly overvalued | 98.6th | 2026-10-30 | 34 |

- **Shiller PE:** This is the more current reading, and it's 18% above the 34 threshold. It's up about 2.5% over the past year and has stayed around 40–41 since May.
- **Buffett Indicator:** This reading is seven months old, and the latest figure looks questionable. It jumped 16% in one quarter, from 219.5% to 255.0%, while the Shiller PE fell from 39.65 to 38.15 over the same period.
- **Data error:** The tool's 43.5% "year-over-year" change is wrong. Its own history shows about 19.6% (213.3% to 255.0%), and 43.5% matches the change over three years. Its "month-over-month" figure of 16.2% is really a quarterly change.

The conclusion holds even if the 255% is overstated, because the prior reading of 219.5% was still far above the 135% threshold.

These measures show that prices are high relative to history, not when they might fall, and valuations can stay high for years. The Shiller PE has been above 34 for most of the period since mid-2024. This is informational only, not investment advice.

### grounded-nvda

**NVIDIA (NVDA): value investor's take, DeepValues `ai_context` as of `2026-11-02T14:16:18.604Z`**

NVIDIA is an exceptional business rather than merely a chip supplier: CUDA, networking, systems and developer familiarity create real switching costs, and the economics show it, with a 71.1% gross margin, 76.3% ROE and 107.2% reported ROIC. The price already reflects much of that quality, as a roughly $4.98 trillion market cap and a share price of about $211–$212 work out to around 27x the $7.86 EPS, and DeepValues finds no dependable margin of safety at that level. The key question is whether that $7.86 reflects sustainable owner earnings or unusually favorable cycle earnings, and the smart-money data can't settle it: five of the eight listed gurus added and three trimmed as of 2026-06-30, with Altimeter at 19.2% of its portfolio. I agree with DeepValues' WATCH stance: existing owners can hold within prudent concentration limits, while new buyers should take at most a small, unleveraged starter position and keep most of their capital for stronger cash-flow evidence or a better price.

**Caveats**
- **Derived figure:** the 27x multiple is my own calculation ($211–$212 ÷ $7.86), not a number from the context.
- **Truncated source:** the research briefing cut off partway through the bullish case, so I didn't see the rest of its risk commentary. I didn't re-pull it with a larger budget because keyless access allows only one call a day.
- **Older data:** the guru positions are from 2026-06-30, about four months before the as-of date.

This is informational only, not investment advice.

### filings-msft

Microsoft last filed a 10-K on **July 29, 2026**, covering the fiscal year ended June 30, 2026. The one before it was filed on July 30, 2025.

These are its other filings from the 30 most recent, which go back to June 9, 2026:

| Filing date | Form | Notes |
|---|---|---|
| Oct 28, 2026 | 10-Q | Quarter ended Sept 30, 2026 |
| Oct 28, 2026 | 8-K (two filings) | Current reports |
| Oct 21, 2026 | DEF 14A | Definitive proxy statement; period listed as Dec 8, 2026 |
| Sep 2, 2026 | 8-K | Current report |
| Jul 29, 2026 | 8-K | Same day as the 10-K |
| Jul 22, 2026 | PX14A6G | Notice of exempt solicitation |
| Jul 2, 2026 | PX14A6G | Notice of exempt solicitation |
| Jun 25, 2026 | 11-K (two filings) | Annual reports for employee benefit plans |

The other 19 filings are Form 4s, which report insider transactions:
- **Jul 15:** 1
- **Jul 1:** 1
- **Jun 16:** 1
- **Jun 15:** 1
- **Jun 12:** 11
- **Jun 10:** 1
- **Jun 9:** 3

This comes from the DeepValues filing index only. I didn't open the documents, so I can't say what the 8-Ks cover.

### fundamentals-ko

Coca-Cola's latest annual figures in DeepValues are for **FY2025** (fiscal year ended 2025-12-31):

| Metric | FY2025 |
|---|---|
| Revenue | $47,941M |
| Net income | $13,107M |
| Free cash flow | $5,296M |

The API response doesn't state units; I read them as US$ millions because that matches the size of KO's reported figures.

### guru-lookup

DeepValues lists Li Lu under the slug `li-lu`, as a value investor who runs **Himalaya Capital**.

**Who he is, according to DeepValues**
- He founded Himalaya Capital in 1997 and runs it from Seattle.
- His portfolio is unusually concentrated for a US fund, often under 10 positions, with multi-year holding periods and low single-digit annual turnover.
- His signature contribution to public markets was introducing BYD to Charlie Munger in 2008. It became one of Berkshire Hathaway's most profitable non-US investments.
- He was born in China and was a Tiananmen-era student-protest organizer before moving to the US.
- He lectures occasionally at Columbia Business School, and those lectures circulate informally as PDFs.
- DeepValues says the firm publishes no public investor letters and that he gives no media interviews.

**Holdings as of the 2026-06-30 filing: 8 positions, about $3.70B in total**

| Ticker | Company | Shares | Value | % of portfolio | Change |
|---|---|---|---|---|---|
| GOOGL | Alphabet Class A | 2,543,300 | $908.9M | 24.55% | Unchanged |
| GOOG | Alphabet Class C | 2,451,300 | $866.1M | 23.39% | Unchanged |
| PDD | PDD Holdings | 10,761,119 | $820.9M | 22.17% | Added |
| BRK.B | Berkshire Hathaway Class B | 1,108,318 | $554.6M | 14.98% | Added |
| EWBC | East West Bancorp | 2,776,351 | $358.4M | 9.68% | Unchanged |
| CROX | Crocs | 887,093 | $107.0M | 2.89% | Unchanged |
| TME | Tencent Music | 6,590,836 | $55.0M | 1.49% | Unchanged |
| AAPL | Apple | 110,600 | $32.0M | 0.86% | Unchanged |

Alphabet's two share classes together make up about 47.9% of the portfolio, and adding PDD and Berkshire brings that to about 85%. The only changes flagged this quarter were additions to PDD and Berkshire.

I sorted the table by position size because DeepValues doesn't return the holdings strictly in that order.

The bio's "58" may be out of date, since Li Lu is generally reported as born in 1966, which would make him about 60 now.

### sentiment-tsla

**DeepValues has no sentiment reading for TSLA over the last 7 days, so there's no source mix to report.** The API call succeeded, but it returned 0 posts.

| Query | Posts | Bullish / bearish / neutral | Top source | As of |
|---|---|---|---|---|
| Combined, 7d | 0 | null | null | null |
| Reddit, 7d | 0 | null | null | null |
| Stocktwits, 7d | 0 | null | null | null |
| Combined, 30d | 0 | null | null | null |

This shouldn't be read as neutral or quiet sentiment. The percentages are null rather than 0, and `as_of` is also null, so no scored snapshot appears to exist for TSLA.

Zero posts in 30 days is implausible for a stock as widely discussed as Tesla. That points to a data gap on the DeepValues side, such as a stalled or unpopulated feed, not a real lack of discussion. I can't confirm the cause from this response.

### unknown-ticker

DeepValues has no data for ZZZQ, so I can't give you an intrinsic value for it.

- **Intrinsic value lookup:** it returned a 404, "No intrinsic value data found for ticker ZZZQ."
- **Company search for "ZZZQ":** it returned 0 matches, so DeepValues doesn't recognize this ticker at all.

The ticker may be mistyped or may not exist, or DeepValues may simply not cover it.
