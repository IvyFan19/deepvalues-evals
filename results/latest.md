# DeepValues agent evals, 2026-11-18

10/10 tasks passed. Model: default. Mode: keyless. Cost: $0.93.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | pass | ToolSearch, smart_money_holdings | 9.3 |  |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value | 12.3 |  |
| buffett-moves | pass | ToolSearch, guru_moves | 12.6 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 13.2 |  |
| grounded-nvda | pass | ToolSearch, ai_context | 10.1 |  |
| filings-msft | pass | ToolSearch, filings, filings | 10.4 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals | 6.6 |  |
| guru-lookup | pass | ToolSearch, gurus, guru | 16.3 |  |
| sentiment-tsla | pass | ToolSearch, sentiment, sentiment, sentiment | 11.0 |  |
| unknown-ticker | pass | ToolSearch, intrinsic_value | 9.2 |  |

## Answers

### holders-aapl

The latest data is from the **quarter ending September 30, 2026** (Q3 2026 13F filings). In that quarter, 27 of the 60 tracked investors held Apple, with combined holdings worth about **$97.5B**.

**Top three by position size (dollar value):**

| # | Investor (Fund) | Shares | Position value | % of their portfolio | Change from prior quarter |
|---|---|---|---|---|---|
| 1 | **Warren Buffett** (Berkshire Hathaway) | 227.9M | ~$75.9B | 24.95% | No change |
| 2 | **Duan Yongping** (H&H International) | 21.2M | ~$7.06B | 41.07% | Sold 21.8% (−5.9M shares) |
| 3 | **Cliff Asness** (AQR Capital) | 20.9M | ~$6.96B | 2.06% | Bought 19.0% more (+3.3M shares) |

Berkshire's position alone is more than three-quarters of the $97.5B total. Duan Yongping's stake is smaller in dollars but makes up the largest share of any holder's portfolio, at 41%.

The other holders include D. E. Shaw, Citadel (Ken Griffin), Two Sigma, Gotham (Joel Greenblatt), Millennium, Baillie Gifford and Markel (Tom Gayner). Combined holdings were about 2.2% lower than the prior quarter.

### intrinsic-brkb

**The models disagree, so there's no single answer.** The DCF says Berkshire is overvalued and Owner Earnings says it's undervalued. Averaging the two gives a fair value below the price.

BRK.B closed at **$586.76** on Nov 17, 2026.

| Method | Fair value per share (base) | Low–high range | Compared with price |
|---|---|---|---|
| DCF on free cash flow | **$294.00** | $117.93 – $555.88 | Price is about 100% above this value |
| Owner Earnings (the headline value DeepValues shows) | **$659.00** | $461.30 – $659.00 | Price is about 11% below this value (about 12% upside) |
| Damodaran two-stage | Not produced | — | Not used for financial-sector companies |
| **Equal-weight blend** | **$476.50** | — | Price is about 23% above this value (about 19% downside) |

**How far apart they are:** Owner Earnings comes out about 2.2 times higher than the DCF. The price is above the DCF's most optimistic case ($556) but inside the Owner Earnings range.

**What I'd conclude:**
- **The blend ($476.50) says the stock is above intrinsic value**, by about 19%.
- **The headline Owner Earnings value ($659) says it's below intrinsic value**, by about 11%.

I'd trust Owner Earnings more here. A free-cash-flow DCF tends to undervalue an insurance-heavy company like Berkshire, because it doesn't capture the value of insurance float (premiums it holds and invests before paying claims). That's my judgment, not something the tool says. Even on the Owner Earnings view, the margin of safety is thin: the price is above that method's conservative case ($461).

The valuation is based on FY2025 SEC filings, and all of the tool's data checks passed. This is informational only, not investment advice.

### buffett-moves

Warren Buffett's most recent moves on DeepValues all come from one 13F filing, **filed 2026-11-16** for the quarter ended 2026-09-30. Here are the five largest by position size:

| # | Ticker | Company | Action | Shares (before → after) | Position value |
|---|---|---|---|---|---|
| 1 | BAC | Bank of America | **Trimmed** | 483.4M → 455.9M | ~$24.8B |
| 2 | DAL | Delta Air Lines | **Added** | 57.3M → 64.5M | ~$5.4B |
| 3 | DVA | DaVita | **Trimmed** | 28.88M → 28.70M | ~$5.0B |
| 4 | LEN | Lennar | **Added** | 13.1M → 26.0M (about double) | ~$2.1B |
| 5 | KR | Kroger | **Trimmed** | 39.0M → 35.0M | ~$2.1B |

Other moves in the same filing:
- **New:** Bending Spoons (BSP), 20.7M shares worth about $689M. This was the only new position.
- **Trimmed:** VeriSign (VRSN), Nucor (NUE) and Capital One (COF).
- **Added:** Macy's (M).
- **Exited:** none.

The DaVita trim is very small, about 0.6% of the shares. It shows up because the feed includes any position worth $100M or more, not only big changes.

A few of these holdings are unusual for Berkshire, especially Bending Spoons, Macy's and Delta, which Buffett sold in 2020. These rows come straight from DeepValues' feed, so check the SEC 13F filing before relying on them.

This is for information only, not investment advice.

### market-level

Yes. Both DeepValues indicators put the US market in their most expensive zone, "significantly overvalued."

| Indicator | Reading | Zone | Percentile vs. history | As of |
|---|---|---|---|---|
| **Buffett Indicator** (US corporate equities ÷ GDP) | **255%** | Significantly overvalued (above 135%) | **99.7th** | 2026-04-01 |
| **Shiller PE (CAPE)** | **38.76** | Significantly overvalued (above 34) | **93.0th** | 2026-11-17 |

**Buffett Indicator**
- At 255%, the market is almost twice the 135% line where the top zone starts. It's above about 99.7% of past readings, which makes it essentially a record high.
- It jumped about 16% in the last quarter (from 219% in January 2026) and about 44% over the past year.
- **The latest reading is from April 1, 2026, about 7.5 months ago.** That's because it depends on GDP data that comes out slowly. The current figure could be different, but it would have to fall by about half to leave the top zone.

**Shiller PE**
- At 38.76, it's above 93% of readings in its history. That's well over the 34 line for the top zone and the 22–28 "fair value" range.
- It's come down a little from its peak of about 42.6 in August 2026. It's down about 1% over the past month and about 5% over the past year. Even so, it's still near the highest levels it has ever reached.

**Bottom line:** By both measures, US stocks are expensive compared with history. High readings like these have tended to come before weaker long-run returns, but they're poor at predicting what happens in the short term. Markets can stay expensive for years. Both indicators also look at the market as a whole, so they say nothing about whether a particular stock is cheap or expensive.

*This is for information only and isn't investment advice.*

### grounded-nvda

**NVIDIA (NVDA): a value investor's take, based on DeepValues ai_context as of 2026-11-18T14:15:56Z**

NVIDIA is an exceptional, asset-light business with a real moat in CUDA, developer adoption, networking and full-stack accelerated computing, and its 71.1% gross margin shows that quality today. The risk is the price rather than the business: at about $156 a share (a market cap of about $3.81 trillion), the roughly 2.6% free-cash-flow yield only makes sense if cash flow grows in the low-to-mid teens for many years while margins stay unusually high. The reported 19.74 P/E looks cheap next to that thin cash-flow yield, so treat the stock as inexpensive only after you understand why the two numbers disagree. Smart money is still adding, with Baillie Gifford at 9.2% of its portfolio and Tiger Global at 13.6% as of 2026-09-30, but DeepValues rates it **WATCH**: existing owners can hold a properly sized position, while new buyers should build in small stages or wait for a lower price or clearer growth in free cash flow per share.

The ai_context response was cut off partway through its "Assessment of the Debate" section, so these four sentences use only the executive briefing and the data above it. It also gives no sector or industry for NVDA. This is not investment advice.

### filings-msft

According to DeepValues, Microsoft's most recent 10-K was **filed on July 29, 2026**. It covers the fiscal year ended June 30, 2026 ([document](https://www.sec.gov/Archives/edgar/data/000789019/000119312526323660/msft-20260630.htm)). The 10-K before that was filed on July 30, 2025.

**Filings since then, newest first:**

| Filed | Form | What it is |
|---|---|---|
| 2026-11-05 | 8-K | Event report (event dated Nov 4) |
| 2026-11-04 | 8-K | Event report (event dated Oct 29) |
| 2026-10-28 | 10-Q | Quarterly report for the quarter ended Sep 30, 2026 (Q1 of fiscal 2027) |
| 2026-10-28 | 8-K (two filings) | Event reports filed the same day as the 10-Q, probably including the earnings release |
| 2026-10-21 | DEF 14A | Proxy statement for the shareholder meeting on Dec 8, 2026 |
| 2026-09-02 | 8-K | Event report |
| 2026-07-29 | 8-K | Event report filed the same day as the 10-K, probably the earnings release |

**Earlier in summer 2026:**
- **PX14A6G** (exempt solicitations, which are shareholder proxy campaign materials): July 2 and July 22
- **11-K** (annual reports for employee stock plans): two filed on June 25
- **Form 4** (insider trades): a group of nine on June 12, plus June 15, June 16, July 1 and July 15

The filings list gives only the form type and dates, not what each 8-K is about. I can open any of these filings if you want to see what they say.

### fundamentals-ko

The latest annual figures for Coca-Cola (KO) in DeepValues are for **fiscal year 2025**, which ended December 31, 2025:

| Metric | FY2025 |
|---|---|
| Revenue | $47,941M |
| Net income | $13,107M |
| Free cash flow | $5,296M |

DeepValues doesn't state the units. I've read them as millions of USD because that matches the size of Coca-Cola's reported figures.

Compared with FY2024, revenue rose about 1.9% from $47,061M, net income rose about 23% from $10,631M, and free cash flow rose about 12% from $4,741M.

### guru-lookup

I found Li Lu in DeepValues' guru roster under the slug **`li-lu`** and pulled his profile from there.

## Who he is (according to DeepValues)

**Li Lu, 58**, founded **Himalaya Capital** in 1997 and runs it from Seattle. DeepValues classes him as a **value** investor.

- **Very concentrated:** usually fewer than 10 positions, held for several years, with low single-digit annual turnover.
- **Best-known move:** he introduced BYD to Charlie Munger in 2008. It became one of Berkshire Hathaway's most profitable non-US investments.
- **Background:** he was born in China and was a student-protest organiser around Tiananmen before moving to the US. He occasionally lectures at Columbia Business School, and those lectures circulate informally as PDFs.
- DeepValues says the firm publishes no investor letters and that Li gives no media interviews. That seems overstated: he has given public talks and some interviews over the years.

## Top holdings (13F filing for the quarter ending Sept 30, 2026)

Himalaya reported **8 positions worth about $3.78B** in total.

| # | Ticker | Company | Value | % of portfolio | Change vs. prior quarter |
|---|---|---|---|---|---|
| 1 | PDD | PDD Holdings | $917M | 24.2% | **Added** |
| 2 | GOOGL | Alphabet (Class A) | $875M | 23.1% | Unchanged |
| 3 | GOOG | Alphabet (Class C) | $835M | 22.1% | Unchanged |
| 4 | BRK.B | Berkshire Hathaway | $552M | 14.6% | Unchanged |
| 5 | EWBC | East West Bancorp | $344M | 9.1% | Unchanged |
| 6 | TME | Tencent Music Entertainment | $118M | 3.1% | **Added** |
| 7 | CROX | Crocs | $104M | 2.8% | Unchanged |
| 8 | AAPL | Apple | $37M | 1.0% | Unchanged |

**Key takeaways:**
- **Alphabet is effectively his largest position.** The two share classes together make up about 45% of the portfolio, ahead of PDD at 24%.
- **The top four companies (Alphabet, PDD, Berkshire, East West) are about 93% of the portfolio.**
- **He added only to China-linked names this quarter (PDD and TME).** Everything else was unchanged.
- A 13F only covers US-listed long positions. Holdings outside the US, such as the BYD shares listed in Hong Kong, won't appear here.

This is for information only, not investment advice.

### sentiment-tsla

DeepValues has no TSLA sentiment reading for the last 7 days, so I can't give you a reading or a source mix.

I checked the combined feed and then Reddit and StockTwits separately. All three came back empty:

| Source | Posts | Bullish / Bearish / Neutral | Top source | As of |
|---|---|---|---|---|
| Combined | 0 | null / null / null | — | null |
| Reddit | 0 | null / null / null | — | null |
| StockTwits | 0 | null / null / null | — | null |

There were no posts in the window, and the empty "as of" field means there's no snapshot at all. That doesn't show sentiment is neutral. It suggests DeepValues isn't currently tracking TSLA, or the data feed has a gap.

Some options:
- **Try the 30-day window**, in case the 7-day one is just thin.
- **Use another DeepValues signal**, such as recent `news`, or which value investors have bought or sold TSLA lately (`guru_moves` and `smart_money_changes`).
- **Ask DeepValues to add TSLA sentiment** through their free `request_data` tool.

### unknown-ticker

DeepValues has no intrinsic value for ZZZQ. The API returned a 404: "No intrinsic value data found for ticker ZZZQ." I'm not going to give an estimate without data behind it.

Possible reasons:
- **The ticker might be mistyped or not exist.** ZZZQ doesn't look like a real listed symbol. If you meant another company, give me its name and I can look up the right ticker with DeepValues' company search.
- **DeepValues may not cover the company.** If you know ZZZQ is a real ticker, I can send DeepValues a free request to add coverage for it.
