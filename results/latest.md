# DeepValues agent evals, 2026-11-04

9/10 tasks passed. Model: default. Mode: keyless. Cost: $0.82.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | pass | ToolSearch, smart_money_holdings | 45.4 |  |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value | 30.1 |  |
| buffett-moves | pass | ToolSearch, gurus, guru_moves | 29.2 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 111.0 |  |
| grounded-nvda | pass | ToolSearch, ai_context | 37.0 |  |
| filings-msft | pass | ToolSearch, filings, filings | 21.3 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals | 36.7 |  |
| guru-lookup | pass | ToolSearch, gurus, guru | 55.3 |  |
| sentiment-tsla | pass | ToolSearch, sentiment, sentiment, sentiment | 19.0 |  |
| unknown-ticker | FAIL | ToolSearch, intrinsic_value | 31.0 | answer lacks /(?i)no data|not found|unknown|does ?n[o']t (exist|have)|could ?n[o']t find|no (such|matching)/ |

## Answers

### holders-aapl

Only **two** tracked investors hold AAPL in the latest data, which is for the **quarter ending September 30, 2026** (Q3 2026 13F filings). So there is no third holder to name.

| Rank | Investor (Fund) | Shares | Position value | % of portfolio | Change vs prior quarter |
|---|---|---|---|---|---|
| 1 | **Tom Gayner** (Markel Group) | 1,227,290 | ~$408.7M | 3.18% | Unchanged |
| 2 | **Dan Bin** (Oriental Harbor Investment) | 274,351 | ~$91.4M | 6.22% | New position |

Together the two positions are worth about **$500.1M**. Tracked investors' combined AAPL holdings rose about 22% from the prior quarter, mostly because Dan Bin opened a new position.

DeepValues only tracks 60 investors, and Berkshire Hathaway isn't among the AAPL holders it returned this quarter.

### intrinsic-brkb

I couldn't get a fair value for BRK.B. The DeepValues intrinsic-value call was refused, so I don't have a fair value, a price comparison, or an answer on whether the models agree.

**Why:** This network address has used up its free daily allowance without a key (25 calls a day in total, 5 for this endpoint). The allowance resets at 00:00 UTC, about 9.7 hours from now.

**Ways to unlock it now (each needs you to do or approve something):**
1. **Connect your DeepValues account:** re-add the MCP server as `https://app.deepvalues.ai/api/mcp?login` and sign in once in the browser. No key to copy.
2. **Create a live API key with no account:** this needs a contact email, and the key comes with 1 starter credit (one intrinsic-value call costs 0.005 credits). I didn't send your email without asking. Tell me if I should use luluventures.ivy@gmail.com or another address.
3. **Wait** until the daily reset and run the call again.

DeepValues also offers a sandbox key that doesn't need an email. I didn't use it because sandbox keys are usually meant for testing and may not return real valuations.

**Something to expect when it runs:** Berkshire is largely an insurance and financial company. This tool's cash-flow models (free-cash-flow DCF, owner earnings, Damodaran two-stage) can return no value for financial companies and mark them as unavailable for that reason. So the result may include fewer than three methods, or none. If that happens, I can try the `brief` or `verdict` tools for another view.

Tell me which option you want and I'll run it.

### buffett-moves

DeepValues lists these as Berkshire Hathaway's most recent filed moves. They all come from one 13F filing for the quarter ending 2026-06-30, **filed 2026-08-14**.

| # | Ticker | Company | Action | Shares (before → after) | Position value |
|---|---|---|---|---|---|
| 1 | GOOGL | Alphabet (Class A) | **Added** | 54.25M → 78.79M (+45%) | ~$28.2B (9.4% of portfolio) |
| 2 | BAC | Bank of America | **Trimmed** | 513.62M → 483.39M (−6%) | ~$27.5B (9.2%) |
| 3 | GOOG | Alphabet (Class C) | **Added** | 3.59M → 27.19M (~7.6x) | ~$9.6B (3.2%) |
| 4 | DVA | DaVita | **Trimmed** | 30.10M → 28.88M (−4%) | ~$6.4B (2.2%) |
| 5 | DAL | Delta Air Lines | **Added** | 39.81M → 57.32M (+44%) | ~$5.4B (1.8%) |

- **No new positions or exits** are among these five. I only asked for five rows, so the same filing may include other moves, possibly new buys or exits, that aren't shown here.
- **This is the most recent Berkshire filing DeepValues has.** A 13F for the quarter ending 2026-09-30 would normally be due around mid-November 2026, so it hasn't appeared yet.
- **The filing came out 45 days after the quarter ended.** The trades happened somewhere in the April–June quarter, not on the filing date.

This is for information only, not investment advice.

### market-level

Yes. Both DeepValues measures put the US market in their most expensive zone, close to the top of its historical range.

| Indicator | Current reading | Zone | Historical percentile | As of |
|---|---|---|---|---|
| **Buffett Indicator** (US corporate equities ÷ GDP) | **255.0%** | Significantly overvalued (above 135%) | **99.7th** | 2026-04-01 |
| **Shiller PE (CAPE)** | **40.13** | Significantly overvalued (above 34) | **98.6th** | 2026-10-30 |

**Buffett Indicator**
- At 255%, it's almost double the 135% line where "significantly overvalued" starts.
- It jumped from about 219% in January 2026, and it's up about 44% from a year earlier.
- This is the highest reading in the 5-year history the tool returned. It's above the 2021 peak of about 219%.
- The most recent data point is from April 1, 2026, about seven months ago, because it depends on quarterly GDP and Fed data. Today's actual level could be different.

**Shiller PE**
- At 40.13, it's well above the 34 threshold.
- It has stayed around 40–41 since May 2026, and it's up about 2.5% from a year ago.
- It's above the late-2021 level of about 38.6. The only time it has been clearly higher was around 1999–2000, when it peaked near 44.

**Bottom line:** Both indicators say US stocks are priced near historical extremes compared with the size of the economy and with inflation-adjusted average earnings. Neither one is good at predicting when prices will turn; markets can stay expensive for years. Historically, though, readings this high have been followed by below-average long-term returns.

*This is for information only and isn't investment advice.*

### grounded-nvda

**NVIDIA (NVDA): a value investor's take, based on DeepValues ai_context as of 2026-11-04T14:19:24Z**

NVIDIA is a high-return platform business rather than just a chip supplier: CUDA and its full-stack integration create real switching costs, and it reports a 71.1% gross margin, 76.3% ROE and 107.2% ROIC. The catch for a value investor is price. At about $211–$212 per share and a roughly $5.07 trillion market cap, DeepValues rates it **WATCH**, saying the evidence "does not establish a dependable margin of safety." The key open question is whether the $7.86 EPS reflects lasting owner earnings or an unusually favorable point in the cycle, which is about 27x earnings if it holds. Smart money is split: Baillie Gifford, AQR, D. E. Shaw, Altimeter and Renaissance added shares while Millennium, Citadel and Tiger Global trimmed (13Fs as of 2026-06-30), so the sensible move is to keep existing holdings within prudent size limits or start only a small, unleveraged position, saving most capital for stronger cash-flow evidence or a lower price.

*Notes: The ~27x multiple is my own calculation ($211.5 ÷ $7.86); it isn't in the source. The 13F positions are from mid-2026 and may have changed since. This is informational only, not investment advice.*

### filings-msft

According to DeepValues, Microsoft's last 10-K was filed on **July 29, 2026**. It covers fiscal year 2026, which ended June 30, 2026 ([filing](https://www.sec.gov/Archives/edgar/data/000789019/000119312526323660/msft-20260630.htm)).

**Other recent filings (20 most recent, newest first):**

| Filing date | Form | What it is |
|---|---|---|
| 2026-10-28 | 10-Q | Quarterly report for the quarter ended Sep 30, 2026 (Q1 of fiscal 2027) |
| 2026-10-28 | 8-K (×2) | Current reports filed the same day as the 10-Q |
| 2026-10-21 | DEF 14A | Proxy statement; the listed date (Dec 8, 2026) is likely the annual shareholder meeting |
| 2026-09-02 | 8-K | Current report |
| 2026-07-29 | 10-K | Annual report for fiscal year 2026 |
| 2026-07-29 | 8-K | Current report filed the same day as the 10-K |
| 2026-07-22 | PX14A6G | Exempt proxy solicitation (filed by a shareholder, not by Microsoft) |
| 2026-07-15 | Form 4 | Insider transaction |
| 2026-07-02 | PX14A6G | Exempt proxy solicitation (filed by a shareholder) |
| 2026-07-01 | Form 4 | Insider transaction |
| 2026-06-25 | 11-K (×2) | Annual reports for employee benefit plans, for the year ended Dec 31, 2025 |
| 2026-06-16 | Form 4 | Insider transaction |
| 2026-06-15 | Form 4 | Insider transaction |
| 2026-06-12 | Form 4 (×5) | Insider transactions |

The pattern is typical: each periodic report (10-K or 10-Q) was filed the same day as one or more 8-Ks. I didn't open the 8-Ks, so I haven't confirmed what they say, but same-day 8-Ks usually announce quarterly earnings. The PX14A6G filings are shareholder campaigns ahead of the December meeting.

### fundamentals-ko

According to DeepValues, Coca-Cola's (KO) latest annual results are for **fiscal year 2025**, which ended December 31, 2025:

| Metric | FY2025 | FY2024 |
|---|---|---|
| Revenue | $47,941M | $47,061M |
| Net income | $13,107M | $10,631M |
| Free cash flow | $5,296M | $4,741M |

The data doesn't state its units. I've assumed the figures are in millions of US dollars, since that fits KO's reported scale (about $47.9B in revenue).

Compared with FY2024, revenue rose about 1.9%, net income about 23% and free cash flow about 12%.

### guru-lookup

I found Li Lu's slug, `li-lu`, in the guru roster and pulled his profile from DeepValues.

## Who Li Lu is, according to DeepValues
- **Fund:** Himalaya Capital, which he founded in 1997. It's based in Seattle and DeepValues classes it as a value investor.
- **Style:** Very concentrated by US standards. The fund often holds fewer than 10 stocks, keeps them for years and has low single-digit annual turnover.
- **Best known for:** Introducing BYD to Charlie Munger in 2008. That became one of Berkshire Hathaway's most profitable non-US investments.
- **Background:** Born in China, he helped organize student protests in the Tiananmen era before moving to the US. He lectures at Columbia Business School now and then. DeepValues says the firm publishes no investor letters and that he gives no media interviews.
- DeepValues gives his age as 58. Most public sources put his birth year at 1966, which would make him about 60 now, so the profile may be out of date.

## Top holdings (13F filing for the quarter ending June 30, 2026)
**Total: about $3.70B across 8 positions**

| # | Ticker | Company | Value | % of portfolio | Change |
|---|---|---|---|---|---|
| 1 | GOOGL | Alphabet (Class A) | $908.9M | 24.55% | Unchanged |
| 2 | GOOG | Alphabet (Class C) | $866.1M | 23.39% | Unchanged |
| 3 | PDD | PDD Holdings | $820.9M | 22.17% | **Added** |
| 4 | BRK.B | Berkshire Hathaway | $554.6M | 14.98% | **Added** |
| 5 | EWBC | East West Bancorp | $358.4M | 9.68% | Unchanged |
| 6 | CROX | Crocs | $107.0M | 2.89% | Unchanged |
| 7 | TME | Tencent Music | $55.0M | 1.49% | Unchanged |
| 8 | AAPL | Apple | $32.0M | 0.86% | Unchanged |

**Main points:**
- **Alphabet is about 48% of the fund** when you add the two share classes together.
- **The top four names (Alphabet, PDD and Berkshire) make up about 85%.**
- This quarter he **added to PDD and Berkshire** and left every other position the same. He didn't sell anything or start any new positions.
- A 13F only shows US-listed long positions. It doesn't show any Asian holdings he owns directly, such as BYD shares listed in Hong Kong.

This is for information only and isn't investment advice.

### sentiment-tsla

DeepValues has no sentiment data for TSLA in the last 7 days, so there's no reading or source mix to give you.

I checked three ways:

| Source | Window | Posts | Bullish / Bearish / Neutral | Top source |
|---|---|---|---|---|
| Combined | 7d | 0 | null / null / null | — |
| Reddit | 7d | 0 | null / null / null | — |
| StockTwits | 7d | 0 | null / null / null | — |

All three came back with zero posts and no sample quotes. The `as_of` field was also null, which means the dataset hasn't been refreshed for this ticker, not that it was refreshed and found nothing.

This is very unlikely to be real silence: TSLA is one of the most-discussed stocks anywhere. The more likely cause is that DeepValues' sentiment feed isn't covering TSLA right now, or isn't returning data at all. Either way, it's not a neutral reading and shouldn't be read as one.

If you want, I can try the 30-day window, or pull DeepValues' guru and smart-money moves, theses or news on TSLA for a different view of what value investors think.

### unknown-ticker

I couldn't get an intrinsic value for ZZZQ. DeepValues refused the request before looking up the ticker, so I don't know whether it has data on ZZZQ. I'm not going to estimate a number.

The refusal was a quota limit (HTTP 429, `quota_exceeded`). Without credentials, each address gets 25 DeepValues calls a day and 5 for this endpoint, and this address has used them up. The allowance resets at 00:00 UTC, about 9.6 hours from now.

To get the answer, you can do one of these:

1. **Sign in once:** re-add the DeepValues MCP server as `https://app.deepvalues.ai/api/mcp?login` and sign in through the browser. There's no key to paste.
2. **Get an API key, no account needed:** `POST https://app.deepvalues.ai/api/v1/keys`. With an email you get a live key with 1 starter credit. This call costs 0.005 credits, and it isn't charged if the value is withheld. I didn't create one because it would send your email address to DeepValues. Tell me if you want me to, and with which address.
3. **Wait** for the reset and I'll run it again.

Once I can make the call, I'll tell you plainly if DeepValues has no ZZZQ data or withholds the value.
