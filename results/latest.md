# DeepValues agent evals, 2026-11-20

10/10 tasks passed. Model: default. Mode: keyless. Cost: $0.85.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | pass | ToolSearch, smart_money_holdings | 9.6 |  |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value | 13.5 |  |
| buffett-moves | pass | ToolSearch, guru_moves | 13.9 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 14.4 |  |
| grounded-nvda | pass | ToolSearch, ai_context | 14.0 |  |
| filings-msft | pass | ToolSearch, filings, filings | 10.7 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals | 7.4 |  |
| guru-lookup | pass | ToolSearch, gurus, guru | 15.2 |  |
| sentiment-tsla | pass | ToolSearch, sentiment, sentiment | 10.3 |  |
| unknown-ticker | pass | ToolSearch, intrinsic_value | 7.6 |  |

## Answers

### holders-aapl

According to DeepValues, **27 of the investors it tracks** held Apple in the latest 13F quarter, which ended **September 30, 2026 (Q3 2026)**. Their combined AAPL holdings were worth about $97.5B, down 2.2% from the previous quarter.

**Top three by position size (USD value):**

| # | Investor (Fund) | Shares | Position Value | % of Portfolio | Change from Q2 |
|---|---|---|---|---|---|
| 1 | Warren Buffett (Berkshire Hathaway) | 227.9M | ~$75.9B | 24.95% | No change |
| 2 | Duan Yongping (H&H International) | 21.2M | ~$7.06B | 41.07% | Sold 5.9M shares (−21.8%) |
| 3 | Cliff Asness (AQR Capital) | 20.9M | ~$6.96B | 2.06% | Bought 3.3M shares (+19.0%) |

- **Berkshire alone holds about 78%** of the tracked total.
- **Duan Yongping** is the most concentrated holder: Apple is 41% of his portfolio.
- **Other holders,** in order of size, include D. E. Shaw (~$1.67B), Citadel (~$1.52B), Two Sigma (~$1.35B) and Gotham/Greenblatt (~$1.0B).
- **Notable changes:** Dan Bin's Oriental Harbor opened a new position. Renaissance sold almost all of its stake (−99.8%).

13F filings come out up to 45 days after the quarter ends, so these positions may have changed since September 30.

### intrinsic-brkb

**It depends on which model you use, and they don't agree.** BRK.B closed at **$572.04** on Nov 19, 2026. DeepValues' two working models put fair value on opposite sides of that price.

| Method | Fair value / share | vs. price |
|---|---|---|
| **Owner Earnings** (the one DeepValues headlines) | **$664.54** (range $465–$665) | **~16% undervalued** |
| DCF on free cash flow | $296.95 (range $119–$562) | ~48% overvalued |
| Damodaran two-stage | not computed | — |
| **Equal-weight blend** of the two | **$480.75** | **~16% overvalued** |

**Do they agree?** No.
- **The two models are about $370/share apart.** The DCF says BRK.B is overvalued even in its best case: its high estimate of $562 is still below the price.
- **Owner Earnings says it's undervalued** at its central estimate. Its low end ($465) is below the price, so it doesn't support that call in every scenario.
- **The third model didn't run.** DeepValues skips the Damodaran method for financial companies, so there's no tiebreaker. There's also no Monte Carlo range, because that comes from the Damodaran model.

**Which one is more useful here:** Owner Earnings, I'd say. A plain free-cash-flow DCF fits Berkshire poorly. Much of its value comes from insurance float (premiums it holds and invests before paying claims) and its large investment portfolio, and a cash-flow projection doesn't capture either well. That pulls both the DCF and the blend down. Owner Earnings is Buffett's own measure, which is likely why DeepValues headlines it. Even so, its low estimate sits below the price, so treat this as "modestly undervalued, depending on assumptions," not a strong signal.

**Bottom line:** BRK.B is roughly 16% below the Owner Earnings fair value of $665 and roughly 16% above the blended value of $481. Neither result is clear enough to call it decisively cheap or expensive. The valuations are based on FY2025 SEC filings.

This is data and analysis, not investment advice.

### buffett-moves

DeepValues' latest Warren Buffett (Berkshire Hathaway) moves all come from one 13F filing. It was filed **2026-11-16** and covers the quarter ended 2026-09-30. Here are the first five moves the feed returned, which happen to be the five largest positions:

| # | Ticker | Company | Action | Shares (before → after) | Position value |
|---|---|---|---|---|---|
| 1 | BAC | Bank of America | **Trimmed** | 483.4M → 455.9M | ~$24.8B |
| 2 | DAL | Delta Air Lines | **Added** | 57.3M → 64.5M | ~$5.4B |
| 3 | DVA | DaVita | **Trimmed** | 28.88M → 28.70M | ~$5.0B |
| 4 | LEN | Lennar | **Added** | 13.1M → 26.0M (about doubled) | ~$2.1B |
| 5 | KR | Kroger | **Trimmed** | 39.0M → 35.0M | ~$2.1B |

None of these five is a new position or an exit. The same filing also includes:
- **New:** Bending Spoons (BSP), 20.7M shares, about $689M. That's an unusual name for Berkshire, so check it against the actual 13F on EDGAR before relying on it.
- **Trimmed:** VeriSign (VRSN; 9.0M → 5.9M shares), Nucor (NUE) and Capital One (COF; 3.0M → 1.15M shares).
- **Added:** Macy's (M).

The DaVita "trim" is only about 0.6% fewer shares. It shows up because the feed lists every position worth $100M or more, not just large share changes. The feed returned no exits.

This is informational only, not investment advice.

### market-level

**Yes, by both measures the US stock market is very expensive.** Both tools put it in their top "significantly overvalued" zone.

| Indicator | Reading | Zone | Historical percentile | As of |
|---|---|---|---|---|
| **Buffett Indicator** (US corporate equities ÷ GDP) | **255%** | Significantly overvalued (above 135%) | **99.7th** | 2026-04-01 |
| **Shiller PE (CAPE)** | **37.9** | Significantly overvalued (above 34) | **92.6th** | 2026-11-19 |

**Buffett Indicator**
- At 255%, it is nearly double the 135% line where the top zone starts. It's also about 2.2× the 115% top of the fair-value range.
- Only about 0.3% of past readings have been higher.
- It jumped from 219% in January 2026 to 255% in April. That's about 16% in one quarter and about 20% above the 2021 peak of roughly 219%.
- **The data is old.** The latest reading is from April 1, about 7½ months ago, because it depends on quarterly GDP and Fed data. Use it as a sign of the general level, not today's number.

**Shiller PE**
- 37.9 is above the 34 line where the top zone starts and about 35% above the 28 top of the fair-value range. About 92.6% of past readings have been lower.
- It is coming down from its recent high. It peaked around 42–42.7 in mid-July and mid-August 2026 and has fallen about 11% since then, including a drop from about 40 to 37.9 in November.
- Even after that drop, it's at roughly the same level as late 2021 (about 38), just before the 2022 decline.

**What this means:** Both indicators say US stocks are priced far above their historical norms. The Shiller PE is the more current of the two, and it shows prices easing a bit lately but still in the overvalued zone.

Neither indicator is good at predicting what happens in the next year; markets can stay expensive for a long time. Historically, readings this high have been followed by below-average returns over the next 10 or so years.

This is for information only, not investment advice.

### grounded-nvda

Pulled from the DeepValues ai_context for NVDA, **as of 2026-11-20T14:16:02Z**:

NVIDIA is the kind of business a value investor would love to own: DeepValues credits it with a real moat in CUDA, developer adoption, networking and full-stack accelerated computing, plus a 71.1% gross margin, very high returns on capital and no sign of financial distress. The problem is the price, not the company. At about $156 a share (a market cap of roughly $3.58 trillion), the free-cash-flow yield is only about 2.6%, which seems to require low-to-mid-teens cash-flow growth for many years while margins stay unusually high. The reported 19.74 P/E looks cheap but conflicts with that cash-flow figure, and DeepValues says the two must be reconciled first; until then there is little margin of safety if margins fall, cash conversion stays weak, or customers move inference work to custom chips and rival accelerators. That is why DeepValues rates it **WATCH**: some big investors added in the September 30, 2026 13F filings (Asness/AQR, Baillie Gifford, Tiger Global and Millennium) while D. E. Shaw trimmed, but new buyers should either start small in stages or wait for a better price or clearer evidence of lasting per-share free-cash-flow growth.

*Note:* The context gives no sector or industry data and cut off partway through its research section, so I've only used what it returned. This is for information only, not investment advice.

### filings-msft

According to DeepValues, Microsoft's most recent 10-K was **filed on July 29, 2026**. It covers the fiscal year that ended June 30, 2026 ([document](https://www.sec.gov/Archives/edgar/data/000789019/000119312526323660/msft-20260630.htm)). The 10-K before it was filed July 30, 2025.

**Other filings since then, newest first:**

| Filed | Form | What it is |
|---|---|---|
| Nov 5, 2026 | 8-K | Current report (event dated Nov 4) |
| Nov 4, 2026 | 8-K | Current report (event dated Oct 29) |
| Oct 28, 2026 | 10-Q | Quarterly report for Q1 FY2027 (quarter ended Sep 30, 2026) |
| Oct 28, 2026 | 8-K ×2 | Two same-day filings, likely the earnings release |
| Oct 21, 2026 | DEF 14A | Proxy statement for the annual meeting on Dec 8, 2026 |
| Sep 2, 2026 | 8-K | Current report |
| Jul 29, 2026 | 8-K | Filed the same day as the 10-K, likely the Q4 FY2026 earnings release |

**Before the 10-K (June–July 2026):**
- **PX14A6G** (shareholder letters urging votes on proxy proposals): Jul 22 and Jul 2.
- **Form 4** (insider trades): Jul 15, Jul 1, Jun 16, Jun 15, and eight on Jun 12.
- **11-K** (annual reports for employee benefit plans): two on Jun 25.

There have been no Form 4 filings since July 15. The data doesn't say what each 8-K is about, so the earnings-release labels are guesses based on timing. Opening the documents would confirm them.

### fundamentals-ko

According to DeepValues, Coca-Cola's (KO) latest annual figures are for **fiscal year 2025**, which ended December 31, 2025:

| Metric | FY2025 | FY2024 (for comparison) |
|---|---|---|
| Revenue | $47,941M | $47,061M |
| Net income | $13,107M | $10,631M |
| Free cash flow | $5,296M | $4,741M |

The API doesn't state units, so I've assumed these are millions of USD, which fits Coca-Cola's reported scale.

Revenue rose about 1.9% from FY2024, net income about 23% and free cash flow about 12%.

### guru-lookup

I found Li Lu in the DeepValues guru roster under the slug **`li-lu`** (Himalaya Capital, value style).

## Who he is, according to DeepValues
- He founded **Himalaya Capital** in 1997 and runs it from Seattle.
- His portfolio is very concentrated for a US fund. It usually has fewer than 10 positions, holds them for years and has low single-digit annual turnover.
- DeepValues says his best-known contribution was introducing **BYD to Charlie Munger in 2008**. That became one of Berkshire Hathaway's most profitable non-US investments.
- He was born in China and was a student-protest organiser around Tiananmen before moving to the US. He sometimes lectures at Columbia Business School.
- The firm publishes no public investor letters, and he gives no media interviews.

DeepValues gives his age as 58. Based on his commonly reported 1966 birth year he would be about 60 now, so that part of the bio may be out of date.

## Holdings (13F for the quarter ending Sept 30, 2026; about $3.78B across 8 positions)

| # | Ticker | Company | Value | % of portfolio | Change vs. prior quarter |
|---|---|---|---|---|---|
| 1 | PDD | PDD Holdings | $916.7M | 24.2% | **Added** |
| 2 | GOOGL | Alphabet Class A | $875.1M | 23.1% | Unchanged |
| 3 | GOOG | Alphabet Class C | $835.3M | 22.1% | Unchanged |
| 4 | BRK.B | Berkshire Hathaway | $551.9M | 14.6% | Unchanged |
| 5 | EWBC | East West Bancorp | $344.1M | 9.1% | Unchanged |
| 6 | TME | Tencent Music | $117.6M | 3.1% | **Added** |
| 7 | CROX | Crocs | $104.1M | 2.8% | Unchanged |
| 8 | AAPL | Apple | $36.8M | 1.0% | Unchanged |

**Key points**
- **Alphabet** is effectively his largest holding. The two share classes together make up about **45%** of the portfolio, ahead of PDD's 24%.
- His only moves this quarter were adding to **PDD** and **Tencent Music**. Every other position was unchanged.
- The top four names (counting Alphabet once) make up about 84% of the portfolio.

This comes from 13F filings, so it only covers US-listed long positions. It doesn't show his non-US holdings, such as BYD shares held in Hong Kong. This is informational only and not investment advice.

### sentiment-tsla

DeepValues has no sentiment reading for TSLA right now. The 7-day query (all sources combined) came back empty:

- **Bullish / bearish / neutral:** no values (null)
- **Posts counted:** 0
- **Main source:** none
- **Sample quotes:** none
- **As-of timestamp:** none

I also tried the 30-day window and it was empty too. So there's no reading and no source mix to report, and it isn't just a slow week. The most likely cause is that DeepValues doesn't currently track TSLA in its sentiment data. That would fit, since the feed only covers value-investor discussion, and TSLA isn't a typical value-investor stock.

If it helps, I can:
- check DeepValues' guru and smart-money holdings for TSLA, which show what value investors are actually holding rather than what they're posting;
- file a free `request_data` asking DeepValues to add TSLA sentiment coverage.

### unknown-ticker

DeepValues has no intrinsic value data for ZZZQ. The API returned a 404 "Ticker not found" error. DeepValues only covers US SEC filers, so ZZZQ is either not a valid symbol or not a company it covers.

I don't have an intrinsic value to give you for ZZZQ, and I won't make one up.

If you meant a different company, I can look up the right ticker with DeepValues' company search. I can also send DeepValues a free coverage request for ZZZQ if you want it added.
