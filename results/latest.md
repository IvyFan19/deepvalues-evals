# DeepValues agent evals, 2026-11-14

9/10 tasks passed. Model: default. Mode: keyless. Cost: $0.91.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | pass | ToolSearch, smart_money_holdings | 12.4 |  |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value | 13.4 |  |
| buffett-moves | pass | ToolSearch, guru_moves | 12.5 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 13.1 |  |
| grounded-nvda | pass | ToolSearch, ai_context | 10.4 |  |
| filings-msft | pass | ToolSearch, filings, filings | 12.1 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals | 9.5 |  |
| guru-lookup | pass | ToolSearch, gurus, guru | 15.8 |  |
| sentiment-tsla | pass | ToolSearch, sentiment, sentiment, sentiment | 12.2 |  |
| unknown-ticker | FAIL | ToolSearch, intrinsic_value | 7.9 | answer lacks /(?i)no data|not found|unknown|does ?n[o']t (exist|have)|could ?n[o']t find|no (such|matching)/ |

## Answers

### holders-aapl

The data is from the **quarter ending September 30, 2026** (Q3 2026), based on 13F-HR filings. In DeepValues' 60-investor roster, 11 tracked investors hold AAPL, with about **$1.24B** in combined positions. That total is down 29.85% from the prior quarter.

**Top three by position size:**

| # | Investor (Fund) | Shares | Position value | % of portfolio | Change vs. Q2 |
|---|---|---|---|---|---|
| 1 | **Baillie Gifford** (Baillie Gifford & Co) | 1,626,854 | $541.8M | 0.51% | Cut by 7.6% (−133,737 shares) |
| 2 | **Tom Gayner** (Markel Group) | 1,227,290 | $408.7M | 3.18% | Unchanged |
| 3 | **George Soros** (Soros Fund Management) | 393,680 | $131.1M | 2.47% | Cut by 25.7% (−135,858 shares) |

**The other holders, by size:** Dan Bin (new position, $91.4M), Mario Gabelli ($39.8M), Francis Chou ($13.3M), Dodge & Cox ($10.3M), François Rochon ($4.1M), Tom Russo ($1.6M), Renaissance Technologies ($1.1M) and Polen Capital ($1.0M).

**Things worth knowing:**
- **Berkshire Hathaway is not on the list.** Long known as Apple's largest guru holder, it shows no AAPL holding in this dataset for this quarter. I haven't checked why.
- **Renaissance Technologies sold 99.8% of its stake** (about 1.58M shares) and kept only a token position.
- **Two investors have Apple as a large share of their portfolio:** Francis Chou (6.29%) and Dan Bin (6.22%).

### intrinsic-brkb

**The models disagree, so there's no single answer.** BRK.B closed at **$592.94** on Nov 13, 2026. The blended fair value is below that price, but the Owner Earnings model, which DeepValues shows as its headline number, is above it.

| Method | Conservative | Base | Optimistic | Base vs. price |
|---|---|---|---|---|
| DCF on free cash flow (9.3% discount, 4.5% terminal growth) | $118 | **$295** | $558 | −50% |
| Owner Earnings (8.4% discount) | $464 | **$662** | $662 | **+11.7%** |
| Damodaran two-stage | — | n/a | — | Not run: the tool says it doesn't suit financial-sector companies |
| **Equal-weight blend** (DCF + Owner Earnings) | | **$479** | | **−19.3%** (above fair value) |

**How to read it:**
- **Owner Earnings (headline value): $662**, so the stock trades about 10% **below** fair value. This method is closer to how Berkshire itself thinks about its earnings.
- **Blend: $479**, so the stock trades about 24% **above** fair value. The DCF pulls the blend down a lot.
- **They're far apart.** The base cases are $295 and $662, more than 2× apart. Even the DCF's optimistic case ($558) is below today's price, and the Owner Earnings conservative case ($464) is not far above the DCF base. The gap is also large compared with the stock's ~19% distance from the blend.
- **Why they split:** a free-cash-flow DCF tends to undervalue Berkshire. Its insurance float, large equity portfolio and cash pile don't show up well as projected free cash flow, so I'd give the DCF less weight here. The Damodaran model didn't run, so no Monte Carlo range is available and the blend rests on just two methods.

**Bottom line:** on the method best suited to Berkshire, BRK.B looks modestly cheap, about 10% below a $662 fair value. On the plain blend it looks about 24% overvalued. That's a split result, not a clear signal. The valuation uses FY2025 statements, all of the tool's data checks passed, and this is data, not investment advice.

### buffett-moves

DeepValues' latest Warren Buffett (Berkshire Hathaway) moves all come from one 13F filing, **filed 2026-08-14** for the quarter ending 2026-06-30. Here are the five largest by position size:

| # | Ticker | Company | Action | Shares (before → after) | Position value | Filed |
|---|---|---|---|---|---|---|
| 1 | GOOGL | Alphabet Inc. (Class A) | **Added** | 54.2M → 78.8M (+45%) | ~$28.2B | 2026-08-14 |
| 2 | BAC | Bank of America | **Trimmed** | 513.6M → 483.4M (−6%) | ~$27.5B | 2026-08-14 |
| 3 | GOOG | Alphabet (Class C)* | **Added** | 3.6M → 27.2M (~7.6×) | ~$9.6B | 2026-08-14 |
| 4 | DVA | DaVita Inc. | **Trimmed** | 30.1M → 28.9M (−4%) | ~$6.4B | 2026-08-14 |
| 5 | DAL | Delta Air Lines | **Added** | 39.8M → 57.3M (+44%) | ~$5.4B | 2026-08-14 |

*DeepValues has no company name stored for the GOOG ticker. GOOG is Alphabet's Class C share.

- **No new or exited positions:** None of the 10 rows I pulled were new positions or full exits. The others were also adds or trims: added to Lennar (LEN) and the New York Times (NYT); trimmed Kroger (KR), Ally Financial (ALLY) and Capital One (COF). I only fetched 10 rows, so a smaller new position or exit could be further down the list.
- **Next filing:** The Q3 2026 13F is due around November 16, so a new set of moves should show up within days.

This is informational only, not investment advice.

### market-level

Yes. By both measures, the US stock market is very expensive compared with its history.

| Indicator | Reading | Zone | Historical percentile | As of |
|---|---|---|---|---|
| **Buffett Indicator** (US corporate equities ÷ GDP) | **255%** | Significantly overvalued (above 135%) | **99.7th** | 2026-04-01 |
| **Shiller PE (CAPE)** | **39.95** | Significantly overvalued (above 34) | **93.8th** | 2026-11-13 |

**Buffett Indicator**
- 255% is almost twice the 135% line where "significantly overvalued" starts. It's higher than 99.7% of past readings, which makes it about the highest on record.
- It rose about 43% over the year, from 213% in April 2025, and jumped from 219% to 255% in the latest quarter. The tool calls that 16% rise "month-over-month," but the data comes in quarterly.
- **This reading is about 7 months old.** It depends on quarterly GDP and Fed flow-of-funds data, which come out with a delay. The Shiller PE has stayed around 39–42 since then, so the picture probably hasn't changed much.

**Shiller PE**
- 39.95 is well above the 34 line for "significantly overvalued" and above about 94% of readings in its history.
- It has stayed between about 39 and 42 since mid-2026, with a high of about 42.7 in August. It's slightly lower than a year ago (down 2.3%), so it's high but no longer rising.

**Caveats**
- Both measures say a lot about likely long-term returns but very little about timing. The market can stay expensive for years.
- Some of the gap from history comes from changes in the market itself. US companies now earn more abroad (which raises market value relative to US GDP), they have higher profit margins, and interest rates have been lower over the long run. These push both ratios up over time.

Both the long-run, economy-wide measure and the earnings-based measure put the market in their most expensive zone, so expected 10-year returns from here are probably below average. This is for information only, not investment advice.

### grounded-nvda

**As of 2026-11-14 (14:16 UTC), DeepValues rates NVDA "WATCH":** a high-return platform business, but at about $211–$212 a share (about $3.99T market cap) the evidence doesn't show a dependable margin of safety.

1. The quality is not in question: CUDA and NVIDIA's full-stack integration create real switching costs, and the company reports a 71.1% gross margin, 76.3% ROE, 58.1% ROA and 107.2% ROIC.
2. The open question for a value investor is whether the $7.86 EPS is lasting owner earnings or a high point in the cycle; at roughly 27× earnings (my calculation from DeepValues' price and EPS), the stock leaves little room if it's the latter.
3. Large investors are split: Baillie Gifford added to its position through 2026-09-30, making NVDA 9.2% of its portfolio, and Altimeter added at 19.2%, while Millennium, Citadel and Tiger Global trimmed in the 2026-06-30 filings.
4. The disciplined approach is to hold if you already own it, keeping position size sensible, or start with a small, unleveraged position if you own none, and save most of your capital for stronger cash-flow evidence or a lower price.

*Source: DeepValues ai_context for NVDA, as of 2026-11-14T14:16:00Z. This is for information only and isn't investment advice.*

### filings-msft

According to DeepValues, Microsoft last filed a 10-K on **July 29, 2026**. It covers the fiscal year that ended June 30, 2026. The one before it was filed July 30, 2025, for FY ended June 30, 2025.

**Filings since the 10-K (newest first):**

| Filed | Form | Notes |
|---|---|---|
| 2026-11-05 | 8-K | Event date Nov 4, 2026 |
| 2026-11-04 | 8-K | Event date Oct 29, 2026 |
| 2026-10-28 | 10-Q | Quarter ended Sep 30, 2026 (Q1 FY27) |
| 2026-10-28 | 8-K (×2) | Two 8-Ks filed the same day as the 10-Q, probably the earnings release |
| 2026-10-21 | DEF 14A | Proxy statement; the listed date of Dec 8, 2026 looks like the annual meeting date |
| 2026-09-02 | 8-K | |
| 2026-07-29 | 8-K | Filed the same day as the 10-K, probably the FY26 Q4 earnings release |

**Shortly before the 10-K:**
- **PX14A6G** (Jul 22 and Jul 2, 2026): shareholder solicitation notices. Their filer ID shows they came from an outside party, not Microsoft.
- **Form 4** insider trading reports: Jul 15, Jul 1, Jun 16, Jun 15, and a group of eight on Jun 12, 2026.
- **11-K** (×2, Jun 25, 2026): annual reports for employee benefit plans.

DeepValues only gives form types and dates, so I haven't confirmed what each 8-K is about. The "probably earnings" notes are my guess from the timing. I can open any of these filings if you want the details.

### fundamentals-ko

DeepValues' latest annual record for Coca-Cola (KO) is **FY2025**, the fiscal year ended Dec 31, 2025:

| Metric | FY2025 |
|---|---|
| Revenue | $47,941M (~$47.9B) |
| Net income | $13,107M (~$13.1B) |
| Free cash flow | $5,296M (~$5.3B) |

The response doesn't state units. I've read the figures as millions of USD because that matches Coca-Cola's scale.

For comparison, FY2024 was revenue of $47,061M, net income of $10,631M and free cash flow of $4,741M. Free cash flow is well below net income in both years. Capital spending of about $2.1B a year accounts for only part of that gap.

### guru-lookup

I found Li Lu's slug, **`li-lu`**, in the DeepValues guru roster and pulled his profile.

## Who Li Lu is (according to DeepValues)

- **Firm:** Himalaya Capital, which he founded in 1997 and runs from Seattle. He is 58.
- **Style:** Value investing. His portfolio is very concentrated for a US fund, often fewer than 10 positions. He holds stocks for years and turns over only a few percent of the portfolio each year.
- **Best-known contribution:** In 2008 he introduced BYD to Charlie Munger. It became one of Berkshire Hathaway's most profitable non-US investments.
- **Background:** He was born in China and helped organise the Tiananmen-era student protests before moving to the US. He gives occasional lectures at Columbia Business School, and transcripts of them circulate informally as PDFs. The firm publishes no investor letters and he gives no media interviews.

## Top holdings (13F filing for the quarter ending 30 June 2026)

The filing lists 8 positions worth about **$3.70B** in total:

| # | Ticker | Company | Value | % of portfolio | Change vs. prior quarter |
|---|---|---|---|---|---|
| 1 | GOOGL | Alphabet Class A | $908.9M | 24.55% | Unchanged |
| 2 | GOOG | Alphabet Class C | $866.1M | 23.39% | Unchanged |
| 3 | PDD | PDD Holdings | $820.9M | 22.17% | **Added** |
| 4 | BRK.B | Berkshire Hathaway | $554.6M | 14.98% | **Added** |
| 5 | EWBC | East West Bancorp | $358.4M | 9.68% | Unchanged |
| 6 | CROX | Crocs | $107.0M | 2.89% | Unchanged |
| 7 | TME | Tencent Music | $55.0M | 1.49% | Unchanged |
| 8 | AAPL | Apple | $32.0M | 0.86% | Unchanged |

**Key points:**
- **Alphabet is about 48% of the portfolio** once you add the two share classes together, so it is by far his biggest bet.
- **His top four companies make up about 85%** of the portfolio: Alphabet, PDD, Berkshire and East West Bancorp.
- **He only bought more, he didn't sell:** he added to PDD and Berkshire, left every other position unchanged, and sold nothing.

This data is from the June 2026 quarter. The filing for the quarter ending 30 September 2026 is due about now, so his holdings may change soon.

### sentiment-tsla

DeepValues has no 7-day sentiment reading for TSLA, so there's no reading or source mix I can give you.

I checked the 7-day window three ways (combined, Reddit only and StockTwits only), and all three came back the same:

| Source | Posts | Bullish | Bearish | Neutral | Top source |
|---|---|---|---|---|---|
| Combined | 0 | — | — | — | — |
| Reddit | 0 | — | — | — | — |
| StockTwits | 0 | — | — | — | — |

There's also no as-of timestamp, so DeepValues hasn't computed a rollup for TSLA in this window at all. This means the data is missing. It does not mean sentiment is neutral, so don't read the empty result as a balanced reading. TSLA is one of the most-discussed tickers anywhere, so zero posts most likely means DeepValues isn't covering it right now.

I can try the 30-day window, or file a free `request_data` request asking DeepValues to add TSLA sentiment coverage.

### unknown-ticker

DeepValues has no intrinsic value for **ZZZQ**. The API returned a 404 error: "No intrinsic value data found for ticker ZZZQ." I won't guess a number.

Either ZZZQ isn't a real ticker or DeepValues doesn't cover it. If you meant a different symbol, I can search the company list to find the right one. If ZZZQ is real and you need it, I can also send DeepValues a free coverage request for it.
