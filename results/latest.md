# DeepValues agent evals, 2026-11-16

9/10 tasks passed. Model: default. Mode: keyless. Cost: $0.81.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | pass | ToolSearch, smart_money_holdings | 11.3 |  |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value | 12.9 |  |
| buffett-moves | pass | ToolSearch, guru_moves | 13.8 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 13.0 |  |
| grounded-nvda | pass | ToolSearch, ai_context | 13.9 |  |
| filings-msft | pass | ToolSearch, filings, filings | 12.5 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals | 8.4 |  |
| guru-lookup | pass | ToolSearch, gurus, guru | 15.9 |  |
| sentiment-tsla | pass | ToolSearch, sentiment, sentiment, sentiment | 11.1 |  |
| unknown-ticker | FAIL | ToolSearch, intrinsic_value | 8.6 | answer lacks /(?i)no data|not found|unknown|does ?n[o']t (exist|have)|could ?n[o']t find|no (such|matching)/ |

## Answers

### holders-aapl

The data covers the quarter ending **September 30, 2026** (Q3 2026, from 13F-HR filings). In that quarter, **12 of the investors DeepValues tracks held AAPL**, with about **$1.24B** in combined positions. That total is down about 30% from the prior quarter.

**Top three by position size:**

| # | Investor (fund) | Shares | Value | % of portfolio | Change from prior quarter |
|---|---|---|---|---|---|
| 1 | Baillie Gifford | 1,626,854 | $541.8M | 0.51% | Trimmed 7.6% |
| 2 | Tom Gayner (Markel Group) | 1,227,290 | $408.7M | 3.18% | Unchanged |
| 3 | George Soros (Soros Fund Management) | 393,680 | $131.1M | 2.47% | Trimmed 25.7% |

**The other nine holders, largest first:** Dan Bin (Oriental Harbor, new position, $91.4M), Mario Gabelli (GAMCO), Francis Chou, Dodge & Cox, François Rochon (Giverny), Tom Russo, Jim Simons (Renaissance, cut 99.8% to almost nothing), Polen Capital and Sequoia Fund.

**Other notes:**
- By share of portfolio, the most committed holders are Francis Chou (6.29%) and Dan Bin (6.22%), even though their positions are much smaller in dollars.
- Berkshire Hathaway is not on the list. The tool only covers DeepValues' 60 tracked investors, so this may not mean Berkshire sold AAPL.

### intrinsic-brkb

**The two models disagree, so there's no single answer.** The headline Owner Earnings model says BRK.B is about 10% undervalued. The DCF says it's well overvalued. Averaging the two puts it about 20% above intrinsic value.

**Price:** $592.94 (close on Nov 13, 2026)

| Method | Conservative | Base | Optimistic | Base vs. price |
|---|---|---|---|---|
| **Owner Earnings** (the one DeepValues headlines) | $460.53 | **$657.90** | $657.90 | **~11% below fair value** (undervalued) |
| **DCF on free cash flow** | $117.38 | **$292.26** | $552.30 | **~103% above fair value** (overvalued) |
| Damodaran two-stage | — | not computed | — | — |
| **Average of the two base values** | | **$475.08** | | **~20% above fair value** (overvalued) |

**The Owner Earnings model is the better fit here:**
- **Damodaran was skipped.** The tool doesn't run it for financial-sector companies, and Berkshire's insurance business puts it in that group. So the average has only two models in it, not three. That also means there's no Monte Carlo range: only the midpoint is filled in.
- **The two models differ by more than 2x ($292 vs. $658).** A cash-flow DCF tends to undervalue Berkshire. Insurance float, large investment holdings and heavy capital spending in the railroad and utility businesses all push its free cash flow down. Owner Earnings (Buffett's own measure) adjusts for that. This is why DeepValues headlines that number.
- **Even Owner Earnings gives little room for error.** Its base value is about 11% above the price, but its conservative case ($460.53) is below today's price.

Both models use FY2025 SEC figures. All the data quality checks passed: price is fresh and the currency matches. This is data and analysis, not investment advice.

### buffett-moves

DeepValues' five most recent filed moves for Warren Buffett all come from one 13F. It covers the quarter ending June 30, 2026 and was **filed August 14, 2026**.

| # | Ticker | Company | Action | Shares (before → after) | Position value |
|---|---|---|---|---|---|
| 1 | GOOGL | Alphabet Inc. (Class A) | **Added** | 54.2M → 78.8M (+45%) | ~$28.2B (9.4% of portfolio) |
| 2 | BAC | Bank of America | **Trimmed** | 513.6M → 483.4M (−6%) | ~$27.5B (9.2%) |
| 3 | GOOG | Alphabet (Class C) | **Added** | 3.6M → 27.2M (~7.6×) | ~$9.6B (3.2%) |
| 4 | DVA | DaVita Inc. | **Trimmed** | 30.1M → 28.9M (−4%) | ~$6.4B (2.2%) |
| 5 | DAL | Delta Air Lines | **Added** | 39.8M → 57.3M (+44%) | ~$5.4B (1.8%) |

- **No new positions or exits** appear in these five. The feed seems to order moves from the same filing by position size, so smaller new positions or exits from that 13F could fall outside the top five.
- **The Q3 2026 13F isn't in the feed yet.** It was due around November 14, so it may have been filed but not reached DeepValues. Moves from July through September won't show here until it does.
- **13F data is delayed.** These trades were made by June 30 and only became public 45 days later.

This is informational only, not investment advice.

### market-level

Yes. By both measures the US market is expensive compared with its own history.

| Indicator | Reading | Zone | Historical percentile | As of |
|---|---|---|---|---|
| **Buffett Indicator** (US corporate equities ÷ GDP) | **255.0%** | Significantly overvalued (above 135%) | **99.7th** | 2026-04-01 |
| **Shiller PE (CAPE)** | **39.95** | Significantly overvalued (above 34) | **93.8th** | 2026-11-13 |

**Buffett Indicator**
- 255% is the highest reading in the 5-year history I pulled. The 2021 peak was about 219%.
- It is about 2.2 times the top of the tool's "fair value" band (115%) and almost 1.9 times the "significantly overvalued" line (135%).
- It rose 43.5% year over year and about 16% from the previous reading (Jan 2026: 219%).
- This reading is about 7½ months old. The series is quarterly and depends on GDP and Fed data, so it may have changed since April.

**Shiller PE**
- 39.95 is above the tool's "significantly overvalued" line (34) and well above its "fair value" range (22–28).
- It has eased slightly: down 2.3% from a year ago and about 2% from the 2026 highs near 42.6 in August. It is still near the top of its history.
- This is the more current reading, as of last Friday.

**Bottom line:** Both measures put the market in their most expensive zone. The Buffett Indicator is close to its all-time historical extreme and the Shiller PE is in the top ~6%. High valuations have historically pointed to lower long-run (10-year) returns, but they are poor at predicting when prices will fall. Markets can stay expensive for years.

*This is for information only, not investment advice.*

### grounded-nvda

**NVIDIA (NVDA): a value investor's take, using DeepValues ai_context as of 2026-11-16T14:15:58Z**

NVIDIA is an exceptional business: DeepValues cites a 71.1% gross margin and a 107.2% ROIC, and says CUDA, its software tools, networking and full systems create real switching costs that go well beyond any single chip. The main long-term risk isn't the share price moving around but whether NVIDIA can keep raising prices, which cloud providers' in-house chips, competition in inference and dependence on a few large customers could all wear down. On a market cap of about $3.99 trillion, DeepValues' stance is WATCH rather than BUY, because its own sources disagree on the price ($163, $220, and above $230) and don't give free cash flow per share, net cash or stock-based compensation for a single date. Its suggested plan is to verify the data first, buy at most 25% of a target position only if a price near $163 is confirmed and normalized free cash flow per share is $6–8, not chase at $220–230, and add later only on proof of cash flow, gross margin and inference demand, never just because the price fell.

**Notes on the data:**
- The guru data is mixed. Baillie Gifford added shares in its September 30, 2026 filing (now 42.6M shares, 9.2% of its portfolio). As of June 30, Altimeter, AQR and D. E. Shaw added, while Citadel, Millennium and Tiger Global trimmed. I left this out of the four sentences because it doesn't point one way.
- DeepValues doesn't resolve the price conflict itself, so the valuation conclusion depends on which price is right. Check the current quote before acting on it.
- The context shows sector and industry as "n/a," and the research text was cut off partway through. Some parts of the full analysis may be missing.

This is for information only, not investment advice.

### filings-msft

Microsoft's most recent 10-K was filed on **July 29, 2026**. It covers the fiscal year ended June 30, 2026 ([document](https://www.sec.gov/Archives/edgar/data/000789019/000119312526323660/msft-20260630.htm)). The one before it was filed on July 30, 2025, for fiscal year 2025.

**Filings since the 10-K, newest first:**

| Filed | Form | Notes |
|---|---|---|
| 2026-11-05 | 8-K | Event dated Nov 4, 2026 |
| 2026-11-04 | 8-K | Event dated Oct 29, 2026 |
| 2026-10-28 | 8-K (×2) | Filed alongside the Q1 FY27 earnings |
| 2026-10-28 | 10-Q | Quarter ended Sep 30, 2026 (Q1 FY2027) |
| 2026-10-21 | DEF 14A | Proxy for the annual meeting on Dec 8, 2026 |
| 2026-09-02 | 8-K | — |
| 2026-07-29 | 8-K | Filed the same day as the 10-K (likely the FY26 Q4 earnings release) |

**Filed shortly before the 10-K:**
- **PX14A6G** (shareholder-proposal solicitations by outside parties): July 22 and July 2, 2026
- **Form 4** (insider trades): July 15, July 1, June 16, June 15, and three on June 12, 2026
- **11-K** (employee benefit plan annual reports): two on June 25, 2026

In short, Microsoft has filed its fiscal-year 10-K, one quarterly 10-Q, the proxy for the December annual meeting, and a steady run of 8-Ks. The DeepValues data doesn't say what each 8-K is about. The September 2 and November 4–5 filings could be things like debt or governance announcements; the links above go to the full documents if you need the details.

### fundamentals-ko

DeepValues' latest annual figures for Coca-Cola (KO) are for **fiscal year 2025**, which ended December 31, 2025:

| Metric | FY2025 |
|---|---|
| Revenue | $47,941M |
| Net income | $13,107M |
| Free cash flow | $5,296M |

The data doesn't state its units. I've assumed millions of USD, which fits the size of KO's reported results.

Free cash flow is much lower than net income. DeepValues lists capital spending of $2,112M, so cash from operations would be about $7.4B. That points to a large one-off cash outflow in operating cash flow during 2025, but the data doesn't say what it was.

### guru-lookup

In DeepValues' guru roster, Li Lu's slug is **`li-lu`**. He's listed in the value style group.

## Who Li Lu is (according to DeepValues)

- **Fund:** Himalaya Capital, which he founded in 1997 and runs from Seattle.
- **Style:** Very concentrated value investing. The portfolio often has fewer than 10 positions, he holds them for years, and he sells very little each year.
- **Best known for:** Introducing BYD to Charlie Munger in 2008. That became one of Berkshire Hathaway's most profitable non-US investments.
- **Background:** He was born in China and helped organize the Tiananmen-era student protests before moving to the US. He sometimes lectures at Columbia Business School.
- **Public profile:** Himalaya publishes no public investor letters, and Li Lu gives no media interviews.
- The bio gives his age as 58. He's generally reported as born in 1966, which would make him about 60 now, so that part of the bio may be out of date.

## Top holdings (13F for the quarter ending June 30, 2026)

The filing shows 8 positions worth about **$3.70B** in total.

| # | Ticker | Company | Value | % of portfolio | Change vs. prior quarter |
|---|---|---|---|---|---|
| 1 | GOOGL | Alphabet Class A | $908.9M | 24.55% | unchanged |
| 2 | GOOG | Alphabet Class C | $866.1M | 23.39% | unchanged |
| 3 | PDD | PDD Holdings | $820.9M | 22.17% | **added** |
| 4 | BRK.B | Berkshire Hathaway B | $554.6M | 14.98% | **added** |
| 5 | EWBC | East West Bancorp | $358.4M | 9.68% | unchanged |
| 6 | CROX | Crocs | $107.0M | 2.89% | unchanged |
| 7 | TME | Tencent Music | $55.0M | 1.49% | unchanged |
| 8 | AAPL | Apple | $32.0M | 0.86% | unchanged |

**What stands out:**
- **Alphabet is about 48% of the portfolio** when you add the two share classes together.
- Alphabet, PDD and Berkshire together make up about 85%.
- **He added to PDD and Berkshire** this quarter and left every other position unchanged.

A 13F only shows US-listed long positions, so it may not include all of Himalaya's holdings, such as its long-reported stake in BYD. The figures are from the June 2026 quarter; the filing for the September quarter isn't in DeepValues yet. This is for information only and isn't investment advice.

### sentiment-tsla

DeepValues has no TSLA sentiment reading for the last 7 days, so there's no reading or source mix to give you.

| Source | Posts | Bullish / Bearish / Neutral | Top source |
|---|---|---|---|
| Combined | 0 | null / null / null | none |
| Reddit | 0 | null / null / null | none |
| StockTwits | 0 | null / null / null | none |

All three came back with 0 posts and no timestamp. That means DeepValues has nothing on TSLA for this window. It doesn't mean sentiment was neutral. TSLA is one of the most discussed stocks there is, so zero posts most likely means a gap in their data rather than a quiet week.

I can check the 30-day window to see whether any data exists at all, or file a `request_data` report with DeepValues about the gap. Filing is free and doesn't need an account.

### unknown-ticker

DeepValues has no intrinsic value for ZZZQ. The API returned a 404 error: "No intrinsic value data found for ticker ZZZQ." So I can't give you a valuation for it, and I won't estimate one.

ZZZQ may not be a real or listed ticker, or DeepValues may simply not cover it. If you meant a different symbol, give me the company name and I can look up the right ticker with DeepValues' company search. If ZZZQ is real and you need it, DeepValues takes free coverage requests through its `request_data` tool. I haven't sent one; tell me if you'd like me to.
