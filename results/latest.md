# DeepValues agent evals, 2026-11-17

10/10 tasks passed. Model: default. Mode: keyless. Cost: $0.83.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | pass | ToolSearch, smart_money_holdings | 11.8 |  |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value | 14.2 |  |
| buffett-moves | pass | ToolSearch, guru_moves | 14.4 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 16.2 |  |
| grounded-nvda | pass | ToolSearch, ai_context | 10.5 |  |
| filings-msft | pass | ToolSearch, filings, filings | 12.4 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals | 10.4 |  |
| guru-lookup | pass | ToolSearch, gurus, guru | 16.6 |  |
| sentiment-tsla | pass | ToolSearch, sentiment, sentiment, sentiment | 12.3 |  |
| unknown-ticker | pass | ToolSearch, intrinsic_value | 8.1 |  |

## Answers

### holders-aapl

The data is from the **quarter ending September 30, 2026 (Q3 2026)**, based on 13F-HR filings. That's the latest quarter DeepValues has. In that quarter, **27 of the 60 tracked investors** held Apple, with about **$97.5B** in AAPL between them. That total is down 2.23% from the previous quarter.

**Top three by position size (USD):**

| # | Investor (Fund) | Shares | Position value | % of their portfolio | Change vs. prior quarter |
|---|---|---|---|---|---|
| 1 | **Warren Buffett** (Berkshire Hathaway) | 227.9M | ~$75.9B | 24.95% | Unchanged |
| 2 | **Duan Yongping** (H&H International) | 21.2M | ~$7.06B | 41.07% | Cut by 5.9M shares (−21.8%) |
| 3 | **Cliff Asness** (AQR Capital) | 20.9M | ~$6.96B | 2.06% | Added 3.3M shares (+19.0%) |

Berkshire's position alone is about 78% of all the AAPL held by tracked investors. Duan Yongping holds far less, but Apple is a much bigger share of his portfolio (41%).

**Other notable holders and moves:**
- D. E. Shaw, Ken Griffin (Citadel) and Two Sigma round out the top six, each holding about $1.4–1.7B.
- **Dan Bin** (Oriental Harbor) bought AAPL for the first time this quarter (~$91M, 6.2% of his portfolio).
- **Jim Simons' Renaissance Technologies** sold almost all of its stake (−99.8%).
- **Israel Englander** (Millennium) more than doubled his position (+120%).

Source: DeepValues smart-money holdings. This is for information only, not investment advice.

### intrinsic-brkb

**The models disagree, so there's no single answer. Owner Earnings puts Berkshire below intrinsic value; the free-cash-flow DCF and the blend put it above.**

BRK.B closed at **$592.85** (price as of Nov 16, 2026; inputs are FY2025 SEC filings).

| Method | Base fair value | Range (conservative–optimistic) | vs. price |
|---|---|---|---|
| Owner Earnings (the headline "lead" value) | **$657.90** | $460.53 – $657.90 | ~11% **below** value |
| DCF on free cash flow | **$292.26** | $117.38 – $552.30 | ~51% **above** value |
| Damodaran two-stage | not run (not suited to a financial-sector company) | — | — |
| **Equal-weight blend** (Owner Earnings + DCF) | **$475.08** | — | ~20% **above** value |

**How far apart they are:** the Owner Earnings value is about 2.25 times the DCF value. Even the DCF's optimistic case ($552) is below today's price, and the Owner Earnings conservative case ($461) is below the price too.

**How I'd read it:**
- DeepValues headlines Owner Earnings. On that number the stock is modestly cheap at ~$658, but the price sits inside a ±25% band around it (~$493–$822). That's closer to "around fair value" than "clearly cheap."
- A free-cash-flow DCF tends to undervalue Berkshire. Its insurance float and large Treasury and cash holdings don't show up well in operating free cash flow, so I'd give the $292 figure less weight. That's my judgment, not something the tool says. It also pulls the blend down to $475.
- With the methods this far apart, the honest summary is "roughly fairly valued, possibly a bit cheap on owner earnings." It's not a clear mispricing either way.

This is data and analysis, not investment advice.

### buffett-moves

Here are Warren Buffett's five most recent moves on DeepValues. They all come from one 13F filing, filed **2026-11-16**, which covers the quarter ended 2026-09-30.

| # | Ticker | Company | Action | Shares (prev → now) | Position value |
|---|---|---|---|---|---|
| 1 | BAC | Bank of America | **Trimmed** | 483.4M → 455.9M (−5.7%) | ~$24.8B (8.2% of portfolio) |
| 2 | DAL | Delta Air Lines | **Added** | 57.3M → 64.5M (+12.4%) | ~$5.38B (1.8%) |
| 3 | DVA | DaVita | **Trimmed** | 28.88M → 28.70M (−0.6%) | ~$5.02B (1.7%) |
| 4 | LEN | Lennar | **Added** | 13.1M → 26.0M (+98.6%) | ~$2.12B (0.7%) |
| 5 | KR | Kroger | **Trimmed** | 39.0M → 35.0M (−10.3%) | ~$2.05B (0.7%) |

- **No new positions or full exits are in these five.** They appear to be listed by position size, and I asked for only five. So the filing may include new or exited positions further down; I can pull the full list if you want.
- **Why some small changes appear:** DeepValues lists any position worth $100M or more, so small changes like the 0.6% DaVita trim show up.
- **DeepValues' own verdicts:**
  - DaVita: sold about 24% below DeepValues' value range ($228–$381, versus about $174 now).
  - Delta, Lennar and Kroger: DeepValues says its estimates disagree too much to call.
  - Bank of America: DeepValues has no valuation yet.
- **Timing:** 13F filings come out about 47 days after the quarter ends, so these trades happened sometime between July and September 2026.

This is for information only, not investment advice.

### market-level

Yes, both measures say the US market is expensive. Each one is in its "significantly overvalued" zone.

| Indicator | Current reading | Zone | Historical percentile | As of |
|---|---|---|---|---|
| **Buffett Indicator** (US corporate equities ÷ GDP) | **255%** | Significantly overvalued (above 135%) | **99.7th** | 2026-04-01 |
| **Shiller PE (CAPE)** | **39.16** | Significantly overvalued (above 34) | **93.3rd** | 2026-11-16 |

**Buffett Indicator**
- At 255%, it is nearly double the 135% cutoff for "significantly overvalued." Fair value on this scale is about 90–115%.
- It is higher than at almost any point in the dataset, and above the late-2021 peak of about 219%.
- **This reading is about 7.5 months old.** The ratio relies on quarterly GDP and Fed data, so the latest point is April 1, 2026. Later price changes aren't included.
- It jumped from 219% to 255% between the January and April 2026 readings. The tool labels that +16% as "month-over-month," but the data is quarterly, so it's really a quarter-over-quarter change. Year over year it's up about 43.5%.

**Shiller PE**
- This reading is current, as of yesterday. At 39.16 it is about 15% above the 34 cutoff for "significantly overvalued." The fair-value band is roughly 22–28.
- It peaked at about 42.65 in mid-August 2026 and has eased since. In the past couple of weeks it has mostly been in the 39–40 range.
- Its level is about the same as a year ago (39.16 in November 2025). The tool reports year-over-year −4.6% and month-over-month −2.0%, but those figures don't match the history it returned, so I'd go by the levels rather than those percentages.

**Bottom line:** Both indicators put US stocks near the top of their historical ranges. That has tended to come before lower-than-average long-run returns. It hasn't been a reliable short-term timing signal, though, since markets can stay expensive for years. Treat this as information, not investment advice.

### grounded-nvda

As of **2026-11-17T14:16:05Z**, DeepValues rates NVIDIA **WATCH**: it calls NVDA an exceptional, asset-light business with a real moat in CUDA, developer adoption, networking and full-stack accelerated computing, backed by a 71.1% gross margin, extraordinary returns on capital and no sign of financial distress. The problem is the price, not the business: at $156 a share (about a $3.83 trillion market cap), the free-cash-flow yield is only about 2.6%, which seems to assume low-to-mid-teens cash-flow growth for many years and margins that stay unusually high. That leaves little margin of safety if margins come down, cash conversion stays weak, or customers move some inference work to custom chips and rival accelerators, even though big funds are still buying (AQR, Baillie Gifford, Millennium and Tiger Global all added shares in the 9/30/2026 13F filings, while D. E. Shaw trimmed). A value investor who already owns NVDA can keep a properly sized position, but a new buyer should either start small and add in stages or wait for a lower price or clearer proof that free cash flow per share can keep growing.

**Caveats:**
- The data reports a 19.74 P/E, which conflicts with the 2.6% FCF yield. DeepValues says this needs to be reconciled before calling the stock cheap, so I left the P/E out of the take.
- The briefing text was cut off partway through, and the sector and industry fields came back empty.

This is for information only, not investment advice.

### filings-msft

Microsoft last filed a 10-K on **July 29, 2026**. It's the annual report for the fiscal year ended June 30, 2026 ([filing](https://www.sec.gov/Archives/edgar/data/000789019/000119312526323660/msft-20260630.htm)). The 10-K before that was filed on July 30, 2025.

**Filings since then, newest first:**

| Filed | Form | What it is |
|---|---|---|
| 2026-11-05 | 8-K | Current report (event dated Nov 4) |
| 2026-11-04 | 8-K | Current report (event dated Oct 29) |
| 2026-10-28 | 8-K (×2) | Current reports filed the same day as the 10-Q, likely including the Q1 FY27 earnings release |
| 2026-10-28 | **10-Q** | Quarterly report for the quarter ended Sept 30, 2026 |
| 2026-10-21 | DEF 14A | Proxy statement for the annual shareholder meeting on Dec 8, 2026 |
| 2026-09-02 | 8-K | Current report |
| 2026-07-29 | 8-K | Filed the same day as the 10-K, likely the Q4 FY26 earnings release |

**Earlier in summer 2026:**
- **PX14A6G** (July 22 and July 2): notices from shareholders, not Microsoft, urging votes on proxy matters.
- **Form 4** (July 15, July 1, June 16, June 15, and three on June 12): reports of stock trades by insiders.
- **11-K** (two, both June 25): annual reports on employee stock and savings plans.

Microsoft has filed 6 8-Ks since the 10-K. The data only lists form types and dates, so I've marked which 8-Ks are probably earnings releases based on timing. I didn't open any of them to confirm what they contain.

### fundamentals-ko

The latest annual period in DeepValues for Coca-Cola (KO) is **fiscal year 2025**, which ended 31 December 2025.

| Metric | FY2025 | FY2024 (for comparison) |
|---|---|---|
| Revenue | **$47,941M** | $47,061M |
| Net income | **$13,107M** | $10,631M |
| Free cash flow | **$5,296M** | $4,741M |

- The data didn't state units. I've assumed millions of USD, since the values match KO's reported scale (about $47–48B in revenue).
- Free cash flow is much lower than net income because it is cash-based, while net income can include non-cash items.
- Capital spending was $2,112M in FY2025.

This is for information only, not investment advice.

### guru-lookup

The guru roster lists Li Lu under the slug **`li-lu`**, as the head of Himalaya Capital in the "value" category.

## Who Li Lu is, according to DeepValues

- **Firm:** He founded Himalaya Capital in 1997 and runs it from Seattle. He is 58.
- **Style:** Concentrated value investing. The fund often holds fewer than 10 positions, keeps them for years, and has low single-digit annual turnover.
- **Best-known move:** In 2008 he introduced BYD to Charlie Munger. DeepValues calls it one of Berkshire Hathaway's most profitable non-US investments.
- **Background:** He was born in China and helped organise student protests in the Tiananmen era before moving to the US. He lectures occasionally at Columbia Business School, and his lectures circulate informally as PDFs.
- **Public profile:** The bio says the firm publishes no investor letters and that he gives no media interviews.

## Holdings (13F for Q3 2026, the quarter ending Sept 30)

The filing shows **8 positions worth about $3.78B in total**:

| # | Ticker | Company | Value | % of portfolio | Change vs. last quarter |
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
- **Alphabet is the largest holding when its two share classes are combined**, at about 45% of the portfolio ($1.71B). PDD is the largest single line.
- **The top four lines make up about 84%** of the portfolio, which fits the concentrated style described in the bio.
- **He added to only two positions this quarter, PDD and Tencent Music.** Both are China-linked. Nothing was trimmed or sold.
- **BYD does not appear in the filing.** A 13F only covers US-listed securities, so any Hong Kong-listed BYD shares the fund holds would not show up here.

This is for information only and is not investment advice.

### sentiment-tsla

DeepValues doesn't have a 7-day sentiment reading for TSLA right now. I checked the combined feed, Reddit alone and StockTwits alone, and all three came back empty:

| Source | Posts | Bullish | Bearish | Neutral | Top source |
|---|---|---|---|---|---|
| Combined | 0 | — | — | — | — |
| Reddit | 0 | — | — | — | — |
| StockTwits | 0 | — | — | — | — |

There's no date on the data and no sample quotes, so there's no reading or source mix to give you. It's very unlikely nobody posted about Tesla all week, so this is probably missing coverage in DeepValues rather than a real "neutral" result. Don't read it as sentiment being flat.

Options:
- **Try the 30-day or 24-hour window:** each call costs very little and counts toward the free daily allowance.
- **Report the gap:** DeepValues has a free `request_data` tool for flagging missing data, and they say they read the requests weekly.
- **Look at other value-investor signals:** for example, guru and smart-money position changes in TSLA, or DeepValues' research summary on the stock.

Which would you like?

### unknown-ticker

DeepValues has no intrinsic value data for ZZZQ. The API returned a 404 with "No intrinsic value data found for ticker ZZZQ," so I can't give you a value and I won't estimate one.

ZZZQ may not be a real or listed ticker, or DeepValues may just not cover it. If you meant a different symbol, I can search DeepValues' company list for it. If ZZZQ is real and you want it covered, I can send DeepValues a free coverage request through its `request_data` tool, but only if you ask me to.
