# DeepValues agent evals, 2026-11-13

9/10 tasks passed. Model: default. Mode: keyless. Cost: $0.90.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | pass | ToolSearch, smart_money_holdings | 45.5 |  |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value | 59.4 |  |
| buffett-moves | pass | ToolSearch, guru_moves | 54.6 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 56.4 |  |
| grounded-nvda | pass | ToolSearch, ai_context | 25.9 |  |
| filings-msft | pass | ToolSearch, filings, filings | 26.3 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals | 21.1 |  |
| guru-lookup | pass | ToolSearch, gurus, guru | 261.0 |  |
| sentiment-tsla | pass | ToolSearch, sentiment, sentiment, sentiment | 58.5 |  |
| unknown-ticker | FAIL | ToolSearch, intrinsic_value | 9.8 | answer lacks /(?i)no data|not found|unknown|does ?n[o']t (exist|have)|could ?n[o']t find|no (such|matching)/ |

## Answers

### holders-aapl

The data is from the quarter ending **September 30, 2026** (13F filings for Q3 2026). DeepValues tracks 60 investors, and 8 of them held Apple that quarter.

**Top three by position size:**

| # | Investor (fund) | Shares | Position value | % of their portfolio | Change from prior quarter |
|---|---|---|---|---|---|
| 1 | **Baillie Gifford** (Baillie Gifford & Co) | 1,626,854 | ~$541.8M | 0.51% | Sold 133,737 shares (−7.6%) |
| 2 | **Tom Gayner** (Markel Group) | 1,227,290 | ~$408.7M | 3.18% | No change |
| 3 | **Dan Bin** (Oriental Harbor Investment) | 274,351 | ~$91.4M | 6.22% | New position |

**The other five holders:**
- Mario Gabelli (GAMCO): ~$39.8M
- Francis Chou (Chou Associates): ~$13.3M, which is 6.29% of the fund and the largest weighting of any holder
- François Rochon (Giverny Capital): ~$4.1M
- Tom Russo (Gardner Russo & Quinn): ~$1.6M
- Jim Simons (Renaissance Technologies): ~$1.1M, after selling 99.8% of its shares this quarter

Together these investors held about $1.10B of Apple, down 30.5% from the prior quarter. Berkshire Hathaway doesn't appear in the results, so either it isn't one of the 60 tracked investors or it didn't report holding Apple for this quarter.

13F filings are reported with a delay of up to 45 days after the quarter ends, so they may not reflect current positions. This is for information only, not investment advice.

### intrinsic-brkb

**The models don't agree, so there's no clear answer. One says Berkshire is undervalued and the other says it's well overvalued.**

Price: **$589.83** (close on Nov 12, 2026).

| Method | Base fair value | vs. price |
|---|---|---|
| Owner Earnings (DeepValues' headline method) | **$671.33** | ~14% **below** fair value (undervalued) |
| DCF on free cash flow | **$302.41** | ~49% **above** fair value (overvalued) |
| Damodaran two-stage | not run | DeepValues doesn't use it for financial companies |
| **Equal-weight blend** (Owner Earnings + DCF) | **$486.87** | ~17% **above** fair value (overvalued) |

**What this means:**
- **The two methods are far apart.** The DCF's base value is less than half the Owner Earnings value. Even the DCF's optimistic case ($573) is below today's price. The Owner Earnings conservative case is $470.
- **The answer depends on which number you use.** The headline Owner Earnings value says the stock trades about 14% under intrinsic value. The blend says it trades about 17% over.
- **Using DeepValues' ±25% band** around the headline value (my own calculation: about $503–$839), $590 sits inside the band. That's closer to "roughly fairly valued" than to a clear bargain.
- **The DCF is probably the weaker estimate here.** A free-cash-flow DCF doesn't capture an insurer-heavy conglomerate well, because it misses things like insurance float and the large cash and investment holdings. Owner Earnings, which is Buffett's own measure, is likely the better fit. The tool doesn't say this; it's my view.
- **There's no range of outcomes to go on.** The range comes from the Damodaran model, which wasn't run.

All values use FY2025 SEC filings. This is data and analysis, not investment advice.

### buffett-moves

According to DeepValues, Warren Buffett's (Berkshire Hathaway's) most recent moves all come from one 13F filing, **filed August 14, 2026**, covering the quarter that ended June 30, 2026. These are the five largest by position size:

| # | Ticker | Company | Action | Shares (previous → new) | Position value |
|---|---|---|---|---|---|
| 1 | GOOGL | Alphabet (Class A) | **Added** | 54.2M → 78.8M (+45%) | ~$28.2B (9.4% of portfolio) |
| 2 | BAC | Bank of America | **Trimmed** | 513.6M → 483.4M (−6%) | ~$27.5B (9.2%) |
| 3 | GOOG | Alphabet (Class C) | **Added** | 3.6M → 27.2M (about 7.6×) | ~$9.6B (3.2%) |
| 4 | DVA | DaVita | **Trimmed** | 30.1M → 28.9M (−4%) | ~$6.4B (2.2%) |
| 5 | DAL | Delta Air Lines | **Added** | 39.8M → 57.3M (+44%) | ~$5.4B (1.8%) |

- **No new or exited positions:** I pulled his latest 10 moves, and none were new positions or full exits. All were adds or trims.
- **Other moves in the same filing:** he trimmed Kroger, Ally Financial and Capital One, and added to Lennar and The New York Times.
- **DeepValues' verdicts:** GOOGL now trades about 135% above DeepValues' estimated value, so it says that move "has played out." DaVita was sold below DeepValues' estimated value. It has no verdict yet for BAC or GOOG. For DAL its estimates disagree too much to call.
- **Next filing:** the Q3 2026 13F is due around November 14, 2026, so newer moves may show up in the next day or so.

This is for information only, not investment advice.

### market-level

Yes. On both DeepValues measures, the US market is expensive compared with its own history.

| Indicator | Reading | Zone | Historical percentile | As of |
|---|---|---|---|---|
| **Buffett Indicator** (US corporate equities ÷ GDP) | **255%** | Significantly overvalued (above 135%) | **99.7th** | 2026-04-01 |
| **Shiller PE** (CAPE) | **40.09** | Significantly overvalued (above 34) | **93.9th** | 2026-11-12 |

**Buffett Indicator**
- 255% is almost twice the 135% line where the "significantly overvalued" zone starts. It's above nearly every past reading.
- It jumped from about 219% in January 2026 to 255% in April 2026, and it was up about 44% from a year earlier. (The tool labels the 16% rise as month-over-month, but this data is quarterly, so it's really the change since January.)
- **This reading is about 7 months old.** It's the latest quarterly data point, so it doesn't show how prices have moved since April.

**Shiller PE**
- 40.09 is well above the 34 line for "significantly overvalued" and above the fair-value range of 22–28.
- It's been between about 38 and 42 since May 2026. It peaked near 42.6 in August and has eased a little since (−0.4% over the month, −1.4% over the year).
- At about 40, it's close to the dot-com peak of roughly 44 and above the 1929 peak of roughly 30.

**Bottom line:** Both measures are in their most expensive zone. Historically, readings this high have been followed by below-average returns over the next 10 years or so. They are poor tools for timing the market over months or even a few years, though. Both have stayed in "overvalued" territory for most of 2021–2026, and the market kept rising.

*This is for information only and isn't investment advice.*

### grounded-nvda

**NVIDIA (NVDA): a value investor's take, using DeepValues ai_context as of 2026-11-13T14:19:01.988Z**

NVIDIA is an outstanding business. DeepValues calls it "an integrated computing platform, not merely a chip supplier," with switching costs built on CUDA, networking and full-stack systems, and it reports a 71.1% gross margin, 76.3% ROE and 107.2% ROIC. A value investor still has to ask what the shares cost, and at roughly $211–$212 (about a $4.07 trillion market cap), DeepValues says the evidence "does not establish a dependable margin of safety." The main open question is whether the $7.86 in EPS is "sustainable owner earnings or unusually favorable cycle earnings." Large investors are split on this: Baillie Gifford and Altimeter added shares while Citadel, Millennium and Tiger Global trimmed. That fits DeepValues' **WATCH** rating, which allows only a small, unleveraged starter position and keeps most capital back until cash flows look more durable or the price falls.

The $4.07 trillion market cap comes from the context's figure of $4,073,981,719,848.63. The DeepValues research text was cut off partway through, so I used only the parts that came back. This is for information only and is not investment advice.

### filings-msft

According to DeepValues, Microsoft last filed a 10-K on **July 29, 2026**. It covers fiscal year 2026, which ended June 30, 2026 ([filing](https://www.sec.gov/Archives/edgar/data/000789019/000119312526323660/msft-20260630.htm)). The 10-K before that was filed July 30, 2025, for fiscal 2025.

**Filings since then (newest first):**

| Filed | Form | Notes |
|---|---|---|
| 2026-11-05 | 8-K | Event dated Nov 4, 2026 |
| 2026-11-04 | 8-K | Event dated Oct 29, 2026 |
| 2026-10-28 | 8-K (×2) | Filed on the same day as the Q1 report, so likely the earnings release |
| 2026-10-28 | **10-Q** | Q1 of fiscal 2027 (quarter ended Sep 30, 2026) |
| 2026-10-21 | DEF 14A | Proxy statement; the listed date of Dec 8, 2026 is probably the annual meeting |
| 2026-09-02 | 8-K | |
| 2026-07-29 | 8-K | Filed on the same day as the 10-K, so likely the Q4/full-year earnings release |

**Earlier in summer 2026:**
- **PX14A6G** (shareholder proxy-solicitation materials): July 2 and July 22
- **Form 4** (insider transactions): June 12 (three filings), June 15, June 16, July 1 and July 15
- **11-K** (employee benefit plan annual reports): two filed June 25

DeepValues doesn't describe what each 8-K is about. The earnings-release labels above are my guesses from the timing; I didn't open the documents. In the window I pulled (the 20 most recent filings), there were no Form 4 filings after July 15, 2026.

### fundamentals-ko

According to DeepValues, Coca-Cola's (KO) latest annual figures are for **fiscal year 2025**, which ended December 31, 2025:

| Metric | FY2025 | FY2024 (for comparison) |
|---|---|---|
| Revenue | $47,941M | $47,061M |
| Net income | $13,107M | $10,631M |
| Free cash flow | $5,296M | $4,741M |

The data doesn't state units. I've read the figures as millions of USD, because that matches KO's revenue of about $48B.

Free cash flow is low next to net income. One reason may be that KO's reported operating cash flow in both years was lowered by large one-off payments.

### guru-lookup

I looked Li Lu up in the DeepValues guru roster: his slug is **`li-lu`**. The figures below come from his latest filing, for the quarter ending June 30, 2026.

## Who he is
Li Lu is a value investor who founded **Himalaya Capital** in 1997 and runs it from Seattle. DeepValues says he's 58 and highlights these points:
- **Very concentrated portfolio:** usually fewer than 10 positions, held for years, with very little trading each year.
- **BYD and Berkshire:** in 2008 he brought BYD to Charlie Munger. It became one of Berkshire Hathaway's most profitable investments outside the US.
- **Background:** he was born in China and helped organise student protests in the Tiananmen era before moving to the US. He sometimes lectures at Columbia Business School.
- **Low profile:** Himalaya publishes no public investor letters, and Li gives no media interviews.

## Top holdings
The portfolio holds 8 positions worth about **$3.70B**.

| # | Ticker | Company | Value | % of portfolio | Change in the quarter |
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
- **Alphabet is the biggest bet.** The two share classes together make up about **48%** of the portfolio.
- **Four names hold about 85% of the money:** Alphabet, PDD, Berkshire and East West Bancorp.
- **He only added to two positions in the quarter:** PDD and Berkshire. He didn't sell or cut anything.

This data comes from 13F filings, which only cover US-listed stocks. So the table doesn't show his holdings listed elsewhere, such as BYD in Hong Kong. Informational only, not investment advice.

### sentiment-tsla

DeepValues has no value-investor sentiment reading for TSLA over the last 7 days.

| Source | Posts | Bullish / Bearish / Neutral | Top source | As of |
|---|---|---|---|---|
| Combined | 0 | null / null / null | none | null |
| Reddit | 0 | null / null / null | none | null |
| StockTwits | 0 | null / null / null | none | null |

All three queries returned zero posts, no percentages, no top source, no sample quotes and no "as of" date. So there's no source mix to report.

This doesn't mean sentiment is neutral. DeepValues simply has nothing for TSLA in this window. TSLA is one of the most-discussed tickers anywhere, and the empty "as of" date suggests the feed isn't running for it, rather than value investors having gone quiet.

I can try the 30-day window, or send DeepValues a free `request_data` note reporting the missing TSLA coverage.

### unknown-ticker

DeepValues has no intrinsic value for **ZZZQ**. The intrinsic value lookup returned a 404 with the message "No intrinsic value data found for ticker ZZZQ," so I can't give you a number and I won't estimate one.

The ticker may be mistyped, or it may not be a real listed symbol. If you meant a different company, give me the name and I'll look up the correct ticker in DeepValues and check that one. If ZZZQ is right and you need it covered, I can send DeepValues a free coverage request.
