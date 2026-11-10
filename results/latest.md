# DeepValues agent evals, 2026-11-10

9/10 tasks passed. Model: default. Mode: keyless. Cost: $0.93.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | pass | ToolSearch, smart_money_holdings | 10.1 |  |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value, companies_search, intrinsic_value | 15.2 |  |
| buffett-moves | pass | ToolSearch, gurus, guru_moves | 17.0 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 12.6 |  |
| grounded-nvda | pass | ToolSearch, ai_context | 12.5 |  |
| filings-msft | pass | ToolSearch, filings, filings | 17.7 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals | 8.3 |  |
| guru-lookup | pass | ToolSearch, gurus, guru | 19.1 |  |
| sentiment-tsla | pass | ToolSearch, sentiment, sentiment, sentiment, sentiment | 12.4 |  |
| unknown-ticker | FAIL | ToolSearch, intrinsic_value | 7.3 | answer lacks /(?i)no data|not found|unknown|does ?n[o']t (exist|have)|could ?n[o']t find|no (such|matching)/ |

## Answers

### holders-aapl

The data is from the quarter ending **September 30, 2026** (Q3 2026 13F filings). Only three of the roster's ~60 tracked investors hold AAPL, so these three are the full list:

| # | Investor (Fund) | Shares | Position value | % of their portfolio | Change vs. Q2 |
|---|---|---|---|---|---|
| 1 | **Baillie Gifford** (Baillie Gifford & Co) | 1,626,854 | ~$541.8M | 0.51% | Trimmed by 133,737 shares (−7.6%) |
| 2 | **Tom Gayner** (Markel Group) | 1,227,290 | ~$408.7M | 3.18% | Unchanged |
| 3 | **Dan Bin** (Oriental Harbor Investment) | 274,351 | ~$91.4M | 6.22% | New position |

Together they hold about $1.04B of AAPL, up about 4.7% from last quarter.

- Baillie Gifford has the largest position in dollars, but Apple is a small part of its portfolio. Dan Bin has the smallest position in dollars, but Apple makes up the largest share of his portfolio, and he only bought it this quarter.
- Berkshire Hathaway isn't on the list. Either Berkshire isn't in DeepValues' tracked roster, or it didn't report an AAPL position for this quarter. I didn't check which.

13F data is reported up to 45 days after the quarter ends, so these positions may have changed since. This is for information only, not investment advice.

### intrinsic-brkb

**BRK-B is trading slightly above the blended fair value, about 5% above it. The two models that ran disagree sharply, so treat the blend loosely.**

Price: **$575.25** (as of Nov 9, 2026). DeepValues uses the ticker `BRK-B`, not `BRK.B`.

| Method | Conservative | Base | Optimistic | Base vs. price |
|---|---|---|---|---|
| DCF on free cash flow (9.06% discount rate, 4.5% terminal growth) | $129.53 | **$328.45** | $625.09 | ~43% below price → overvalued |
| Owner earnings (8.26% discount rate) | $536.51 | **$766.45** | $766.45 | ~33% above price → undervalued |
| Damodaran two-stage | — | not computed | — | Skipped because the method doesn't suit a financial-sector company |
| **Equal-weight blend** | | **$547.45** | | **−4.8% implied upside** |

**Do the models agree? No.** They point in opposite directions. The owner-earnings base is more than twice the DCF base ($766 vs. $328). The blend lands near the price only because it averages those two. With Damodaran skipped, there's no Monte Carlo, so the tool gives no confidence range (p10–p90 are empty).

**What this means:** The result is "roughly fairly valued, maybe a bit expensive," but the number rests on two methods that conflict. A free-cash-flow DCF tends to undervalue Berkshire, because the insurance float and the large cash and investment holdings don't show up well as free cash flow. Owner earnings is closer to how Berkshire itself thinks about value. If you trust owner earnings more, the stock looks cheap. If you trust the DCF, it looks expensive. The tool can't settle which one is right.

The inputs are FY2025 SEC filings, and all the tool's data checks passed. This is informational only, not investment advice.

### buffett-moves

DeepValues' five most recent material moves for Warren Buffett (Berkshire Hathaway) all come from the same 13F filing. It was **filed 2026-08-14** and covers the quarter ended 2026-06-30.

| # | Ticker | Company | Action | Shares (before → after) | Position value |
|---|---|---|---|---|---|
| 1 | GOOGL | Alphabet (Class A) | **Added** | 54.2M → 78.8M (+45%) | ~$28.2B (9.4% of portfolio) |
| 2 | BAC | Bank of America | **Trimmed** | 513.6M → 483.4M (−6%) | ~$27.5B (9.2%) |
| 3 | GOOG | Alphabet (Class C) | **Added** | 3.6M → 27.2M (about 7.6x) | ~$9.6B (3.2%) |
| 4 | DVA | DaVita | **Trimmed** | 30.1M → 28.9M (−4%) | ~$6.4B (2.2%) |
| 5 | DAL | Delta Air Lines | **Added** | 39.8M → 57.3M (+44%) | ~$5.4B (1.8%) |

- **No new positions or full exits appear here.** I asked for the five most recent rows only. Other moves from the same filing may exist, including new or exited positions.
- **Some trims are small.** DeepValues counts a move if the share count changed by 25% or more, or if the position is worth $100M or more. The Bank of America and DaVita trims count only because the positions are large.
- **The next filing hasn't been posted yet.** Berkshire's 13F for the quarter ended 2026-09-30 is due around Nov 14 and isn't in the feed.
- **DeepValues' notes on these moves:** Alphabet (GOOGL) now trades at about $288, which is above its estimated value range of $134–$223, so it says "the move has played out." DaVita was sold below its estimated value. Delta's estimates disagree too much to call. Bank of America and the Class C Alphabet shares don't have a valuation yet.

Ask if you want the full list from this filing. This is informational only, not investment advice.

### market-level

Yes. Both indicators put the US market in their most expensive zone.

| Indicator | Reading | Zone | Historical percentile | As of |
|---|---|---|---|---|
| **Buffett Indicator** (US corporate equities ÷ GDP) | **255%** | Significantly overvalued (above 135%) | **99.7th** | 2026-04-01 |
| **Shiller PE (CAPE)** | **39.85** | Significantly overvalued (above 34) | **93.8th** | 2026-11-09 |

**Buffett Indicator**
- At 255%, it is nearly double the 135% line where the tool's "significantly overvalued" zone starts, and about 2.2× the top of its fair-value band (115%).
- It's above roughly 99.7% of past readings, so close to the highest on record.
- It rose about 43.5% year over year and about 16% from the prior reading on 2026-01-01. The tool labels that second figure "month over month," but the data is quarterly.
- **This reading is about 7 months old.** It depends on quarterly GDP and Fed data, so it lags. It doesn't show how prices have moved since April.

**Shiller PE**
- At 39.85, it's well above the "significantly overvalued" line of 34 and the 28 top of the fair-value range.
- It's above about 94% of past readings.
- It's down about 3% from a year ago and below its 2026 peak of about 42.7 in mid-August. Prices have eased a little, but they are still very high.

**Bottom line:** Both measures say US stocks are expensive. One is in the top 1% of its history and the other is in the top 6–7%. Both are long-run measures: high readings have historically pointed to lower returns over the next 10 years or so, but they're poor at predicting short-term moves or timing. Some argue they overstate how expensive the market is, because large US companies now earn more of their profits overseas and have higher profit margins.

This is for information only and isn't investment advice.

### grounded-nvda

**NVDA: a value investor's view (DeepValues ai_context as of `2026-11-10T14:15:59.572Z`)**

NVIDIA earns returns that few businesses ever reach: a 71.1% gross margin, 76.3% ROE and a reported 107.2% ROIC, backed by CUDA, its software libraries, networking and full-stack integration, which make it costly for customers to switch. Even so, a ~$4.38 trillion market cap and a share price of roughly $211–$212 leave no clear margin of safety, because nobody yet knows whether the $7.86 EPS is lasting owner earnings or a cyclical peak. Large investors disagree too: Baillie Gifford added to 42.6M shares (9.2% of its portfolio) as of 2026-09-30, and Altimeter, AQR and D. E. Shaw added in Q2, while Millennium, Citadel and Tiger Global trimmed. DeepValues rates it **WATCH**: current owners can hold within sensible position-size limits, and new buyers should take at most a small, unleveraged starter position and save most of their capital for stronger cash-flow evidence or a lower price.

---
- I rounded some figures (42.6M shares, ~$4.38T). The price is given only as an approximate range, which works out to about 27× that $7.86 EPS. Most of the institutional moves are from 13F filings dated 2026-06-30, so they are months old.
- The research briefing in the response was cut off partway through, so this take doesn't reflect any bear-case points it may have included.
- This is for information only, not investment advice.

### filings-msft

According to DeepValues, Microsoft last filed a 10-K on **July 29, 2026**. It covers fiscal year 2026, which ended June 30, 2026 ([filing](https://www.sec.gov/Archives/edgar/data/000789019/000119312526323660/msft-20260630.htm)). The one before that was filed July 30, 2025.

**Recent filings, newest first:**

| Filing date | Form | Notes |
|---|---|---|
| 2026-11-05 | 8-K | Event dated Nov 4, 2026 |
| 2026-11-04 | 8-K | Event dated Oct 29, 2026 |
| 2026-10-28 | 8-K (×2) | Two filed the same day as the Q1 FY2027 report, likely including the earnings release |
| 2026-10-28 | **10-Q** | Quarter ended Sep 30, 2026 (Q1 FY2027) |
| 2026-10-21 | **DEF 14A** | Proxy statement for the annual meeting on Dec 8, 2026 |
| 2026-09-02 | 8-K | Event dated Sep 2, 2026 |
| 2026-07-29 | **10-K** | FY2026 annual report |
| 2026-07-29 | 8-K | Same day as the 10-K, likely the Q4 earnings release |
| 2026-07-22 | PX14A6G | Exempt solicitation, filed by a shareholder rather than Microsoft |
| 2026-07-02 | PX14A6G | Exempt solicitation, filed by a shareholder |
| 2026-07-15, 07-01 | Form 4 | Insider trades |
| 2026-06-25 | 11-K (×2) | Annual reports for employee benefit plans |
| 2026-06-12 to 06-16 | Form 4 (×10) | Batch of insider trading reports; eight were filed on June 12 |

**Summary:** Since the 10-K, Microsoft has filed one 10-Q (Oct 28), a proxy statement ahead of its Dec 8 annual meeting (Oct 21), and five 8-Ks. The latest 8-K was filed Nov 5, 2026. This list covers the 25 most recent filings, going back to mid-June 2026.

### fundamentals-ko

The latest annual period in DeepValues for Coca-Cola (KO) is **fiscal year 2025**, which ended December 31, 2025.

| Metric | FY2025 | FY2024 |
|---|---|---|
| Revenue | $47,941M | $47,061M |
| Net income | $13,107M | $10,631M |
| Free cash flow | $5,296M | $4,741M |

- **Units:** DeepValues doesn't state units. These figures look like millions of US dollars, since KO's revenue is about $48B.
- **Growth:** revenue rose about 1.9% from FY2024, net income about 23%, and free cash flow about 12%.
- **Capital spending:** capex was $2,112M in FY2025, so implied operating cash flow is about $7.4B.

### guru-lookup

I found Li Lu in the roster under the slug **`li-lu`** and then pulled his profile.

## Who Li Lu is, according to DeepValues

Li Lu founded **Himalaya Capital** in 1997 and runs it from Seattle. DeepValues highlights:

- **Very concentrated portfolio:** usually fewer than 10 positions, held for years, with turnover in the low single digits each year.
- **His best-known public-markets contribution:** introducing **BYD** to Charlie Munger. Berkshire invested in 2008, and it became one of Berkshire's most profitable non-US investments.
- **Background:** born in China, he helped organise the Tiananmen-era student protests before moving to the US. He sometimes lectures at Columbia Business School, and those lectures circulate informally as PDFs.
- **Low profile:** DeepValues says the firm publishes no public investor letters and that Li gives no media interviews.

Two parts of the bio look questionable. It gives his age as 58, but he was born in 1966, which would make him about 60. And "gives no media interviews" overstates it, since he has given some talks and interviews.

## Top holdings (13F for Q2 2026, quarter ending June 30, 2026)

Total reported value is about **$3.70B** across **8 positions**.

| # | Ticker | Company | Value | % of portfolio | Change in Q2 |
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
- **Alphabet is about 48% of the portfolio** once you add the two share classes together.
- **The top four positions (Alphabet, PDD and Berkshire) make up about 85%.**
- **His only Q2 changes were additions to PDD and Berkshire.** Nothing was sold and no new positions were opened.
- **The BYD stake isn't shown here.** 13F filings only cover US-listed securities, and BYD trades in Hong Kong.

This is for information only and isn't investment advice.

### sentiment-tsla

DeepValues has no TSLA sentiment data for the last 7 days, so there's no reading or source mix to give you.

The query ran without errors but came back empty:

| Query | Posts | Bullish / Bearish / Neutral | Top source |
|---|---|---|---|
| Combined, 7d | 0 | null / null / null | none |
| Reddit, 7d | 0 | null / null / null | none |
| StockTwits, 7d | 0 | null / null / null | none |
| Combined, 30d | 0 | null / null / null | none |

There's also no `as_of` timestamp. That suggests DeepValues hasn't collected any sentiment data for TSLA at all, rather than finding neutral sentiment. A TSLA reading of zero posts is very unlikely to be accurate, so it's probably a gap in their data and shouldn't be read as "no one is talking about Tesla."

If it helps, I can pull other DeepValues data on TSLA instead. Options are guru and smart-money position changes, or their AI research brief and verdict. Either would show how value investors are positioned, though not short-term chatter.

### unknown-ticker

DeepValues has no intrinsic value for ZZZQ. The API returned a 404 with the message "No intrinsic value data found for ticker ZZZQ." I can't give you a number, and I won't estimate one.

The ticker may be wrong, or DeepValues may simply not cover this company. If you have the company name or think the ticker has a typo, I can search for the right ticker in DeepValues and try again.
