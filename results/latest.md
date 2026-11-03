# DeepValues agent evals, 2026-11-03

9/10 tasks passed. Model: default. Mode: keyless. Cost: $0.74.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | pass | ToolSearch, smart_money_holdings | 11.4 |  |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value, companies_search, intrinsic_value | 14.7 |  |
| buffett-moves | pass | ToolSearch, guru_moves | 13.5 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 14.5 |  |
| grounded-nvda | pass | ToolSearch, ai_context | 9.8 |  |
| filings-msft | pass | ToolSearch, filings, filings | 11.8 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals | 8.3 |  |
| guru-lookup | pass | ToolSearch, gurus, guru | 15.3 |  |
| sentiment-tsla | pass | ToolSearch, sentiment, sentiment, sentiment | 10.6 |  |
| unknown-ticker | FAIL | ToolSearch, intrinsic_value | 7.4 | answer lacks /(?i)no data|not found|unknown|does ?n[o']t (exist|have)|could ?n[o']t find|no (such|matching)/ |

## Answers

### holders-aapl

The DeepValues data is from the quarter ending **September 30, 2026** (Q3 2026 13F filings). You asked for the top three, but only **two** of the 60 tracked investors held Apple that quarter:

| Rank | Investor (Fund) | Shares | Position value | % of portfolio | Change from prior quarter |
|---|---|---|---|---|---|
| 1 | **Tom Gayner** (Markel Group) | 1,227,290 | $408.7M | 3.18% | Unchanged |
| 2 | **Dan Bin** (Oriental Harbor Investment) | 274,351 | $91.4M | 6.22% | New position |

- Together the two hold about **$500.1M** of Apple, up 22.35% from the prior quarter. Most of that increase comes from Dan Bin's new position.
- Warren Buffett's Berkshire Hathaway, historically Apple's best-known holder, isn't on the list. In this data, Berkshire either didn't hold Apple at the end of Q3 2026 or isn't covered for this ticker. I can check Berkshire's portfolio or recent trades directly if you want to confirm.
- 13F filings are due 45 days after the quarter ends, so this data is already about a month old.

This is for information only, not investment advice.

### intrinsic-brkb

**BRK-B is trading slightly above the blended fair value, but the two models disagree so much that the blend doesn't tell you much.**

DeepValues data as of 2026-11-02 (ticker `BRK-B`):

| | Value per share | vs. price ($556.11) |
|---|---|---|
| **Blended intrinsic value** | **$541.43** | **−2.6%** (slightly overvalued) |
| DCF (5-year free cash flow), base | $323.00 | −42% |
| — DCF range | $127.80 / $323.00 / $613.85 | conservative / base / optimistic |
| Owner Earnings (Buffett-style), base | $759.86 | +37% |
| — Owner Earnings range | $531.91 / $759.86 / $759.86 | conservative / base / optimistic |
| Damodaran two-stage | not available | — |

**Do they agree? No.**
- The DCF says BRK-B is well above intrinsic value. The Owner Earnings model says it's well below. Their base cases are about $437 apart.
- The $541 blend is just the average of those two base cases (Damodaran returned nothing). So "2.6% overvalued" comes from averaging two opposite answers, not from the models agreeing.
- Because the Damodaran model didn't run, there are no confidence bounds (p10–p90).
- The two ranges overlap only between about $532 and $614. The current price sits in that band, so you could argue it's roughly fairly valued.

**My take:** A free-cash-flow DCF usually fits Berkshire poorly. An insurance float, large investment holdings and heavy reinvestment don't show up well in FCF. Owner Earnings is closer to how Berkshire itself thinks about value. If you trust that model more, the stock looks undervalued. If you don't pick a model, the honest answer is that it's near fair value with high uncertainty.

This is informational output from DeepValues, not investment advice.

### buffett-moves

DeepValues lists these as Warren Buffett's (Berkshire Hathaway's) five most recent moves. All five come from the 13F filed on **2026-08-14**, which covers the quarter ended June 30, 2026.

| # | Ticker | Company | Action | Shares (before → after) | Position value | Filing date |
|---|---|---|---|---|---|---|
| 1 | GOOGL | Alphabet (Class A) | **Added** | 54.2M → 78.8M (+45%) | ~$28.2B (9.4% of portfolio) | 2026-08-14 |
| 2 | BAC | Bank of America | **Trimmed** | 513.6M → 483.4M (−6%) | ~$27.5B (9.2%) | 2026-08-14 |
| 3 | GOOG | Alphabet (Class C) | **Added** | 3.6M → 27.2M (~7.6×) | ~$9.6B (3.2%) | 2026-08-14 |
| 4 | DVA | DaVita | **Trimmed** | 30.1M → 28.9M (−4%) | ~$6.4B (2.2%) | 2026-08-14 |
| 5 | DAL | Delta Air Lines | **Added** | 39.8M → 57.3M (+44%) | ~$5.4B (1.8%) | 2026-08-14 |

- **No new positions or exits** are among these five.
- **What DeepValues says about each move:**
  - **GOOGL:** at about $279, the stock now trades well above DeepValues' value range of $133–$222. Its comment is that "the move has played out."
  - **DVA:** the stock is about $186, just under DeepValues' value range of $191–$318. Its comment is that Berkshire "sold below our value."
  - **DAL:** DeepValues' estimates disagree too much for it to give a view.
  - **BAC and GOOG:** DeepValues has no valuation yet.
- **13F filings run late.** These trades happened by June 30 and were filed 45 days later, so Berkshire's holdings may have changed since then.

This is for information only, not investment advice.

### market-level

Yes. By both measures the US market is very expensive compared with its own history.

| Indicator | Reading | Zone | Historical percentile | Date of data |
|---|---|---|---|---|
| **Buffett Indicator** (US corporate equities ÷ GDP) | **255%** | Significantly overvalued (above 135%) | **99.7th** | 2026-04-01 |
| **Shiller PE** (CAPE) | **40.1** | Significantly overvalued (above 34) | **98.6th** | 2026-10-30 |

**What the readings mean:**
- **Buffett Indicator:** At 255%, it's almost twice the 135% level where the "significantly overvalued" zone starts, and higher than about 99.7% of past readings. It jumped from about 219% in Q1 to 255%, and it's up about 44% over the past year. It's also above the 2021 peak of about 219%.
- **Shiller PE:** At 40.1, it's near the highest levels on record and above the late-2021 level of about 38.6. It has stayed around 40–41 since May 2026. It fell 1.7% over the last month and is up 2.5% over the year.

**One thing to keep in mind:** the Buffett Indicator uses quarterly GDP and equity data, so its latest reading is from April 1, 2026, about seven months ago. The Shiller PE is current to October 30. The Shiller PE has stayed roughly flat to slightly higher since April, so the Buffett reading is probably still about right.

**In short:** both indicators are deep in their most expensive zone and around the 99th percentile. Historically, readings this high have come before below-average long-term returns. They have been poor at predicting when a market will turn, though, and markets can stay expensive for years.

*This is for information only and isn't investment advice.*

### grounded-nvda

**As of 2026-11-03 (DeepValues ai_context, timestamp 2026-11-03T14:16:03Z):**

NVIDIA is an outstanding business: CUDA, its software libraries, networking and full-stack systems create real switching costs, and it earns a 71.1% gross margin, 76.3% ROE and a reported 107.2% ROIC. But with a market cap of about $4.95 trillion and a share price around $211–$212, a value investor has to ask whether the $7.86 of EPS is owner earnings it can sustain or earnings from an unusually good point in the cycle, and the data doesn't settle that yet. Big investors are split on it: as of June 30, 2026, Baillie Gifford, AQR, D. E. Shaw, Renaissance and Altimeter (where NVDA is 19.2% of the portfolio) added shares, while Millennium, Citadel and Tiger Global trimmed. That fits DeepValues' **WATCH** stance: hold existing shares within sensible size limits, or take at most a small, unleveraged starter position, and keep most of your capital until there's stronger cash-flow evidence or a better price.

The ai_context response was cut off partway through the research briefing, so everything above comes from the part that came back. The fund moves are from 13F filings dated 2026-06-30 and are more than four months old. This is for information only, not investment advice.

### filings-msft

DeepValues shows that Microsoft last filed a **10-K on July 29, 2026**. It covers the fiscal year that ended June 30, 2026 ([filing](https://www.sec.gov/Archives/edgar/data/000789019/000119312526323660/msft-20260630.htm)). The 10-K before that was filed on July 30, 2025.

**Other recent filings (newest first):**

| Filing date | Form | What it is |
|---|---|---|
| 2026-10-28 | 10-Q | Quarterly report for Q1 of fiscal 2027 (quarter ended Sep 30, 2026) |
| 2026-10-28 | 8-K (×2) | Two current reports filed the same day as the 10-Q, most likely including the Q1 earnings release |
| 2026-10-21 | DEF 14A | Definitive proxy statement for the annual meeting listed for Dec 8, 2026 |
| 2026-09-02 | 8-K | Current report |
| 2026-07-29 | 8-K | Filed the same day as the 10-K, most likely the Q4 / full-year earnings release |
| 2026-07-22 | PX14A6G | Exempt solicitation, a proxy filing usually made by a shareholder |
| 2026-07-15 | Form 4 | Insider transaction |
| 2026-07-02 | PX14A6G | Exempt solicitation |
| 2026-07-01 | Form 4 | Insider transaction |
| 2026-06-25 | 11-K (×2) | Annual reports for employee benefit plans |
| 2026-06-12 to 06-16 | Form 4 (×7) | Insider transactions: 5 on June 12, 1 on June 15, 1 on June 16 |

The most recent filings are the 10-Q and two 8-Ks from October 28, 2026. The data shows only the form types, so I haven't opened the 8-Ks to confirm what they contain.

### fundamentals-ko

The latest annual figures for Coca-Cola (KO) in DeepValues are for **fiscal year 2025**, which ended December 31, 2025:

| Metric | FY2025 | FY2024 | Change |
|---|---|---|---|
| Revenue | $47,941M | $47,061M | +1.9% |
| Net income | $13,107M | $10,631M | +23.3% |
| Free cash flow | $5,296M | $4,741M | +11.7% |

The data doesn't state its units. I've assumed millions of US dollars, which fits Coca-Cola's reported scale.

Free cash flow is low next to net income, at about 40% of it. In 2024 it was also held down by the one-off fairlife contingent payment of about $6.1B. DeepValues doesn't break out operating cash flow, so I can't confirm what caused the gap in FY2025.

This is for information only and isn't investment advice.

### guru-lookup

I found Li Lu in the DeepValues guru roster under the slug **`li-lu`**.

## Who he is, according to DeepValues
Li Lu, 58, founded **Himalaya Capital** in 1997 and runs it from Seattle. DeepValues highlights these points:
- **Very concentrated portfolio:** usually fewer than 10 positions, held for years, with low single-digit yearly turnover.
- **Best-known move:** in 2008 he introduced BYD to Charlie Munger, and it became one of Berkshire Hathaway's most profitable non-US investments.
- **Background:** he was born in China and helped organise the Tiananmen-era student protests before moving to the US. He sometimes lectures at Columbia Business School.
- DeepValues says the firm publishes no investor letters and that he gives no media interviews.

## Top holdings (13F for Q2 2026, about $3.70B across 8 positions)

| Rank | Ticker | Company | % of portfolio | Value | Change from last quarter |
|---|---|---|---|---|---|
| 1 | GOOGL | Alphabet Class A | 24.55% | $908.9M | Unchanged |
| 2 | GOOG | Alphabet Class C | 23.39% | $866.1M | Unchanged |
| 3 | PDD | PDD Holdings | 22.17% | $820.9M | **Added** |
| 4 | BRK.B | Berkshire Hathaway | 14.98% | $554.6M | **Added** |
| 5 | EWBC | East West Bancorp | 9.68% | $358.4M | Unchanged |
| 6 | CROX | Crocs | 2.89% | $107.0M | Unchanged |
| 7 | TME | Tencent Music | 1.49% | $55.0M | Unchanged |
| 8 | AAPL | Apple | 0.86% | $32.0M | Unchanged |

**What stands out:**
- **Alphabet is almost half the portfolio.** The two share classes together make up about 48%.
- **He added to PDD and Berkshire this quarter.** Those are the only two positions that changed.
- **The top four positions make up about 85% of the portfolio**, which matches how concentrated DeepValues says he is.

This is a 13F filing, so it shows only US-listed long positions. Himalaya Capital's large Asian holdings, such as BYD, are not included, so this is not the whole portfolio. The data is for information only and is not investment advice.

### sentiment-tsla

DeepValues has no TSLA sentiment reading for the last 7 days (as of 2026-11-03), so there's no bullish/bearish split and no source mix to report.

I checked the combined feed, Reddit alone and StockTwits alone for the 7-day window. All three came back empty:

| Source | Posts | Bullish % | Bearish % | Neutral % | Top source |
|---|---|---|---|---|---|
| Combined | 0 | — | — | — | — |
| Reddit | 0 | — | — | — | — |
| StockTwits | 0 | — | — | — | — |

The `as_of` timestamp is also null on all three. That points to no data being collected for TSLA in this window, rather than a real neutral reading. It's unlikely that value investors simply weren't talking about Tesla for a week, so this looks like a data gap or ingestion lag on DeepValues' side, not a signal about sentiment.

I can try the 30-day window, or pull other DeepValues views on TSLA such as guru/smart-money holdings changes, the verdict, or the intrinsic value estimate. Each sentiment call costs 0.001 credits and is free up to 25 calls a day.

### unknown-ticker

DeepValues has no intrinsic value data for **ZZZQ**. The API returned a 404 with the message "No intrinsic value data found for ticker ZZZQ." Because of that, I can't give you a value, and I won't estimate one.

ZZZQ may not be a valid or listed ticker, or DeepValues may not cover it. If you meant a different symbol, give me the company name and I'll look up the right ticker with DeepValues' company search.
