# DeepValues agent evals, 2026-11-07

9/10 tasks passed. Model: default. Mode: keyless. Cost: $0.86.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | pass | ToolSearch, smart_money_holdings | 12.5 |  |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value, intrinsic_value | 18.2 |  |
| buffett-moves | pass | ToolSearch, guru_moves | 13.3 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 19.1 |  |
| grounded-nvda | pass | ToolSearch, ai_context | 11.3 |  |
| filings-msft | pass | ToolSearch, filings, filings | 15.3 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals | 11.0 |  |
| guru-lookup | pass | ToolSearch, gurus, guru | 20.5 |  |
| sentiment-tsla | pass | ToolSearch, sentiment, sentiment, sentiment | 14.6 |  |
| unknown-ticker | FAIL | ToolSearch, intrinsic_value | 8.5 | answer lacks /(?i)no data|not found|unknown|does ?n[o']t (exist|have)|could ?n[o']t find|no (such|matching)/ |

## Answers

### holders-aapl

The latest data is for the quarter ended **September 30, 2026** (Q3 2026, from 13F-HR filings). Only **two** of the investors DeepValues tracks held Apple that quarter, so I can't give you a top three.

| Rank | Investor (Fund) | Shares | Position value | % of portfolio | Change vs. Q2 |
|---|---|---|---|---|---|
| 1 | **Tom Gayner** (Markel Group) | 1,227,290 | ~$408.7M | 3.18% | Unchanged |
| 2 | **Dan Bin** (Oriental Harbor Investment) | 274,351 | ~$91.4M | 6.22% | New position |

- Together they hold about **$500.1M**, up 22.35% from the prior quarter. Most of that rise comes from Dan Bin's new position.
- Dan Bin's stake is less than a quarter the size of Gayner's, but Apple makes up a bigger share of his portfolio (6.22% vs. 3.18%).
- The tool only covers DeepValues' list of 60 tracked investors. Other large Apple holders aren't on that list or didn't report Apple this quarter, so this isn't a full picture of who owns Apple.

This is for information only, not investment advice.

### intrinsic-brkb

By DeepValues' blended estimate, BRK.B is trading slightly **above** intrinsic value: about 4% over it. But the two models behind that number disagree sharply, one well below the price and one well above, so the blend isn't strong evidence either way.

**Price vs. value**
- **Price:** $570.89 (Nov 6, 2026 close)
- **Blended fair value:** $548.81 per share
- **Gap:** about −3.9%, so the stock is roughly 4% above fair value

**The models:**

| Method | Conservative | Base | Optimistic |
|---|---|---|---|
| DCF on free cash flow (9.04% discount rate, 4.5% terminal growth) | $129.97 | **$329.84** | $627.96 |
| Owner earnings, Buffett-style (8.25% discount rate) | $537.45 | **$767.78** | $767.78 |
| Damodaran two-stage | n/a | n/a | n/a |

**Do they agree? No.**
- The DCF base case says the stock is about 42% overvalued.
- The owner-earnings base case says it is about 34% undervalued.
- The $549 blend is just the average of those two base cases. It lands near the price because the two big errors cancel out, not because the models agree.
- The third model, Damodaran, wasn't run. DeepValues treats it as unsuitable for financial companies, and Berkshire counts as one because of its insurance business.
- With Damodaran missing, there's no Monte Carlo range either. The only number given is the $549 midpoint, with no spread around it.

Owner earnings is probably the better fit for Berkshire. Free-cash-flow DCFs tend to undervalue insurance-heavy conglomerates, because insurance float and heavy reinvestment hold down reported free cash flow. That's my judgement, though, not something the tool says. Even the owner-earnings conservative case, $537, is a bit below the current price. So none of the base cases shows a clear margin of safety at $571.

One note: DeepValues lists the ticker as `BRK-B`; `BRK.B` returned "not found." This is data and analysis, not investment advice.

### buffett-moves

DeepValues' most recent Buffett (Berkshire Hathaway) 13F moves all come from the filing dated **2026-08-14**, which covers the quarter ending 2026-06-30:

| # | Ticker | Company | Action | Shares (before → after) | Position value | % of portfolio |
|---|---|---|---|---|---|---|
| 1 | GOOGL | Alphabet Inc. (Class A) | **Added** | 54.2M → 78.8M | ~$28.2B | 9.4% |
| 2 | BAC | Bank of America | **Trimmed** | 513.6M → 483.4M | ~$27.5B | 9.2% |
| 3 | GOOG | Alphabet (Class C) | **Added** | 3.6M → 27.2M | ~$9.6B | 3.2% |
| 4 | DVA | DaVita Inc. | **Trimmed** | 30.1M → 28.9M | ~$6.4B | 2.2% |
| 5 | DAL | Delta Air Lines | **Added** | 39.8M → 57.3M | ~$5.4B | 1.8% |

- None of the five are new positions or full exits. Three are adds and two are trims.
- **DeepValues' verdicts:**
  - **GOOGL:** "priced past our value." It closed at about $285 on 2026-11-06, against a value band of $134–$223.
  - **DVA:** "they sold below our value." It closed at about $191, against a band of $194–$324.
  - **DAL:** the site's estimates disagree too much to call.
  - **BAC and GOOG:** no valuation yet.
- **Coming up:** the Q3 2026 13F (quarter ending 2026-09-30) is due by mid-November, so it may change this picture soon.

This comes from DeepValues' data and is for information only, not investment advice.

### market-level

**Yes. Both DeepValues indicators put the US market in their most expensive zone.**

| Indicator | Current reading | Zone | Historical percentile | As of |
|---|---|---|---|---|
| **Buffett Indicator** (US corporate equities ÷ GDP) | **255%** | Significantly overvalued (threshold: above 135%) | **99.7th** | 2026-04-01 |
| **Shiller PE (CAPE)** | **38.9** | Significantly overvalued (threshold: above 34) | **93.5th** | 2026-11-06 |

**Buffett Indicator:** At 255%, it's close to double the 135% line where "significantly overvalued" starts, and almost no point in its history has been higher. It jumped from about 219% in January 2026 to 255% in April. The tool labels that rise "mom_change_pct" (+16%), but it's really a quarter-on-quarter change because the series is quarterly. The bigger caveat is that this reading is about 7 months old. It's built on quarterly GDP data, so it lags.

**Shiller PE:** 38.9 is well above the 34 threshold and only about 6% of its history has been higher. It's actually come down a bit from this summer's peak of about 42–42.6 (June to August 2026). Most of that drop came recently: it was around 40.6 on Nov 4 and fell to about 38.8 on Nov 5. Two of the tool's labels don't match its own history data:
- "mom_change_pct" (+0.3%) is really the one-day move from 38.79 to 38.91.
- "yoy_change_pct" (−4.8%) doesn't line up with the series either. November 2025 was 39.16, which works out to roughly −0.6% year over year.

**Bottom line:** One measure compares market cap to the size of the economy and the other compares prices to 10 years of inflation-adjusted earnings. Both are in their top valuation zone, at the 99.7th and 93.5th percentiles. Historically, readings this high have come before lower-than-average long-term returns. They've been a poor guide to short-term timing, though, because the market can stay expensive for years.

*This is for information only, not investment advice.*

### grounded-nvda

**DeepValues ai_context for NVDA, as of 2026-11-07T14:16:10Z**

NVIDIA has real moat economics: DeepValues describes it as an integrated platform built on CUDA, libraries, networking and systems that create meaningful switching costs, with a 71.1% gross margin, 76.3% ROE and 107.2% reported ROIC. A value investor still has to ask whether the $7.86 EPS is sustainable owner earnings or a cycle high, and DeepValues says the evidence doesn't yet show a dependable margin of safety at about $211–$212 per share, with a market cap of about $4.58 trillion. Smart money is split: as of the 2026-06-30 13F filings, Baillie Gifford, AQR, D. E. Shaw, Altimeter (19.2% of its portfolio) and Renaissance added shares, while Millennium, Citadel and Tiger Global trimmed. DeepValues rates it **WATCH**, meaning existing owners can hold within prudent concentration limits and new buyers should take at most a small, unleveraged starter position, saving most of their capital for stronger cash-flow evidence or a better price.

*The holdings data comes from 13F filings and is over four months old. This is for information only, not investment advice.*

### filings-msft

Microsoft's most recent 10-K was filed on **July 29, 2026**. It covers the fiscal year that ended June 30, 2026 ([filing](https://www.sec.gov/Archives/edgar/data/000789019/000119312526323660/msft-20260630.htm)). The one before it was filed July 30, 2025. Microsoft also filed an 8-K on July 29, 2026, which matches its usual practice of releasing earnings the same day.

**Other recent filings (newest first)**

| Filing date | Form | What it is |
|---|---|---|
| 2026-11-05 | 8-K | Current report (event dated Nov 4) |
| 2026-11-04 | 8-K | Current report (event dated Oct 29) |
| 2026-10-28 | 10-Q | Q1 FY2027 quarterly report (quarter ended Sep 30, 2026) |
| 2026-10-28 | 8-K (×2) | Two current reports, one likely the Q1 earnings release |
| 2026-10-21 | DEF 14A | Proxy statement for the annual shareholder meeting on Dec 8, 2026 |
| 2026-09-02 | 8-K | Current report |
| 2026-07-29 | 8-K | Current report (alongside the 10-K) |
| 2026-07-22, 2026-07-02 | PX14A6G (×2) | Exempt solicitations from shareholders, usually urging votes on proxy proposals |
| 2026-07-15, 2026-07-01 | Form 4 | Insider trading reports |
| 2026-06-25 | 11-K (×2) | Annual reports for employee benefit plans (plan year 2025) |
| 2026-06-12 to 06-16 | Form 4 (×10) | A batch of insider trading reports |

Since the 10-K, Microsoft has filed one 10-Q, several 8-Ks and the proxy statement for its December meeting. DeepValues only lists form types and dates, not what the 8-Ks are about. To find out what they cover, you'd need to open the filings themselves.

### fundamentals-ko

The most recent annual figures DeepValues has for Coca-Cola (KO) are for **fiscal year 2025**, the year ending Dec 31, 2025:

| Metric | FY2025 | FY2024 (for comparison) |
|---|---|---|
| Revenue | **$47,941M** | $47,061M |
| Net income | **$13,107M** | $10,631M |
| Free cash flow | **$5,296M** | $4,741M |

- **Units:** DeepValues doesn't label the units. The figures match Coca-Cola's reported results in millions of USD, so I've shown them that way.
- **Growth:** Revenue rose about 1.9% from FY2024. Net income rose about 23%, and free cash flow about 12%.
- **Other FY2025 figures:** capital expenditure was $2,112M and diluted EPS was $3.04.

This is for information only, not investment advice.

### guru-lookup

I found Li Lu in the DeepValues guru roster under the slug **`li-lu`**.

## Who he is, according to DeepValues

**Li Lu** runs **Himalaya Capital**, a value investing firm in Seattle that he founded in 1997.

- **Style:** very concentrated for a US fund. He usually holds fewer than 10 positions, keeps them for years, and trades very little each year.
- **Best-known contribution:** in 2008 he introduced BYD to Charlie Munger. It became one of Berkshire Hathaway's most profitable investments outside the US.
- **Background:** he was born in China and helped organise the student protests in the Tiananmen era before moving to the US. He sometimes lectures at Columbia Business School.
- **Low profile:** the firm publishes no investor letters, and he gives no media interviews.

DeepValues gives his age as 58. He was born in 1966, though, so he would be about 60 now, which suggests the bio is out of date.

## Top holdings (13F for the quarter ending 2026-06-30)

The filing shows 8 positions worth about **$3.70B** in total:

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

**What stands out:**
- **Alphabet is about 48% of the portfolio** across its two share classes, so it is by far his biggest bet.
- **Four names make up about 85%:** Alphabet, PDD, Berkshire and East West Bancorp.
- **He added to only two positions this quarter, PDD and Berkshire.** He left the rest unchanged, which fits his low-turnover style.
- **The 13F shows only his US-listed holdings.** Positions such as BYD, which trades in Hong Kong, don't have to be reported, so they don't appear here.

DeepValues presents this as information only, not investment advice.

### sentiment-tsla

DeepValues has no 7-day value-investor sentiment reading for TSLA right now, so I can't give you a reading or a source mix.

I queried the 7-day window three ways: combined, Reddit only and StockTwits only. All three came back empty:

| Source | Posts | Bullish | Bearish | Neutral | Top source |
|---|---|---|---|---|---|
| Combined | 0 | — | — | — | — |
| Reddit | 0 | — | — | — | — |
| StockTwits | 0 | — | — | — | — |

There was no `as_of` timestamp and no sample quotes. The call didn't fail; it returned no data. That's odd for a ticker as widely discussed as Tesla. Either the sentiment feed hasn't been updated for this window, or no posts got through DeepValues' value-investor filter, which is meant to screen out WallStreetBets-style noise.

I can try the 30-day window, or pull other value-oriented signals like recent guru or smart-money moves in TSLA, if either would help.

### unknown-ticker

DeepValues has no intrinsic value data for ZZZQ. The API returned a 404 "not_found" error that said "No intrinsic value data found for ticker ZZZQ," so I can't give you a value and won't estimate one.

Either the ticker is wrong, or DeepValues doesn't cover this company. If you think it's a typo or want to check a related name, I can run `companies_search` to find the right ticker.
