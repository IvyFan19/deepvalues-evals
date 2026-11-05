# DeepValues agent evals, 2026-11-05

10/10 tasks passed. Model: default. Mode: keyless. Cost: $0.84.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | pass | ToolSearch, smart_money_holdings | 39.7 |  |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value, companies_search, intrinsic_value | 52.6 |  |
| buffett-moves | pass | ToolSearch, gurus, guru_moves | 23.7 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 18.2 |  |
| grounded-nvda | pass | ToolSearch, ai_context | 15.7 |  |
| filings-msft | pass | ToolSearch, filings, filings | 21.3 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals | 12.2 |  |
| guru-lookup | pass | ToolSearch, gurus, guru | 21.6 |  |
| sentiment-tsla | pass | ToolSearch, sentiment, sentiment, sentiment | 15.9 |  |
| unknown-ticker | pass | ToolSearch, intrinsic_value | 10.1 |  |

## Answers

### holders-aapl

Only two investors on DeepValues' 60-guru roster held Apple in the latest quarter, so there isn't a third to name. The data is from 13F filings for the **quarter ending September 30, 2026 (Q3 2026)**.

| # | Investor (Fund) | Shares | Position value | % of portfolio | Change vs. Q2 |
|---|---|---|---|---|---|
| 1 | **Tom Gayner** (Markel Group) | 1,227,290 | $408.7M | 3.18% | Unchanged |
| 2 | **Dan Bin** (Oriental Harbor Investment) | 274,351 | $91.4M | 6.22% | **New position** |

- Together the two hold about $500.1M of Apple, up 22.35% from the prior quarter. Most of that increase comes from Dan Bin's new stake.
- Gayner's stake is bigger in dollars, but Apple is a larger share of Dan Bin's portfolio (6.22% vs. 3.18%).
- Berkshire Hathaway (Buffett) isn't among the holders for this quarter. That's either because it no longer held Apple at Q3 2026 or because DeepValues doesn't count it in this result. You can't tell which from this data alone. If it matters, I can check Berkshire's portfolio or earlier quarters for Apple.

This is informational only, not investment advice.

### intrinsic-brkb

According to DeepValues, BRK.B is trading a little above its blended intrinsic value. The two models that ran disagree badly, though, so the blend is a shaky basis for a call either way. (DeepValues lists the ticker as `BRK-B`.)

**Price vs. value (price as of Nov 4, 2026):**
- Current price: **$579.09**
- Blended fair value: **$540.44**
- That puts the stock about **6.7% above** the blend.

**What each model says:**

| Method | Conservative | Base | Optimistic |
|---|---|---|---|
| DCF on free cash flow (9.15% discount, 4.5% terminal growth) | $127.59 | **$322.33** | $612.47 |
| Owner earnings (8.32% discount) | $530.99 | **$758.56** | $758.56 |
| Damodaran two-stage | n/a | n/a | n/a |

**The models do not agree:**
- On its base case, the **DCF says the stock is overvalued**. Its $322 is about 44% below the price.
- On its base case, **owner earnings says it's undervalued**. Its $759 is about 31% above the price.
- The $540 blend is just the average of those two, which differ by more than 2x. Neither model actually comes out near $540.
- The Damodaran model wasn't run because DeepValues treats Berkshire as a financial-sector company. That also means there's no Monte Carlo range: only the median (p50 = $540) is reported.

**Which model to trust more:** For Berkshire, owner earnings is probably the better fit. Free-cash-flow DCFs tend to undervalue conglomerates with large insurance operations, because insurance float and big equity holdings don't show up well in free cash flow. Even so, owner earnings' own conservative case ($531) is below today's price. My read is that BRK.B looks roughly fairly valued to modestly overvalued on these numbers, and is not a clear bargain.

The valuation passed all of DeepValues' data checks: positive value, fresh price, consistent currency, and no flags. It's based on FY2025 SEC filings. This is data and analysis, not investment advice.

### buffett-moves

DeepValues shows five recent moves for Warren Buffett (Berkshire Hathaway). All five come from the same 13F filing, for the quarter ending June 30, 2026, filed on **2026-08-14**.

| # | Ticker | Company | Action | Shares (before → after) | Position value |
|---|---|---|---|---|---|
| 1 | GOOGL | Alphabet Inc. (Class A) | **Added** | 54.2M → 78.8M (+45%) | ~$28.2B (9.4% of portfolio) |
| 2 | BAC | Bank of America | **Trimmed** | 513.6M → 483.4M (−6%) | ~$27.5B (9.2%) |
| 3 | GOOG | Alphabet (Class C) | **Added** | 3.6M → 27.2M (~7.6×) | ~$9.6B (3.2%) |
| 4 | DVA | DaVita Inc. | **Trimmed** | 30.1M → 28.9M (−4%) | ~$6.4B (2.2%) |
| 5 | DAL | Delta Air Lines | **Added** | 39.8M → 57.3M (+44%) | ~$5.4B (1.8%) |

- **No new or exited positions:** none of these five is a new position or a full exit. GOOGL and GOOG are two share classes of Alphabet, so together they make one large addition to Alphabet.
- **Q3 filing still due:** Berkshire's 13F for the quarter ending September 30 isn't due until about mid-November. So this August filing is the latest one DeepValues has.
- **DeepValues' own comments on each move:** GOOGL now trades about 117% above its intrinsic-value range. The DaVita trim happened inside its value range. Delta's estimates disagree too much to make a call. It has no valuation for BAC or GOOG.

This is for information only, not investment advice.

### market-level

Yes. By both DeepValues measures, US stocks are very expensive compared with their own history. Both sit in the top couple of percent of past readings.

| Indicator | Current reading | Zone | Historical percentile | As of |
|---|---|---|---|---|
| **Buffett Indicator** (US stock market value ÷ GDP) | **255%** | Significantly overvalued (above 135%) | **99.7th** | 2026-04-01 |
| **Shiller PE (CAPE)** | **40.1** | Significantly overvalued (above 34) | **98.6th** | 2026-10-30 |

**Buffett Indicator**
- 255% is about twice the 115% upper edge of the "fair value" band. It's the highest point in the 5-year history the tool returned.
- It's up about 43.5% from a year earlier. The latest jump, from 219% to 255%, came between January and April 2026. The tool labels that +16.2% "month-over-month," but the data is quarterly, so it's really a one-quarter change.
- **This reading is about seven months old** (April 1, 2026). GDP figures are only published quarterly and arrive late. Today's value could be different.

**Shiller PE**
- 40.1 is current (October 30, 2026). It's down about 1.7% from the prior month and up about 2.5% from a year ago.
- It has stayed around 40–41 since May 2026. That's above the 2021 peak of about 38.6 and well above the "fair value" upper edge of 28.

**What this means:** Both measures agree that US stocks are priced near the most expensive levels on record. In the past, readings this high have tended to come before weaker long-term (10-year) returns. They have not been good at predicting short-term timing, and markets can stay expensive for years. These indicators also measure the market as a whole, so individual stocks or sectors can still be fairly priced.

*This is for information only and isn't investment advice.*

### grounded-nvda

**NVDA: a value investor's take** (DeepValues ai_context, as of **2026-11-05T14:17:24.035Z**)

NVIDIA is a platform business, not a commodity chip supplier: CUDA, its software libraries, networking and full-stack integration create real switching costs, which shows up in a 71.1% gross margin, 76.3% ROE and a reported ROIC of 107.2%. At about $211–$212 per share and a roughly $4.9 trillion market cap, though, the price already assumes much of that quality, and the open question is whether the $7.86 EPS is lasting owner earnings or a cycle peak. Institutional investors are split: Baillie Gifford, AQR, D. E. Shaw, Altimeter and Renaissance added shares in the 2026-06-30 filings, while Millennium, Citadel and Tiger Global trimmed. DeepValues' research rates it **WATCH**, meaning no clear margin of safety yet, so a value investor would take only a small, unleveraged starter position and save most of their capital for stronger cash-flow evidence or a lower price.

Some limits on the data:
- The holdings figures are from 13F filings as of 2026-06-30, so they're more than four months old.
- The context listed sector and industry as "n/a."
- The research section was cut off partway through. I used only what came through and didn't make any claims beyond it.

This is for information only and isn't investment advice.

### filings-msft

Microsoft last filed a 10-K on **July 29, 2026**. It covers fiscal year 2026, which ended June 30, 2026 ([filing](https://www.sec.gov/Archives/edgar/data/000789019/000119312526323660/msft-20260630.htm)). The 10-K before that was filed July 30, 2025.

**Other recent filings, newest first:**

| Filing date | Form | Notes |
|---|---|---|
| 2026-11-05 | 8-K | Filed today; event dated Nov 4 |
| 2026-11-04 | 8-K | Event dated Oct 29 |
| 2026-10-28 | 8-K (×2) | Same day as the 10-Q, likely the quarterly earnings release |
| 2026-10-28 | **10-Q** | Quarter ended Sep 30, 2026 (Q1 of fiscal 2027) |
| 2026-10-21 | **DEF 14A** | Proxy statement for the shareholder meeting on Dec 8, 2026 |
| 2026-09-02 | 8-K | |
| 2026-07-29 | 8-K | Same day as the 10-K, likely the fourth-quarter fiscal 2026 earnings release |
| 2026-07-22 | PX14A6G | Proxy material filed by an outside shareholder group |
| 2026-07-15 | Form 4 | Insider trade |
| 2026-07-02 | PX14A6G | Proxy material filed by an outside shareholder group |
| 2026-07-01 | Form 4 | Insider trade |
| 2026-06-25 | 11-K (×2) | Annual reports for employee benefit plans, for the year ended Dec 31, 2025 |
| 2026-06-12 to 06-16 | Form 4 (×11) | Insider trades: 8 on June 12, plus June 15 and June 16 |

The filing list doesn't say what the 8-Ks are about. The "likely earnings release" notes are my guess from the dates, not from the filings themselves. I can open any of the documents if you want the details.

### fundamentals-ko

The latest annual period in DeepValues for Coca-Cola (KO) is **fiscal year 2025**, which ended December 31, 2025.

| Metric | FY2025 | FY2024 (for comparison) |
|---|---|---|
| Revenue | **$47,941M** | $47,061M |
| Net income | **$13,107M** | $10,631M |
| Free cash flow | **$5,296M** | $4,741M |

The data doesn't state its units. I've assumed USD millions, since revenue of about $47.9B matches Coca-Cola's size.

For FY2025, revenue rose about 1.9%, net income about 23% and free cash flow about 12%. The data also shows capex of $2,112M and diluted EPS of $3.04.

### guru-lookup

I found Li Lu in the DeepValues guru roster under the slug **`li-lu`**, then looked up his profile.

## Who he is (according to DeepValues)

Li Lu founded **Himalaya Capital** in 1997 and runs it from Seattle. DeepValues says:

- **Style:** Value. His portfolio is very concentrated for a US fund. It usually has fewer than 10 positions, which he holds for years, and he trades very little each year.
- **Best-known move:** In 2008 he introduced **BYD** to Charlie Munger. It became one of Berkshire Hathaway's most profitable investments outside the US.
- **Background:** He was born in China and helped organise the Tiananmen-era student protests before moving to the US. He lectures now and then at Columbia Business School, and his lectures get passed around informally as PDFs.
- **Public profile:** The firm publishes no public investor letters, and DeepValues says Li gives no media interviews.

A couple of the bio details may be a bit off. It gives his age as 58, but he was born in 1966, which would make him about 60 now. He has also given a few interviews and talks over the years, so "no media interviews" is too strong.

## Top holdings (13F as of June 30, 2026)

He holds 8 positions worth about **$3.70B** in total:

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

**Key points:**
- **Alphabet** is his biggest bet. The two share classes together make up about **48%** of the portfolio.
- His top four holdings (Alphabet, PDD, Berkshire) make up about **85%**.
- This quarter he **added to PDD and Berkshire** and left everything else unchanged.

This data comes from 13F filings, so it only shows US-listed long positions and is reported about 45 days after the quarter ends. Himalaya's holdings outside the US, such as BYD, don't appear here. This is for information only and isn't investment advice.

### sentiment-tsla

DeepValues has no sentiment reading for TSLA over the last 7 days. I checked all three source settings and each came back empty:

| Source | Posts | Bullish / Bearish / Neutral | Top source | As of |
|---|---|---|---|---|
| Combined | 0 | — / — / — | — | — |
| Reddit | 0 | — / — / — | — | — |
| StockTwits | 0 | — / — / — | — | — |

**Reading:** none. The scores are null, so this doesn't mean sentiment is neutral. DeepValues just has no data for this window.

**Source mix:** none. Every source shows 0 posts and no quotes. The `as_of` field is also empty, which suggests DeepValues hasn't collected or refreshed TSLA data for this period. It doesn't look like it found posts and scored them neutral.

I can try the 30-day window, or the 24-hour one in case recent data has come in. I could also pull other DeepValues views on TSLA, like guru and smart-money moves or the latest news.

### unknown-ticker

DeepValues has no intrinsic value data for ZZZQ. The API returned a 404 "Ticker not found" error with the message *"No intrinsic value data found for ticker ZZZQ."*

So I can't give you an intrinsic value for it, and I won't make one up. ZZZQ may not be a real or listed ticker, or DeepValues may not cover it. If you meant a different symbol, give me the company name and I can look it up with DeepValues' company search.
