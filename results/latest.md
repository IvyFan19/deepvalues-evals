# DeepValues agent evals, 2026-11-12

10/10 tasks passed. Model: default. Mode: keyless. Cost: $0.97.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | pass | ToolSearch, smart_money_holdings | 8.9 |  |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value, intrinsic_value | 14.2 |  |
| buffett-moves | pass | ToolSearch, gurus, guru_moves | 16.4 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 12.8 |  |
| grounded-nvda | pass | ToolSearch, ai_context | 10.4 |  |
| filings-msft | pass | ToolSearch, filings, filings | 13.5 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals | 7.9 |  |
| guru-lookup | pass | ToolSearch, gurus, guru | 15.2 |  |
| sentiment-tsla | pass | ToolSearch, sentiment, sentiment, sentiment | 12.0 |  |
| unknown-ticker | pass | ToolSearch, intrinsic_value | 7.7 |  |

## Answers

### holders-aapl

The data is from the quarter ending **September 30, 2026** (Q3 2026, from 13F-HR filings). Four tracked investors held AAPL that quarter, with about $1.06B combined.

**Top three by position size (USD):**

1. **Baillie Gifford** (Baillie Gifford & Co): about $541.8M, 1,626,854 shares, 0.51% of its portfolio. It sold 133,737 shares this quarter, about 7.6% of its position.
2. **Tom Gayner** (Markel Group): about $408.7M, 1,227,290 shares, 3.18% of its portfolio. No change from last quarter.
3. **Dan Bin** (Oriental Harbor Investment): about $91.4M, 274,351 shares, 6.22% of its portfolio. This is a new position.

The fourth holder is Francis Chou (Chou Associates): about $13.3M, 40,000 shares, unchanged.

Berkshire Hathaway isn't in the list. DeepValues tracks 60 investors, so either Berkshire isn't one of them or it had no AAPL position this quarter. I can check Berkshire's own portfolio if you want to know which.

### intrinsic-brkb

**Using the blended number, BRK.B trades above intrinsic value. The two models that ran disagree, though: one says overvalued and the other says undervalued.**

Price: **$588.24** (as of Nov 11, 2026)

| Model | Conservative | Base | Optimistic |
|---|---|---|---|
| DCF on free cash flow (9.2% discount rate, 4.5% terminal growth) | $121 | **$302** | $573 |
| Owner earnings (Buffett-style, 8.35% discount rate) | $470 | **$671** | $671 |
| Damodaran two-stage | — | not run | — |
| **Equal-weight blend** | | **$487** | |

- **Blended fair value is $487/share**, so the price is about **17% above** it (about 21% over fair value, stated the other way).
- **The models don't agree.** The DCF puts fair value at $302, about half the price, so it says strongly overvalued. Owner earnings puts it at $671, about 14% above the price, so it says undervalued. The blend is just the average of those two base cases.
- The Damodaran model didn't run because DeepValues treats it as unsuitable for a financial-sector company. That also means there's no Monte Carlo range (no p10–p90).

**Caveats:**
- A free-cash-flow DCF usually undervalues an insurance-heavy conglomerate like Berkshire. It doesn't capture float or the large investment portfolio well, so the low DCF figure probably exaggerates how overvalued the stock looks.
- DeepValues gives a verdict only within ±25% of the blend, which is about $365–$609. $588 is inside that range, near the top. So by DeepValues' own rule this is closer to "around fair value, slightly expensive" than clearly overvalued.
- The two estimates are about 2.2× apart. DeepValues' "too uncertain to call" rule kicks in at 3×, so they're not that far apart, but it's still a wide gap.

This is data and analysis from DeepValues, not investment advice.

### buffett-moves

DeepValues' latest Berkshire Hathaway moves come from one filing: the 13F filed **August 14, 2026**, for the quarter ending June 30, 2026. Here are the five largest by position size:

| # | Ticker | Company | Action | Shares (before → after) | Position value |
|---|---|---|---|---|---|
| 1 | GOOGL | Alphabet (Class A) | **Added** (+45%) | 54.2M → 78.8M | $28.2B (9.4% of portfolio) |
| 2 | BAC | Bank of America | **Trimmed** (−6%) | 513.6M → 483.4M | $27.5B (9.2%) |
| 3 | GOOG | Alphabet (Class C) | **Added** (~7.6×) | 3.6M → 27.2M | $9.6B (3.2%) |
| 4 | DVA | DaVita | **Trimmed** (−4%) | 30.1M → 28.9M | $6.4B (2.2%) |
| 5 | DAL | Delta Air Lines | **Added** (+44%) | 39.8M → 57.3M | $5.4B (1.8%) |

- **No new positions or full exits** appear among the 10 most recent moves DeepValues returned. That filing also shows Berkshire cutting Kroger, Ally and Capital One (Capital One dropped from 7.15M to 3.0M shares) and adding to Lennar and the New York Times.
- **Next filing:** the 13F for the quarter ending September 30 isn't in the feed yet. It's due around mid-November 2026, so newer moves should appear soon.
- **Price comparison:** DeepValues says GOOGL now trades at about $293, well above its estimated value range of $133–$221. It also says the DaVita shares were sold below its value estimate.

This is informational only, not investment advice.

### market-level

Yes. By both DeepValues measures, US stocks are expensive and sit in the top tier of their history.

| Indicator | Reading | Zone | Historical percentile | As of |
|---|---|---|---|---|
| **Buffett Indicator** (US stocks ÷ GDP) | **255%** | Significantly overvalued (above 135%) | **99.7th** | Apr 1, 2026 |
| **Shiller PE** | **40.24** | Significantly overvalued (above 34) | **94.1st** | Nov 11, 2026 |

**Buffett Indicator**
- At 255%, it is nearly twice the 135% line where "significantly overvalued" starts. Fair value is roughly 90–115%.
- It's up about 43.5% from a year earlier and about 16% from the previous reading. The tool calls that 16% month-over-month, but the data comes in quarterly steps, so it's really a quarterly change (219% → 255%).
- It's well above the 2021 peak of about 219%.
- **The data is old.** The latest reading is from April 1, 2026, about 7 months ago, because it depends on quarterly GDP and Fed data. Today's level could be different.

**Shiller PE**
- 40.24 as of yesterday, close to flat from a year ago (−0.3%).
- It has stayed between about 39 and 42.6 since mid-2026, with a high of 42.65 in mid-August.
- That's above the late-2021 peak of about 38. Historically, the only higher readings came around the dot-com bubble.

**Bottom line:** Both indicators are at or near record highs. In the past, readings this high have been followed by below-average long-term returns. They have not been good at predicting short-term timing, and markets can stay expensive for years. These indicators also measure the market as a whole, so cheaper individual stocks can still exist inside an expensive market.

*This is for information only, not investment advice.*

### grounded-nvda

**NVIDIA (NVDA): a value investor's take** (DeepValues ai_context, as of 2026-11-12T14:16:01.838Z)

NVIDIA has an unusually strong moat. CUDA, its software libraries, its networking and its full systems stack make it costly for customers to switch, and the numbers show it: a 71.1% gross margin, 76.3% ROE, 58.1% ROA and a reported 107.2% ROIC. Still, at a market cap of about $4.26 trillion and a price around $211–$212, DeepValues rates it **WATCH**, because there's no clear margin of safety until we know whether the $7.86 EPS is durable owner earnings or the top of a favorable cycle. Big investors are split: Baillie Gifford added to reach a 9.2% position (42.6M shares as of 2026-09-30) and Altimeter put 19.2% of its portfolio in it, while Citadel, Millennium and Tiger Global trimmed in the June 2026 quarter. A disciplined approach is to keep existing holdings within sensible concentration limits, or start a small, unleveraged position if you own none, and save most of your capital for stronger cash-flow evidence or a better price rather than paying up for quality alone.

The tool cut its research text short after the "strongest bullish points" section, so the bear case and risk details beyond those points weren't available to me. This is for information only, not investment advice.

### filings-msft

According to DeepValues, Microsoft last filed a 10-K on **July 29, 2026**. It covers the fiscal year that ended June 30, 2026 ([filing](https://www.sec.gov/Archives/edgar/data/000789019/000119312526323660/msft-20260630.htm)). The 10-K before that was filed on July 30, 2025, for fiscal year 2025.

## Recent filings (newest first)

| Filing date | Form | Period / notes |
|---|---|---|
| 2026-11-05 | 8-K | Event dated Nov 4, 2026 |
| 2026-11-04 | 8-K | Event dated Oct 29, 2026 |
| 2026-10-28 | 8-K (×2) | Two filings dated Oct 28, the same day as the 10-Q |
| 2026-10-28 | **10-Q** | Quarter ended Sep 30, 2026 (Q1 of fiscal 2027) |
| 2026-10-21 | DEF 14A | Final proxy statement for the meeting on Dec 8, 2026 |
| 2026-09-02 | 8-K | — |
| 2026-07-29 | **10-K** | Fiscal year ended Jun 30, 2026 |
| 2026-07-29 | 8-K | Filed the same day as the 10-K |
| 2026-07-22 | PX14A6G | Exempt proxy solicitation, filed by a third party (a different filer agent, not Microsoft) |
| 2026-07-15 | Form 4 | Insider transaction |
| 2026-07-02 | PX14A6G | Exempt proxy solicitation, filed by a third party |
| 2026-07-01 | Form 4 | Insider transaction |
| 2026-06-25 | 11-K (×2) | Annual reports for employee benefit plans (plan year 2025) |
| 2026-06-12 to 06-16 | Form 4 (×11) | Insider transactions: 8 on Jun 12, 1 on Jun 15, 1 on Jun 16 |

## Summary
- **Periodic reports:** the latest is the 10-Q filed on Oct 28, 2026. The latest annual report is the 10-K filed on Jul 29, 2026.
- **8-Ks:** there were six from late July through November. The ones that came out with the 10-K and 10-Q are probably earnings releases, but the listing only gives dates, so I haven't confirmed what any of them contain.
- **Proxy:** the DEF 14A filed on Oct 21 is for the annual meeting on Dec 8, 2026.
- **Other forms:** insider Form 4s, 11-Ks for the employee plans, and third-party PX14A6G proxy solicitations.

### fundamentals-ko

According to DeepValues, Coca-Cola's (KO) latest annual figures are for **fiscal year 2025**, which ended December 31, 2025:

| Metric | FY2025 |
|---|---|
| Revenue | $47,941M (≈ $47.9B) |
| Net income | $13,107M (≈ $13.1B) |
| Free cash flow | $5,296M (≈ $5.3B) |

The data doesn't state its units. I've read the figures as millions of USD because that fits Coca-Cola's known scale.

Compared with FY2024, revenue rose about 1.9% from $47,061M. Net income rose about 23% from $10,631M, and free cash flow rose about 12% from $4,741M.

### guru-lookup

I found Li Lu in DeepValues' guru roster under the slug **`li-lu`**.

## Who Li Lu is (according to DeepValues)

- **Firm:** Himalaya Capital, which he founded in 1997 and runs from Seattle. He is 58 and classed as a **value** investor.
- **Style:** A very concentrated portfolio by US standards. It usually holds fewer than 10 stocks, keeps them for years and sells very little each year.
- **Best known for:** Introducing BYD to Charlie Munger in 2008. That became one of Berkshire Hathaway's most profitable non-US investments.
- **Background:** He was born in China and was a student-protest organiser around the time of Tiananmen. He gives occasional lectures at Columbia Business School, and copies of them circulate informally as PDFs.
- **Disclosure:** DeepValues says the firm publishes no public investor letters and that Li gives no media interviews.

## Top holdings (13F for the quarter ending 2026-06-30)

He has 8 positions worth about **$3.70B** in total. DeepValues didn't return them in order of size, so I've sorted them by weight:

| # | Ticker | Company | % of portfolio | Value | Change last quarter |
|---|---|---|---|---|---|
| 1 | GOOGL | Alphabet (Class A) | 24.55% | $908.9M | Unchanged |
| 2 | GOOG | Alphabet (Class C) | 23.39% | $866.1M | Unchanged |
| 3 | PDD | PDD Holdings | 22.17% | $820.9M | **Added** |
| 4 | BRK.B | Berkshire Hathaway | 14.98% | $554.6M | **Added** |
| 5 | EWBC | East West Bancorp | 9.68% | $358.4M | Unchanged |
| 6 | CROX | Crocs | 2.89% | $107.0M | Unchanged |
| 7 | TME | Tencent Music | 1.49% | $55.0M | Unchanged |
| 8 | AAPL | Apple | 0.86% | $32.0M | Unchanged |

**Key points:**
- **Alphabet is about 48% of the fund** once you add the two share classes together.
- The top four (Alphabet, PDD and Berkshire) make up about 85% of the portfolio.
- He **added** to PDD and Berkshire last quarter and left everything else unchanged.
- A 13F filing only shows US-listed stocks. Holdings listed elsewhere, such as BYD shares in Hong Kong, won't appear here.

Data comes from DeepValues and is for information only, not investment advice.

### sentiment-tsla

DeepValues has no TSLA sentiment reading for the last 7 days, so there's no source mix to give either.

| Source | Window | Posts | Bullish / Bearish / Neutral | Top source | As of |
|---|---|---|---|---|---|
| Combined | 7d | 0 | null / null / null | — | null |
| Reddit only | 7d | 0 | null / null / null | — | null |
| StockTwits only | 7d | 0 | null / null / null | — | null |

All three calls succeeded but came back empty. Each has zero posts, no percentages, no sample quotes and no as-of timestamp.

TSLA is one of the most-discussed stocks anywhere, so zero posts almost certainly doesn't mean no one is talking about it. More likely DeepValues has no data for TSLA right now: either it doesn't track the ticker, its feed isn't running, or its value-investor filter drops every post. The missing as-of timestamp points to no data being loaded, not a real reading of zero.

I can check the 30-day window to see whether DeepValues has any TSLA data at all, or pull other DeepValues TSLA data instead, such as recent guru buys and sells or its research brief. This is informational only, not investment advice.

### unknown-ticker

DeepValues doesn't have an intrinsic value for **ZZZQ**. The API returned a 404 "Ticker not found" error: "No intrinsic value data found for ticker ZZZQ."

The ticker may be misspelled, delisted, or not covered by DeepValues. If you think it should be there, I can run a company search to find the right symbol.
