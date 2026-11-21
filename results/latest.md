# DeepValues agent evals, 2026-11-21

10/10 tasks passed. Model: default. Mode: keyless. Cost: $0.91.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | pass | ToolSearch, smart_money_holdings | 19.7 |  |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value | 16.9 |  |
| buffett-moves | pass | ToolSearch, guru_moves | 19.4 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 22.1 |  |
| grounded-nvda | pass | ToolSearch, ai_context | 15.3 |  |
| filings-msft | pass | ToolSearch, filings, filings | 18.8 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals | 13.7 |  |
| guru-lookup | pass | ToolSearch, gurus, guru | 23.9 |  |
| sentiment-tsla | pass | ToolSearch, sentiment, sentiment, sentiment | 19.9 |  |
| unknown-ticker | pass | ToolSearch, intrinsic_value | 11.9 |  |

## Answers

### holders-aapl

In the most recent quarter DeepValues has, which ends **September 30, 2026** (13F filings), **27 of its 60 tracked investors** hold Apple (AAPL). Together they hold about **$97.5B** of the stock, down 2.23% from the prior quarter.

**Top three by position size:**

| # | Investor (Fund) | Shares | Value | % of Portfolio | Change vs. Prior Quarter |
|---|---|---|---|---|---|
| 1 | Warren Buffett (Berkshire Hathaway) | 227.9M | $75.9B | 24.95% | No change |
| 2 | Duan Yongping (H&H International) | 21.2M | $7.06B | 41.07% | Sold about 5.9M shares (−21.8%) |
| 3 | Cliff Asness (AQR Capital) | 20.9M | $6.96B | 2.06% | Bought about 3.3M shares (+19.0%) |

Berkshire's stake is about 78% of what all the tracked investors hold combined. Apple makes up a bigger share of Duan Yongping's portfolio than of anyone else's at 41%, even after he sold some.

The next three largest holders are D. E. Shaw ($1.67B), Citadel ($1.52B) and Two Sigma ($1.35B). This is for information only, not investment advice.

### intrinsic-brkb

**The models don't agree, so there's no single answer.** One says BRK.B is cheap, the other says it's expensive. The blended fair value is below the price.

**Price:** $570 (close on 2026-11-20). Valuations use FY2025 SEC filings.

| Method | Conservative | Base | Optimistic | Base vs. $570 |
|---|---|---|---|---|
| Owner Earnings (8.4% discount rate) | $466 | **$666** | $666 | **+17%, undervalued** |
| DCF on free cash flow (9.24% discount, 4.5% terminal growth) | $119 | **$299** | $566 | **−48%, overvalued** |
| Damodaran two-stage | — | not run | — | It doesn't apply to financial-sector companies |
| **Equal-weight blend** | | **$482** | | **−15%, overvalued** |

**What this means:**
- **Headline fair value: ~$666.** DeepValues leads with Owner Earnings. On that basis BRK.B trades about 14% below intrinsic value.
- **Blended fair value: ~$482.** Averaging the two working models puts the stock about 18% above fair value.
- **How far apart they are:** the two base cases differ by more than 2x. Even the DCF's optimistic case ($566) is below the price, and the Owner Earnings conservative case ($466) is still close to the blend.

**Why they diverge:** I think the DCF is the weaker model for Berkshire. Free cash flow is a poor measure for a company built around insurance float, large capital spending at its railroad and utilities, and a big investment portfolio. That's the same reason Damodaran was excluded. Owner Earnings is closer to how Berkshire itself thinks about value, which is likely why DeepValues headlines it.

Neither model counts Berkshire's cash and equity portfolio separately, and that's a large part of its value. So none of these numbers is a full sum-of-the-parts estimate. Monte Carlo confidence ranges also aren't available, because they come from the Damodaran model.

This is data and analysis, not investment advice.

### buffett-moves

DeepValues' five most recent Warren Buffett moves come from one 13F, filed **2026-11-16**, covering the quarter ending 2026-09-30:

| # | Ticker | Company | Action | Shares (prev → now) | Position value |
|---|---|---|---|---|---|
| 1 | BAC | Bank of America | **Trimmed** | 483.4M → 455.9M (−5.7%) | ~$24.8B (8.2% of portfolio) |
| 2 | DAL | Delta Air Lines | **Added** | 57.3M → 64.5M (+12.4%) | ~$5.4B (1.8%) |
| 3 | DVA | DaVita | **Trimmed** | 28.88M → 28.70M (−0.6%) | ~$5.0B (1.7%) |
| 4 | LEN | Lennar | **Added** | 13.1M → 26.0M (+98.6%) | ~$2.1B (0.7%) |
| 5 | KR | Kroger | **Trimmed** | 39.0M → 35.0M (−10.3%) | ~$2.1B (0.7%) |

- None of these five is a new position or a full exit. The filing may still include some; I only pulled the top five rows.
- The feed only lists "material" moves: a new position, an exit, a share change of 25% or more, or any position worth $100M or more. That's why small trims like DaVita's −0.6% show up: the positions are large.
- DeepValues' own valuation check gave a clear result for only one of these. DaVita was sold below its estimated value (fair value around $310 against a price of about $161). For DAL, LEN and KR its estimates disagreed too much to make a call, and it has no valuation for BAC yet.

These are 13F filings, so the trades happened sometime during the quarter and were made public about 47 days after it ended. This is for information only, not investment advice.

### market-level

**Yes, by both measures the US market is expensive.** Both indicators sit in DeepValues' top zone, "significantly overvalued."

| Indicator | Reading | Zone | Historical percentile | As of |
|---|---|---|---|---|
| **Buffett Indicator** (US corporate equities ÷ GDP) | **255%** | Significantly overvalued (the zone starts at 135%; fair value is 90–115%) | **99.7th** | 2026-04-01 |
| **Shiller PE (CAPE)** | **36.44** | Significantly overvalued (the zone starts at 34; fair value is 22–28) | **91.5th** | 2026-11-20 |

**What the readings mean:**
- **Buffett Indicator:** 255% is the highest reading in the 5-year history I pulled. It's up from about 219% in January 2026 and about 213% a year earlier. At the 99.7th percentile, it has almost never been higher.
- **Shiller PE:** CAPE peaked around 42–42.7 from July to October 2026 and has dropped sharply this month, from about 40.2 on Nov 11 to 36.44 on Nov 20. That's roughly a 9% fall in about a week. It's still well above the 34 threshold and far above the fair-value range.

**Problems with the data:**
1. **The Buffett reading is about 7.5 months old.** It's quarterly and depends on GDP data, so it doesn't include the recent drop. A current reading would probably be lower, but still far into overvalued territory.
2. **Some of the "change" figures in the data don't match the history it returns.** I'd go by the levels above rather than these:
   - Buffett "MoM +16.2%" is actually the change from the previous quarter (219→255). Its "YoY +43.5%" doesn't fit 213→255, which is about +20%.
   - Shiller "MoM −3.75%" is actually a one-day change (37.86→36.44). The real change over the past month is about −11% (40.86→36.44).
3. **I haven't checked the sharp CAPE drop in November against another source.** It could be a real selloff, or an artifact of how the source (multpl) updates the earnings figures behind CAPE.

These indicators suggest low expected long-term returns, but they're poor tools for timing the market. Both have been "significantly overvalued" for most of the past five years. This is for information only, not investment advice.

### grounded-nvda

I pulled the DeepValues ai_context for NVDA. The data is **as of 2026-11-21T14:16:29Z**.

**A value investor's take on NVIDIA:** At a market cap of about $3.08 trillion, NVIDIA would need many years of very large earnings to justify its price, and the DeepValues context gives no earnings, cash-flow or intrinsic-value numbers to check whether that is happening. What the context does show is that large investors are buying: Cliff Asness's AQR grew its stake from about 37.8M to 44.5M shares ($10.2B, 3.0% of its portfolio) and Baillie Gifford's from about 41.9M to 42.6M shares ($9.7B, 9.2%) between the 2026-06-30 and 2026-09-30 filings. These are 13F filings and are only as current as 2026-09-30, and the buyers are mostly quant and growth managers rather than classic value investors; D. E. Shaw even trimmed to about 18.7M shares ($4.3B) last quarter. With 8-Ks filed on 2026-11-12 and 2026-11-17 that I haven't read, a disciplined value investor would hold off until those filings and the fundamentals show enough margin of safety at a $3 trillion price.

The context doesn't include sector, valuation multiples or financials, so this take can't make any valuation claim beyond the market cap. To firm it up, the next step is to run `fundamentals` or `intrinsic_value` and read the two November 8-Ks.

*Informational only, not investment advice.*

### filings-msft

According to DeepValues, Microsoft's most recent 10-K was filed on **July 29, 2026**. It covers fiscal year 2026, which ended June 30, 2026 ([filing](https://www.sec.gov/Archives/edgar/data/000789019/000119312526323660/msft-20260630.htm)). The 10-K before that was filed July 30, 2025, for fiscal year 2025.

**Other filings, newest first (20 most recent returned)**

| Filing date | Form | Notes |
|---|---|---|
| 2026-11-05 | 8-K | Event date Nov 4, 2026 |
| 2026-11-04 | 8-K | Event date Oct 29, 2026 |
| 2026-10-28 | 8-K (×2) | Filed the same day as the 10-Q, so probably the Q1 FY27 earnings release |
| 2026-10-28 | 10-Q | Quarter ended Sep 30, 2026 (Q1 FY27) |
| 2026-10-21 | DEF 14A | Final proxy statement; the listed date of Dec 8, 2026 is likely the annual meeting |
| 2026-09-02 | 8-K | |
| 2026-07-29 | 8-K | Filed the same day as the 10-K, so probably the Q4 FY26 earnings release |
| 2026-07-22 | PX14A6G | Exempt solicitation (a shareholder campaigning on a proxy vote) |
| 2026-07-15 | Form 4 | Insider trade |
| 2026-07-02 | PX14A6G | Exempt solicitation |
| 2026-07-01 | Form 4 | Insider trade |
| 2026-06-25 | 11-K (×2) | Annual reports for employee benefit plans, covering 2025 |
| 2026-06-12 to 06-16 | Form 4 (×5) | Insider trades: three on Jun 12, one on Jun 15, one on Jun 16 |

The most recent periodic report is the 10-Q filed October 28, 2026. Since then Microsoft has filed only 8-Ks. The data doesn't say what those 8-Ks are about, so the earnings-release labels above are guesses based on the timing. I can open any of the filings to confirm them.

### fundamentals-ko

DeepValues' latest annual figures for Coca-Cola (KO) are for **fiscal year 2025**, which ended December 31, 2025:

| Metric | FY2025 | FY2024 |
|---|---|---|
| Revenue | $47,941M | $47,061M |
| Net income | $13,107M | $10,631M |
| Free cash flow | $5,296M | $4,741M |

The API doesn't label units, but the numbers match Coca-Cola's reported results in millions of USD. All three metrics rose from FY2024.

### guru-lookup

I found Li Lu in the DeepValues guru roster under the slug `li-lu`, then pulled his profile.

## Who he is

DeepValues describes Li Lu, 58, as the founder of **Himalaya Capital** (started in 1997, based in Seattle). It classes him as a **value** investor.

- **Style:** He runs a very concentrated portfolio for a US fund. It often has fewer than 10 positions, holds them for years and turns over only a few percent a year.
- **Best-known move:** He introduced BYD to Charlie Munger in 2008. It became one of Berkshire Hathaway's most profitable non-US investments.
- **Background:** He was born in China and helped organise the Tiananmen-era student protests before moving to the US. He sometimes lectures at Columbia Business School, and his lectures circulate informally as PDFs.
- **Public profile:** Himalaya publishes no public investor letters, and Li Lu gives no media interviews.

## Top holdings (13F for the quarter ending 30 Sep 2026)

The fund holds 8 positions worth about **$3.78B** in total.

| # | Ticker | Company | Value | % of portfolio | Change in the quarter |
|---|---|---|---|---|---|
| 1 | PDD | PDD Holdings | $917M | 24.2% | **Added** |
| 2 | GOOGL | Alphabet (Class A) | $875M | 23.1% | Unchanged |
| 3 | GOOG | Alphabet (Class C) | $835M | 22.1% | Unchanged |
| 4 | BRK.B | Berkshire Hathaway | $552M | 14.6% | Unchanged |
| 5 | EWBC | East West Bancorp | $344M | 9.1% | Unchanged |
| 6 | TME | Tencent Music | $118M | 3.1% | **Added** |
| 7 | CROX | Crocs | $104M | 2.8% | Unchanged |
| 8 | AAPL | Apple | $37M | 1.0% | Unchanged |

**What stands out:**
- **Alphabet is the biggest bet.** Counting both share classes, it makes up about **45%** of the portfolio.
- **PDD is now the largest single line** after he added to it this quarter. He also added to Tencent Music.
- **The top four positions (Alphabet, PDD and Berkshire) make up about 84% of the fund.** That matches the concentrated style described above.

The DeepValues response didn't list Apple and East West in weight order, so I sorted the table by portfolio percentage. 13F filings only show US-listed long positions, so they leave out any holdings outside the US, such as BYD shares. This is for information only, not investment advice.

### sentiment-tsla

DeepValues has no sentiment reading for TSLA over the last 7 days, so I can't give you one or a source mix.

I checked the combined feed and then Reddit and StockTwits on their own. All three came back the same:

| Source | Posts | Bullish / Bearish / Neutral | Top source | As of |
|---|---|---|---|---|
| Combined | 0 | null / null / null | none | null |
| Reddit | 0 | null / null / null | none | null |
| StockTwits | 0 | null / null / null | none | null |

There are no posts, no percentages and no timestamp. A heavily discussed stock like Tesla showing zero posts almost certainly means DeepValues hasn't collected data for this ticker or window, not that value investors are quiet about it. Don't read it as neutral.

I can try a 30-day window, or file a free `request_data` asking DeepValues to cover TSLA sentiment. Either needs your go-ahead.

### unknown-ticker

DeepValues has no intrinsic value data for ZZZQ. The API returned a 404 "Ticker not found" error, so I can't give you a value and I won't estimate one.

Possible reasons:
- **The symbol may be wrong or may not exist.** If you know the company's name, I can search DeepValues for its correct ticker.
- **DeepValues may not cover it.** It only covers companies that file with the US SEC. If you need this ticker, I can send DeepValues a coverage request. It's free and needs no key.

You weren't charged for the failed call.
