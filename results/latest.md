# DeepValues agent evals, 2026-11-08

10/10 tasks passed. Model: default. Mode: keyless. Cost: $0.79.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | pass | ToolSearch, smart_money_holdings | 11.3 |  |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value, intrinsic_value | 20.2 |  |
| buffett-moves | pass | ToolSearch, guru_moves | 24.5 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 21.7 |  |
| grounded-nvda | pass | ToolSearch, ai_context | 15.9 |  |
| filings-msft | pass | ToolSearch, filings, filings | 18.2 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals | 11.6 |  |
| guru-lookup | pass | ToolSearch, gurus, guru | 20.9 |  |
| sentiment-tsla | pass | ToolSearch, sentiment, sentiment, sentiment | 17.2 |  |
| unknown-ticker | pass | ToolSearch, intrinsic_value | 13.2 |  |

## Answers

### holders-aapl

DeepValues shows only **two** tracked investors holding AAPL, so there isn't a top three. The data is from 13F filings for the quarter ending **September 30, 2026 (Q3 2026)**, the latest available.

| Rank | Investor (Fund) | Shares | Position Value | % of Portfolio | Change vs. Q2 |
|---|---|---|---|---|---|
| 1 | Tom Gayner (Markel Group) | 1,227,290 | ~$408.7M | 3.18% | Unchanged |
| 2 | Dan Bin (Oriental Harbor Investment) | 274,351 | ~$91.4M | 6.22% | New position |

- **Total:** about $500.1M held across both, up 22.35% from the prior quarter. Most of that rise comes from Dan Bin's new position.
- **Berkshire Hathaway isn't on the list.** DeepValues tracks a set roster of 60 investors. Either Berkshire isn't on that roster, or it didn't report an AAPL position this quarter. If you want to know which, I can look it up with the guru tools.

This is for information only, not investment advice.

### intrinsic-brkb

**BRK.B is trading slightly above the blended fair value, by about 4%. The two models disagree a lot, so the blended number on its own isn't a strong signal.**

| | Per share |
|---|---|
| Current price (close 6 Nov 2026) | **$570.89** |
| **Blended intrinsic value** | **$547.45** (−4.1% vs. price) |
| DCF on free cash flow (base) | $328.45 (range $129.53 to $625.09) |
| Owner Earnings (base) | $766.45 (range $536.51 to $766.45) |
| Damodaran two-stage | Not run. The tool says it doesn't suit financial-sector companies. |

**The models don't agree:**
- **DCF** puts fair value about 42% below the price. Free cash flow is a poor fit for Berkshire because its insurance float and its large spending on assets distort it.
- **Owner Earnings** (Buffett-style earnings with reinvestment adjusted out) puts fair value about 34% above the price.
- Their base cases are about 2.3x apart. The $547 blend is just the average of those two numbers; no method actually lands there. The tool gives no p10–p90 confidence range here, because that range comes only from the Damodaran model, which didn't run.

**Bottom line:** The blend says Berkshire is roughly fairly valued, a little rich. The price is within about ±5% of the blend, well inside the ±25% range DeepValues uses before calling a stock under- or overvalued. If you think Owner Earnings is the better lens for a conglomerate built around insurance (many people do), Berkshire looks undervalued. A strict free-cash-flow DCF says it's overvalued.

On ticker format: DeepValues lists it as `BRK-B`. `BRK.B` returned "not found."

This is data and analysis, not investment advice.

### buffett-moves

DeepValues' five most recent Buffett (Berkshire Hathaway) moves all come from the same 13F filing. It was filed on **2026-08-14** and covers the quarter ending June 30, 2026.

| # | Ticker | Company | Action | Shares (prev → new) | Position value | Filing date |
|---|---|---|---|---|---|---|
| 1 | GOOGL | Alphabet Inc. (Class A) | **Added** | 54.2M → 78.8M (+45%) | ~$28.2B (9.4% of portfolio) | 2026-08-14 |
| 2 | BAC | Bank of America | **Trimmed** | 513.6M → 483.4M (−6%) | ~$27.5B (9.2%) | 2026-08-14 |
| 3 | GOOG | Alphabet Inc. (Class C) | **Added** | 3.6M → 27.2M (~7.6×) | ~$9.6B (3.2%) | 2026-08-14 |
| 4 | DVA | DaVita Inc. | **Trimmed** | 30.1M → 28.9M (−4%) | ~$6.4B (2.2%) | 2026-08-14 |
| 5 | DAL | Delta Air Lines | **Added** | 39.8M → 57.3M (+44%) | ~$5.4B (1.8%) | 2026-08-14 |

- **Why small trims are listed:** the feed includes any position worth $100M or more, not just changes of 25% or more. That's why the small trims of BAC and DaVita appear.
- **No new positions or exits** are among these five.
- **Alphabet:** Berkshire added to both share classes, so its combined Alphabet stake is now roughly $37.8B.
- **DeepValues' valuation notes:**
  - GOOGL is now trading about 113% above its estimated value.
  - DaVita was sold about 1% below its estimated value.
  - There's no valuation for BAC or GOOG, and Delta's estimates disagree too much to give one.
- **Timing:** these moves are about three months old. Berkshire's next 13F, for the quarter ending September 30, is due around November 14, 2026, so the list should change soon.

This is for information only, not investment advice.

### market-level

**Yes. By both measures the US market is expensive, at or near the top of its historical range.**

| Indicator | Reading | Zone | Historical percentile | As of |
|---|---|---|---|---|
| **Buffett Indicator** (US corporate equities ÷ GDP) | **255%** | Significantly overvalued (above 135%) | **99.7th** | 2026-04-01 |
| **Shiller PE (CAPE)** | **38.9** | Significantly overvalued (above 34) | **93.5th** | 2026-11-06 |

**What the numbers say:**
- **Buffett Indicator:** At 255%, it's almost twice the 135% line where "significantly overvalued" starts, and above every earlier reading in the series. It climbed from about 153% in mid-2022 to 255% now.
- **Shiller PE:** At 38.9, it's well above the fair-value band (22–28). It peaked around 42–42.7 in August 2026 and has eased a little since, after a sharp drop in early November (40.6 → 38.8). That's still higher than about 93% of its history.

**Problems with the data:**
1. **The Buffett reading is about 7 months old.** The latest point is 2026-04-01 because it depends on quarterly GDP and Fed flow-of-funds data. Prices have moved since then.
2. **The tools' "change" fields look mislabeled, so I didn't rely on them:**
   - Buffett: the reported month-over-month change of +16.2% is really the change over the quarter (219 → 255). The reported year-over-year change of +43.5% doesn't match the history; 213 → 255 is about +19.6%.
   - Shiller: the reported month-over-month change of +0.3% is actually one day's change (38.79 → 38.91). The reported year-over-year change of −4.8% doesn't match either; a year ago it was 39.16, so the real change is about −0.6%.

   The current levels, zones and percentiles are consistent with the history, so I'm confident in the table above.

**Bottom line:** Both indicators put the market in their most expensive zone. Historically, readings this high have come before below-average returns over the following 10 years. They say little about the next few months, though, and markets can stay expensive for a long time. This is for information only, not investment advice.

### grounded-nvda

**NVIDIA (NVDA): a value investor's take, based on DeepValues ai_context as of 2026-11-08 (14:16 UTC)**

NVIDIA is a very high-quality business: it sells a full computing platform built around CUDA, networking and systems, not just chips, and it reports a 71.1% gross margin, 76.3% ROE and 107.2% ROIC. Quality doesn't make a stock cheap, though. At about $211–212 a share and a market cap near $4.58 trillion, the DeepValues research stance is only **WATCH**, because the price doesn't clearly leave a margin of safety. The key open question is whether the current $7.86 of EPS is earnings the company can keep making, or a peak driven by an unusually strong cycle. Big investors were split as of their June 30, 2026 13F filings: Baillie Gifford, AQR, D. E. Shaw, Altimeter and Renaissance added shares, while Millennium, Citadel and Tiger Global trimmed. That fits the research view: hold if you already own it, and if you don't, start small and keep most of your money in reserve until cash flow proves itself or the price drops.

Notes: The returned context was cut off partway through the research text, and its sector and industry fields were "n/a". The guru positions are from June 30 13F filings, so they're more than four months old. This is for information only, not investment advice.

### filings-msft

DeepValues shows Microsoft's most recent 10-K was **filed July 29, 2026**. It covers the fiscal year ended **June 30, 2026** ([document](https://www.sec.gov/Archives/edgar/data/000789019/000119312526323660/msft-20260630.htm)). The one before it was filed July 30, 2025, for fiscal year 2025.

**Recent filings, newest first:**

| Filed | Form | What it is |
|---|---|---|
| 2026-11-05 | 8-K | Current report (event dated Nov 4) |
| 2026-11-04 | 8-K | Current report (event dated Oct 29) |
| 2026-10-28 | 8-K (×2) | Current reports filed the same day as the 10-Q, probably including the Q1 FY27 earnings release |
| 2026-10-28 | **10-Q** | Quarterly report for the quarter ended Sep 30, 2026 (Q1 FY27) |
| 2026-10-21 | **DEF 14A** | Proxy statement for the annual shareholder meeting; DeepValues lists Dec 8, 2026, which is most likely the meeting date |
| 2026-09-02 | 8-K | Current report |
| 2026-07-29 | **10-K** | Annual report for FY2026 |
| 2026-07-29 | 8-K | Filed the same day as the 10-K, probably including the Q4 FY26 earnings release |
| 2026-07-22, 2026-07-02 | PX14A6G (×2) | Exempt solicitations, which are proxy materials filed by shareholders rather than by Microsoft |
| 2026-07-15, 2026-07-01 | Form 4 | Insider transaction reports |
| 2026-06-25 | 11-K (×2) | Annual reports for employee benefit plans (plan year 2025) |
| 2026-06-12 to 06-16 | Form 4 (×10) | A batch of insider transaction reports: 7 on June 12, then June 15 and June 16 |

The data doesn't say what the 8-Ks are about. I've marked my guesses about them as "probably" or "most likely." If you want the actual subject of any of these filings, I can look up the documents.

### fundamentals-ko

According to DeepValues, Coca-Cola's (KO) latest annual figures are for **fiscal year 2025** (ended December 31, 2025):

| Metric | FY2025 | FY2024 (for comparison) |
|---|---|---|
| Revenue | $47,941M | $47,061M |
| Net income | $13,107M | $10,631M |
| Free cash flow | $5,296M | $4,741M |

- The response doesn't state units. I've assumed millions of USD, which fits the share count of about 4,313M.
- Revenue grew about 1.9% from FY2024. Net income rose about 23%, and free cash flow rose about 12%.
- Capital spending was $2,112M in FY2025. Operating cash flow isn't in the response. If FCF is operating cash flow minus capital spending, operating cash flow would be about $7.4B.

This is for information only, not investment advice.

### guru-lookup

I found Li Lu's slug, **`li-lu`**, in the DeepValues guru roster and then pulled his profile.

## Who he is, according to DeepValues

Li Lu runs **Himalaya Capital**, a value fund he founded in 1997. It's based in Seattle.

- **Style:** The portfolio is very concentrated. It often holds fewer than 10 stocks, keeps them for years and sells very little in a typical year.
- **Best-known move:** In 2008 he introduced Charlie Munger to **BYD**. It became one of Berkshire Hathaway's most profitable investments outside the US.
- **Background:** He was born in China and helped organise the student protests around Tiananmen before moving to the US. He sometimes lectures at Columbia Business School, and those lectures circulate informally as PDFs.
- **Profile:** DeepValues says Himalaya publishes no public investor letters and Li gives no media interviews.

Two things in the bio may be off. It gives his age as 58, but he's usually reported as born in 1966, which would make him about 60. And "no media interviews" seems too strong, since he has given a few over the years.

## Holdings (13F filing for the quarter ended June 30, 2026)

The filing lists 8 positions worth about **$3.70B** in total:

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

**Key points:**
- **Alphabet is about 48% of the fund** once you add the two share classes together.
- The top four names (Alphabet, PDD and Berkshire) make up about 85% of the portfolio.
- He added to only two positions this quarter: **PDD** and **Berkshire**. Nothing else changed.

13F filings only cover US-listed long positions and are filed up to 45 days after the quarter ends. So this list may not include his holdings outside the US, such as BYD. This is for information only, not investment advice.

### sentiment-tsla

DeepValues has no sentiment reading for TSLA over the last 7 days, so there's no reading or source mix to give.

I queried the 7-day window three ways, and all three came back empty:

| Source | Posts | Bullish / Bearish / Neutral | Top source | As-of |
|---|---|---|---|---|
| Combined | 0 | null / null / null | none | null |
| Reddit | 0 | null / null / null | none | null |
| StockTwits | 0 | null / null / null | none | null |

Every source shows zero posts and a null `as_of` timestamp. That points to DeepValues not having collected or rolled up recent TSLA data, not to neutral sentiment. A heavily discussed ticker like TSLA would normally have posts, so this is most likely a gap in their data feed. You shouldn't read it as a signal.

I can check the 24-hour or 30-day windows to see if anything is populated. The sentiment tool is free for up to 25 calls a day. I could also pull a different DeepValues view on TSLA, such as guru/smart-money position changes, recent theses or the AI research brief. These are informational only, not investment advice.

### unknown-ticker

DeepValues has no intrinsic value data for ZZZQ. The API returned a 404 "Ticker not found" error ("No intrinsic value data found for ticker ZZZQ"), so I don't have a value to give you.

ZZZQ may not be a valid or covered ticker. If you meant a different company, I can look it up with DeepValues' company search and get the intrinsic value for the right ticker.
