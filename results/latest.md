# DeepValues agent evals, 2026-11-19

10/10 tasks passed. Model: default. Mode: keyless. Cost: $0.84.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | pass | ToolSearch, smart_money_holdings | 26.1 |  |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value | 75.4 |  |
| buffett-moves | pass | ToolSearch, guru_moves | 101.6 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 31.8 |  |
| grounded-nvda | pass | ToolSearch, ai_context | 27.6 |  |
| filings-msft | pass | ToolSearch, filings, filings | 32.6 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals | 22.3 |  |
| guru-lookup | pass | ToolSearch, gurus, guru | 30.7 |  |
| sentiment-tsla | pass | ToolSearch, sentiment, sentiment, sentiment | 17.5 |  |
| unknown-ticker | pass | ToolSearch, intrinsic_value | 10.1 |  |

## Answers

### holders-aapl

Ranked by position size, the three largest AAPL holders among DeepValues' tracked gurus are below. The data is from the latest 13F filings, for the quarter ending **September 30, 2026 (Q3 2026)**.

| # | Investor (Fund) | Shares | Position value | % of their portfolio | Change from prior quarter |
|---|---|---|---|---|---|
| 1 | **Warren Buffett** (Berkshire Hathaway) | 227.9M | ~$75.9B | 24.95% | Unchanged |
| 2 | **Duan Yongping** (H&H International) | 21.2M | ~$7.06B | 41.07% | Trimmed 21.8% (−5.9M shares) |
| 3 | **Cliff Asness** (AQR Capital) | 20.9M | ~$6.96B | 2.06% | Added 19.0% (+3.3M shares) |

**Overall:**
- **27 of the roughly 60 tracked gurus** hold AAPL, with about **$97.5B** in combined value. That total is down 2.23% from the prior quarter.
- Berkshire's stake alone is about 78% of the combined value.
- Of the top three, Apple is the biggest share of Duan Yongping's portfolio, at 41%.
- The rest of the list:
  - The next largest holders are D. E. Shaw (~$1.67B), Citadel/Ken Griffin (~$1.52B), Two Sigma (~$1.35B) and Joel Greenblatt (~$1.01B).
  - Dan Bin (Oriental Harbor) opened a new position.
  - Renaissance Technologies sold almost all of its shares (−99.8%).

13F data is reported after a delay of up to 45 days after the quarter ends, so these positions may have changed since. This is informational only, not investment advice.

### intrinsic-brkb

**It depends on which model you trust, because they disagree a lot.** On the blended value, BRK.B is about 17% above intrinsic value. On the lead model DeepValues headlines, it's about 15% below.

**Price:** $574.62 (as of 2026-11-18)

| Method | Conservative | Base | Optimistic | Base vs. price |
|---|---|---|---|---|
| Owner Earnings (the lead model) | $461 | **$659** | $659 | ~15% upside |
| DCF on free cash flow | $118 | **$295** | $558 | ~49% downside |
| Damodaran two-stage | n/a | n/a | n/a | Not run: the tool says it doesn't suit financial-sector companies |
| **Equal-weight blend** (average of the two base cases) | | **$477** | | **~17% downside** |

**Do they agree? No.** The two base cases are more than 2x apart ($295 vs. $659). Even the DCF's optimistic case ($558) is below the price, and the Owner Earnings conservative case ($461) is below it too. So which side of the price you land on comes down to which method you pick.

- **Owner Earnings ($659):** This is the Buffett-style measure and the one DeepValues headlines. It says the stock is modestly undervalued.
- **DCF ($295):** This one says the stock is clearly overvalued. A free-cash-flow DCF probably understates Berkshire, since it doesn't capture insurance float or the large equity portfolio well. That's my judgement, not something the tool reports.
- **Blend ($477):** This is just the average of a high and a low number, so it hides how far apart they are. The tool also gave no Monte Carlo range for it, because that range comes from the Damodaran model, which didn't run.

All of the tool's data checks passed: fresh price, consistent currency, positive value, and no flags.

If you lean toward Owner Earnings, which fits Berkshire better, BRK.B looks slightly undervalued at about $659 fair value. On the blend, it looks somewhat overvalued at about $477.

This is data and analysis, not investment advice.

### buffett-moves

DeepValues shows these as Warren Buffett's five most recent moves. They all come from the 13F for the quarter ending Sept 30, 2026, which was filed with the SEC on **2026-11-16**.

| # | Ticker | Company | Action | Shares (prev → now) | Position value |
|---|---|---|---|---|---|
| 1 | BAC | Bank of America | **Trimmed** | 483.4M → 455.9M (−5.7%) | ~$24.8B (8.2% of portfolio) |
| 2 | DAL | Delta Air Lines | **Added** | 57.3M → 64.5M (+12.4%) | ~$5.4B (1.8%) |
| 3 | DVA | DaVita | **Trimmed** | 28.88M → 28.70M (−0.6%) | ~$5.0B (1.7%) |
| 4 | LEN | Lennar | **Added** | 13.1M → 26.0M (+98.6%, roughly doubled) | ~$2.1B (0.7%) |
| 5 | KR | Kroger | **Trimmed** | 39.0M → 35.0M (−10.3%) | ~$2.1B (0.7%) |

None of these five is a new position or a full exit.

DeepValues' feed only includes a move if it's a new position, a full exit, a change of 25% or more in share count, or a position worth $100M or more. Most of these rows got in on the $100M rule, which is why a tiny change like the DaVita trim shows up.

DeepValues' own valuation comment says Buffett trimmed DaVita at a price below its intrinsic value estimate (the stock is about 29% below the midpoint). It doesn't have a valuation for Bank of America, and it says its estimates for Delta, Lennar and Kroger disagree too much to call.

This is for information only, not investment advice.

### market-level

**Yes. By both measures, US stocks are expensive.** Both tools put the market in their most expensive zone, "significantly overvalued."

| Indicator | Reading | Zone | Historical percentile | As of |
|---|---|---|---|---|
| **Buffett Indicator** (US corporate equities ÷ GDP) | **255%** | Significantly overvalued (above 135%) | **99.7th** | 2026-04-01 |
| **Shiller PE (CAPE)** | **38.6** | Significantly overvalued (above 34) | **93.0th** | 2026-11-18 |

**Buffett Indicator**
- 255% is about 2.2× the top of the tool's fair-value band (90–115%), and almost no point in its history has been higher.
- It rose from about 219% in January 2026 to 255% in April. The earlier peak in late 2021 was about 219%, so this reading is well above it.
- **This reading is about 7.5 months old.** It's quarterly and depends on GDP and Fed flow-of-funds data, which come out with a lag. Today's actual figure could be different.
- The tool's own "month-over-month" and "year-over-year" figures (+16.2% / +43.5%) don't match its history. For example, April 2025 was 213 and April 2026 was 255, which is about +20% year over year. I'd rely on the levels, not those change fields.

**Shiller PE**
- This reading is current, as of yesterday. At 38.6 it is well above the fair-value band of 22–28.
- It's down from a peak of about 42.7 in mid-August 2026 and has fallen most of this month (it was about 40.6 on Nov 4). That's a small cooling, but it's still near record territory, roughly where it was in late 2021 (about 38).

**What it means:** Both readings are at or near record highs, so the market is pricing in a lot of future growth. Historically, readings this high have been followed by below-average returns over the next 10 years. They are poor timing tools, though: markets can stay this expensive for years, as 2021–2026 showed.

*For information only, not investment advice.*

### grounded-nvda

**NVIDIA (NVDA): a value investor's take, based on DeepValues ai_context as of 2026-11-19T14:19:22.250Z**

NVIDIA is an exceptional business with very little invested capital. Its moat comes from CUDA, developer adoption, networking and its full-stack accelerated computing, and that strength shows in a 71.1% gross margin, extraordinary returns on capital and no evidence of financial distress. The problem is the price, not the company: at about $156 a share (roughly $3.7 trillion market cap), the stock has only a ~2.6% free-cash-flow yield, which seems to require low-to-mid-teens cash-flow growth for many years while margins stay unusually high. The reported 19.74 P/E conflicts with that cash-flow valuation and needs to be reconciled before treating the stock as cheap, because the discount only appears in the optimistic case and offers little protection if margins normalize, cash conversion stays weak, or inference demand shifts to custom chips. DeepValues rates it **WATCH**, even though smart money has been adding as of 2026-09-30 (AQR, Baillie Gifford, Millennium and Tiger Global added; D. E. Shaw trimmed), so existing owners can hold a properly sized position, while new buyers should enter small and in stages or wait for a better price or clearer per-share free-cash-flow growth.

---
Notes:
- The context listed sector and industry as "n/a."
- The $156 share price and the 19.74 P/E both come from DeepValues' own briefing, which itself says they don't agree with each other. Check the numbers before acting on them.
- This is for information only, not investment advice.

### filings-msft

According to DeepValues, Microsoft last filed a 10-K on **July 29, 2026**. It covers the fiscal year ended June 30, 2026 ([filing](https://www.sec.gov/Archives/edgar/data/000789019/000119312526323660/msft-20260630.htm)). The 10-K before that was filed on July 30, 2025, for the year ended June 30, 2025.

**Recent filings, newest first:**

| Filing date | Form | Period / notes |
|---|---|---|
| 2026-11-05 | 8-K | Event date Nov 4, 2026 |
| 2026-11-04 | 8-K | Event date Oct 29, 2026 |
| 2026-10-28 | 10-Q | Quarter ended Sep 30, 2026 (Q1 of fiscal 2027) |
| 2026-10-28 | 8-K (×2) | Same day as the 10-Q, probably the earnings release |
| 2026-10-21 | DEF 14A | Proxy for the annual meeting on Dec 8, 2026 |
| 2026-09-02 | 8-K | Event date Sep 2, 2026 |
| 2026-07-29 | 10-K | Fiscal year ended Jun 30, 2026 |
| 2026-07-29 | 8-K | Filed with the 10-K, probably the FY26 Q4 earnings release |
| 2026-07-22 | PX14A6G | Shareholder proxy solicitation |
| 2026-07-15 | Form 4 | Insider transaction |
| 2026-07-02 | PX14A6G | Shareholder proxy solicitation |
| 2026-07-01 | Form 4 | Insider transaction |
| 2026-06-25 | 11-K (×2) | Employee benefit plan annual reports (plan year 2025) |
| 2026-06-12 to 06-16 | Form 4 (×10) | Insider transactions: 7 on Jun 12, plus Jun 15 and Jun 16 |

**Summary of form types:** 10-K (annual report), 10-Q (quarterly report), 8-K (current reports, often earnings), DEF 14A (proxy statement), PX14A6G (proxy solicitations filed by shareholders), 11-K (annual reports for employee plans) and Form 4 (insider trades).

The data only gives the form type and dates, not what each 8-K is about. The earnings-release guesses are based on the 8-Ks filed the same day as the 10-K and 10-Q, so open the links on SEC EDGAR to confirm what each one contains.

### fundamentals-ko

The latest annual figures DeepValues has for Coca-Cola (KO) are for **fiscal year 2025**, which ended December 31, 2025:

| Metric | FY2025 | FY2024 (for comparison) |
|---|---|---|
| Revenue | **$47,941M** | $47,061M |
| Net income | **$13,107M** | $10,631M |
| Free cash flow | **$5,296M** | $4,741M |

The data doesn't state its units. I've read the figures as millions of USD, because that's the only scale that fits Coca-Cola's size.

Compared with FY2024, revenue rose about 1.9%, net income about 23% and free cash flow about 12%.

### guru-lookup

I found Li Lu in the guru roster under the slug **`li-lu`** and pulled his profile with that slug.

## Who Li Lu is (per DeepValues)

Li Lu, 58, founded **Himalaya Capital** in 1997 and runs it from Seattle. DeepValues describes his style as:
- **Value investing, very concentrated:** usually fewer than 10 positions.
- **Long holds:** positions are kept for years, with low single-digit annual turnover.
- **The BYD introduction:** he introduced BYD to Charlie Munger in 2008. It became one of Berkshire Hathaway's most profitable non-US investments.
- **Background:** he was born in China and organised student protests around Tiananmen before moving to the US. He lectures occasionally at Columbia Business School.
- **Low profile:** DeepValues says the firm publishes no public investor letters and Li gives no media interviews.

## Top holdings (13F for Q3 2026, quarter ended 30 Sep)

The filing shows 8 positions worth about **$3.78B** in total. The API didn't return them in order, so I've sorted them by weight:

| # | Ticker | Company | Value | % of portfolio | Change vs. prior quarter |
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
- **Alphabet is the biggest position overall.** Counting both share classes, it's about **45%** of the portfolio.
- **PDD is now the largest single line,** after he added to it this quarter.
- **The top four make up about 84%** (Alphabet, PDD and Berkshire).
- **He added to PDD and Tencent Music.** No position was trimmed or sold.

These figures come only from 13F filings. Those cover US-listed long positions, so any holdings outside the US (such as BYD shares held directly) won't appear here. This is for information only, not investment advice.

### sentiment-tsla

DeepValues has no sentiment reading for TSLA over the last 7 days, so there's no reading or source mix to give you.

I checked the combined, Reddit and StockTwits sources separately for the 7-day window, and all three returned the same thing:

| Source | Posts | Bullish / Bearish / Neutral | Top source | As of |
|---|---|---|---|---|
| Combined | 0 | null / null / null | — | null |
| Reddit | 0 | null / null / null | — | null |
| StockTwits | 0 | null / null / null | — | null |

There's no timestamp on the data either. That suggests DeepValues hasn't collected anything for TSLA in this window, which is different from "neutral" sentiment. TSLA normally gets a lot of posts, so zero posts probably means the data is missing, not that nobody was posting.

I could check the 30-day window to see if there's any older data, or file a free `request_data` ticket asking DeepValues to fill in TSLA sentiment.

### unknown-ticker

DeepValues has no intrinsic value data for ZZZQ. The API returned a 404 error: "No intrinsic value data found for ticker ZZZQ." I don't have a value to give you, and I won't estimate one.

The API only covers companies that file with the US SEC, so either ZZZQ isn't a valid ticker or DeepValues doesn't cover it. I can do one of these next:
- **Find the right ticker:** if you tell me the company name, I can search DeepValues for its correct ticker and run the valuation again.
- **Ask for coverage:** I can send DeepValues a free coverage request for ZZZQ. I haven't sent one because it goes to an outside service, so tell me if you want it.
