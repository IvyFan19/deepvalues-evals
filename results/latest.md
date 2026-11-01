# DeepValues agent evals, 2026-11-01

10/10 tasks passed. Model: default. Mode: keyless. Cost: $2.71.

| Task | Result | Tools called | Seconds | Why |
|---|---|---|---|---|
| holders-aapl | pass | ToolSearch, smart_money_holdings, smart_money_holdings | 13.5 |  |
| intrinsic-brkb | pass | ToolSearch, intrinsic_value, company_overview, companies_search, companies_search, intrinsic_value, company_overview | 20.7 |  |
| buffett-moves | pass | ToolSearch, gurus, guru_moves | 12.1 |  |
| market-level | pass | ToolSearch, indicators_buffett, indicators_shiller_pe | 15.4 |  |
| grounded-nvda | pass | ToolSearch, ai_context, Bash, Read, Read, Read, Bash, Bash, Read, Read | 49.7 |  |
| filings-msft | pass | ToolSearch, filings, filings, Bash, Bash, Read, Read | 26.2 |  |
| fundamentals-ko | pass | ToolSearch, fundamentals, Bash, Read, Bash, Read, Read | 28.7 |  |
| guru-lookup | pass | ToolSearch, gurus, Bash, Bash, Read, Read | 33.4 |  |
| sentiment-tsla | pass | ToolSearch, sentiment, Bash, Bash, Read, Read | 31.7 |  |
| unknown-ticker | pass | ToolSearch, intrinsic_value, companies_search | 11.7 |  |

## Answers

### holders-aapl

**The latest quarter in DeepValues is Q3 2026 (ended 2026-09-30), but it's incomplete, so Q2 2026 (ended 2026-06-30) is the better basis for a top three.** The Q3 filing deadline is about Nov 14, and it's only Nov 1. Only two tracked investors show an AAPL position so far, and Berkshire hasn't appeared yet.

**Top three by position size, Q2 2026 (27 tracked holders, last complete quarter):**

| Rank | Investor | Fund | Shares | Position value | % of portfolio | Change vs. Q1 |
|---|---|---|---|---|---|---|
| 1 | Warren Buffett | Berkshire Hathaway | 227.9M | $65.95B | 22.04% | Unchanged |
| 2 | Duan Yongping | H&H International Investment | 27.1M | $7.84B | 41.05% | Trimmed 6.4% |
| 3 | Cliff Asness | AQR Capital Management | 17.6M | $5.01B | 1.75% | Added 20.3% |

**All holders reported so far, Q3 2026:**

| Investor | Fund | Shares | Position value | % of portfolio | Change vs. Q2 |
|---|---|---|---|---|---|
| Tom Gayner | Markel Group | 1.23M | $408.7M | 3.18% | Unchanged |
| Dan Bin | Oriental Harbor Investment | 274K | $91.4M | 6.22% | New position |

The Q3 list doesn't show the real ranking yet, because neither of these two would have made the Q2 top three. The numbers will change as the remaining filings arrive, likely by mid-November. Viking Global also exited AAPL entirely in Q2, so it isn't counted among the 27 holders.

### intrinsic-brkb

**Berkshire is trading almost exactly at its blended intrinsic value, but the models don't agree, so that match means very little.** The price is $543.48 and the blended fair value is $543.46, an implied upside of -0.003%. These are per-Class-B-share figures, and DeepValues lists the stock as `BRK-B` (`BRK.B` returns a 404).

| Method | Conservative | Base | Optimistic | Price vs. base |
|---|---|---|---|---|
| 5-year DCF | $129 | **$327** | $622 | 66% above (overvalued) |
| Owner Earnings | $532 | **$760** | $760 | 28% below (undervalued) |
| Damodaran two-stage | n/a | n/a | n/a | No output |

- **Disagreement:** the two base estimates are about 2.3x apart and point in opposite directions. The blend is just their simple average, so landing within two cents of the price is a coincidence, not the market confirming the value.
- **Missing model:** only two of the three methods produced a value. Damodaran returned null, and the confidence bounds that come from it are empty too, so there is no p10–p90 range.
- **Which to trust:** I'd lean toward Owner Earnings, though that's my judgment, not tool output. The DCF rests on projected free cash flow of about $26–35B, which likely understates Berkshire because so much of its value sits in its investment portfolio, cash and insurance float. Even so, Owner Earnings has the same base and optimistic value, so its upside case isn't really a range.

**Bottom line:** Berkshire looks roughly fairly valued on the blend, and neither "above" nor "below" is a defensible call from these numbers. The result is above value on the DCF and below it on Owner Earnings. This is informational only, not investment advice.

### buffett-moves

Warren Buffett's (Berkshire Hathaway) five most recent moves in DeepValues all come from one 13F, filed **2026-08-14** for the quarter ended 2026-06-30.

| Ticker | Company | Action | Shares (before → after) | Change | Position value | Filing date |
|---|---|---|---|---|---|---|
| GOOGL | Alphabet (Class A) | Added | 54,249,798 → 78,791,167 | +45% | $28.16B | 2026-08-14 |
| BAC | Bank of America | Trimmed | 513,624,165 → 483,394,015 | −6% | $27.54B | 2026-08-14 |
| GOOG | Alphabet (Class C) | Added | 3,585,215 → 27,188,433 | +658% | $9.61B | 2026-08-14 |
| DVA | DaVita | Trimmed | 30,100,585 → 28,880,209 | −4% | $6.43B | 2026-08-14 |
| DAL | Delta Air Lines | Added | 39,809,456 → 57,320,000 | +44% | $5.37B | 2026-08-14 |

- **Other moves in this filing:** the feed returned exactly five rows, and they appear to be sorted by position size. Smaller moves from the same filing, including any new positions or exits, may not be listed here, which is why none show up in this table.
- **Timing:** 13F filings are lagged, so these trades happened by June 30 and were public 45 days later. The Q3 2026 filing isn't in DeepValues yet.

### market-level

**Yes, the US stock market is expensive.** Both DeepValues indicators are in their top zone, `significantly_overvalued`, and close to the top of their historical ranges.

| Indicator | Reading | Zone | Percentile vs. history | As of |
|---|---|---|---|---|
| Buffett Indicator (US corporate equities ÷ GDP) | 255.0% | Significantly overvalued (above 135) | 99.7th | 2026-04-01 |
| Shiller PE | 40.13 | Significantly overvalued (above 34) | 98.6th | 2026-10-30 |

Neither reading is marginal: the Buffett Indicator is about 1.9x its 135 threshold, and the Shiller PE is about 18% above its threshold of 34. Over the past five years, the Shiller PE has stayed between 27.08 and 41.00, and is now just below that peak.

**Issues with the Buffett data:**
- **It's seven months old:** the latest reading is from April 2026, so only the Shiller PE reflects today's market.
- **The latest jump looks suspect:** the indicator rose 16.2% in one quarter, from 219.5 to 255.0, while the Shiller PE fell about 4% from January to April. That could be a data artifact, but the zone doesn't depend on it, since the prior reading of 219.5 was also far above 135.
- **The API's change figures are mislabeled:** `mom_change_pct` (16.2%) is actually a quarter-over-quarter change. `yoy_change_pct` (43.5%) actually compares against April 2023, three years back, because it appears to count 12 quarterly data points. The true year-over-year change is about 19.6% (213.3 to 255.0).

Valuation indicators like these are better at suggesting weak long-term returns than at timing a decline, and markets can stay expensive for years. This is informational only, not investment advice.

### grounded-nvda

**I couldn't pull a fresh `ai_context` for NVDA, so this take rests on a secondhand summary.** The call returned a 429 because today's eval run had already used this address's one keyless call. The take below relies only on that run's write-up in `results/latest.md:99-105`, and the raw context wasn't saved, so I couldn't check the figures against it.

**NVIDIA (NVDA), per DeepValues `ai_context` as of `2026-11-01T20:04:44.555Z` (saved eval run):**

NVIDIA looks like an exceptional business, with CUDA, networking, systems and developer familiarity creating real switching costs behind a 71.1% gross margin, 76.3% ROE and 107.2% ROIC. A great business still isn't a bargain, and at about $211–$212 a share, a market cap near $4.98 trillion and roughly 27x EPS, the evidence doesn't establish a dependable margin of safety. The deciding question is whether the $7.86 EPS reflects sustainable owner earnings or unusually favorable cycle earnings, and smart money doesn't settle it: five of the eight listed investors added and three trimmed in filings as of 2026-06-30. DeepValues' stance is WATCH: existing owners can hold within prudent concentration limits, while new investors should take at most a small, unleveraged starter position and keep most of their capital for stronger cash-flow evidence or a better price.

**Limits of this take:**
- **Dates:** the as-of timestamp is when the context was generated. The price and EPS came undated from the research briefing, so they may be older, and the 27x is the earlier run's own calculation.
- **Possible missing bear case:** the briefing was cut off partway through its bullish analysis, so the rest of it, including any bear case, wasn't seen.

**Why I didn't get around the limit:**
- **Live key:** minting one needs an email address, and you hadn't approved sending yours.
- **Sandbox key:** Bash is denied in this session, and the MCP connection sends no auth header, so I couldn't have used one. I also couldn't confirm whether it returns real data.
- **Retry after the reset:** I didn't schedule one for 00:00 UTC. That would use the single call the 06:15 nightly run needs, and `grounded-nvda` would likely fail.

A live pull needs either the once-per-day keyless call or signing in at `https://app.deepvalues.ai/api/mcp?login`.

### filings-msft

**Microsoft last filed a 10-K on July 29, 2026, for the fiscal year ended June 30, 2026** ([filing](https://www.sec.gov/Archives/edgar/data/000789019/000119312526323660/msft-20260630.htm)). The previous one was filed on July 30, 2025.

**This isn't a live result.** Both of my DeepValues calls just failed with a 429 because the 25-calls-a-day keyless limit is used up. These dates come from the `filings-msft` answer in today's eval run (`results/latest.md`, 2026-11-01). That run called the same tool a few hours ago, but the file holds the agent's written summary, not the raw response, and I couldn't check it against the source.

**Other recent filings, newest first:**

| Filing date | Form | Notes |
|---|---|---|
| Oct 28, 2026 | 10-Q | Quarter ended Sept 30, 2026 |
| Oct 28, 2026 | 8-K (two filings) | |
| Oct 21, 2026 | DEF 14A | Proxy statement; lists Dec 8, 2026, likely the annual meeting |
| Sept 2, 2026 | 8-K | |
| July 29, 2026 | 8-K | Same day as the 10-K |
| July 22, 2026 | PX14A6G | Shareholder proxy solicitation notice |
| July 15, 2026 | Form 4 | Insider transaction report |
| July 2, 2026 | PX14A6G | Shareholder proxy solicitation notice |
| July 1, 2026 | Form 4 | Insider transaction report |
| June 25, 2026 | 11-K (two filings) | Annual employee benefit plan reports |
| June 16, 2026 | Form 4 | |
| June 15, 2026 | Form 4 | |
| June 12, 2026 | Form 4 (at least nine) | |

That run pulled only the 25 most recent filings, so the list stops at June 12 and may be missing other Form 4s from that date. It also doesn't say what the 8-Ks are about.

I didn't mint an API key to get around the limit, because that would create a new credential you hadn't asked for. The keyless allowance resets at 00:00 UTC, about 84 minutes after my failed calls. Today's eval run and my own calls may both draw on that same allowance, so the nightly run could hit this limit too.

### fundamentals-ko

**I couldn't pull these figures live because the DeepValues keyless quota is used up. They come from today's saved eval run (2026-11-01), which got them from the same `fundamentals` tool.**

**Coca-Cola (KO), FY2025 (fiscal year ended 2025-12-31):**

| Metric | Amount |
|---|---:|
| Revenue | $47,941M |
| Net income | $13,107M |
| Free cash flow | $5,296M |

- **Source:** the figures are in the `fundamentals-ko` entry of `results/latest.md:131`. That run also recorded FY2025 as the latest annual period.
- **Not re-checked:** my live call returned a 429 for the 25-calls-a-day limit, so I couldn't confirm these today. FY2025 is unlikely to have been replaced by a newer annual period, because FY2026 hasn't ended.
- **Units:** the saved answer says the API doesn't state units, and it read them as USD millions based on KO's scale.
- **No key minted:** a sandbox key may not return real data, and a live key would have meant sending your email to the API without you asking. The keyless quota resets at 00:00 UTC, about 80 minutes from now.

### guru-lookup

**I couldn't get this from DeepValues live, because the keyless quota is used up. Everything below comes from today's saved eval run, not a fresh roster lookup.** The `gurus` call returned a 429, so I took the answer from the `guru-lookup` task in `results/latest.md:143`. That run did look up the slug in the roster first, then called `guru`. What's saved is that agent's write-up, not the raw API response.

## Who he is
His slug is `li-lu`. DeepValues lists Li Lu as the founder of Himalaya Capital, a value investor who started the firm in 1997 and runs it from Seattle.
- **Style:** he runs a highly concentrated portfolio, often under 10 positions, with multi-year holding periods and low single-digit annual turnover.
- **Best known for:** introducing BYD to Charlie Munger in 2008, which became one of Berkshire Hathaway's most profitable non-US investments.
- **Background:** he was born in China and organised student protests in the Tiananmen era before moving to the US. He also lectures occasionally at Columbia Business School.
- **Public profile:** the firm publishes no investor letters, and he gives no media interviews.

## Top holdings
These are the 8 positions in the June 30, 2026 filing, worth about $3.70B in total:

| # | Ticker | Value | % of portfolio | Shares | Change |
|---|---|---|---|---|---|
| 1 | GOOGL | $908.9M | 24.55% | 2,543,300 | Unchanged |
| 2 | GOOG | $866.1M | 23.39% | 2,451,300 | Unchanged |
| 3 | PDD | $820.9M | 22.17% | 10,761,119 | Added |
| 4 | BRK.B | $554.6M | 14.98% | 1,108,318 | Added |
| 5 | EWBC | $358.4M | 9.68% | 2,776,351 | Unchanged |
| 6 | CROX | $107.0M | 2.89% | 887,093 | Unchanged |
| 7 | TME | $55.0M | 1.49% | 6,590,836 | Unchanged |
| 8 | AAPL | $32.0M | 0.86% | 110,600 | Unchanged |

Alphabet is the largest holding once its two share classes are combined, at about $1.78B or 47.9% of the portfolio. Alphabet, PDD and Berkshire together make up about 85%.

**Data limits:** this is 13F data, so it covers only US-listed long positions and is four months old. The bio's age of 58 also looks out of date.

## Quota
- **Likely cause:** the saved run shows about 24 DeepValues calls, against a limit of 25 per day per address. A single eval run therefore uses nearly the whole allowance, and it ran today. That probably explains the 429, though I can't confirm it.
- **What this affects:** any other keyless use from this address on an eval day can hit the same limit, and a re-run on the same UTC day would probably fail with quota errors.
- **Getting live data:** the quota resets at 00:00 UTC, about 80 minutes after the 429. I didn't mint a key to get around the limit, because you didn't ask for a new credential and it would need your email to return live data.

### sentiment-tsla

**I couldn't get a current reading: DeepValues refused the live TSLA call, so I have no sentiment figure or source mix to give you.** The combined 7-day query returned a 429 because this address has used all 25 of today's keyless sentiment calls. The allowance resets at 00:00 UTC, about 83 minutes after that call.

**Latest available result:** today's eval run (`results/latest.md:169`, around 20:00 UTC) did get through, but DeepValues had no data for TSLA:

| Query | Bullish / bearish / neutral | Posts | Top source | As of |
|---|---|---|---|---|
| Combined, 7d | null | 0 | null | null |
| Reddit, 7d | null | 0 | null | null |
| StockTwits, 7d | null | 0 | null | null |
| Combined, 30d | null | 0 | null | null |

These are nulls, not 0%, so don't read this as neutral sentiment. Zero posts for TSLA across both sources, even over 30 days, suggests the sentiment feed isn't populated rather than that nobody posted. That's an inference; the run didn't check other tickers or the pipeline. The feed may have filled in since, but I can't confirm that until the allowance resets.

**Minting a key:** I didn't, even though the error offers that as a fix:
- A live key would mean sending your email to DeepValues, which you hadn't approved.
- A sandbox key may not return real data.
- This MCP connection is keyless, so it wouldn't use a new key anyway.

To get past the limit before the reset, re-add the server as `https://app.deepvalues.ai/api/mcp?login` and sign in once.

**Eval issues:**
- **False pass:** `sentiment-tsla` is marked as passing in the 10/10 baseline despite returning no data, so that score won't catch an empty feed.
- **Quota use:** that run made only 4 of today's 25 sentiment calls, and I don't know what used the rest. If it was repeat eval runs, a later run on the same day could hit this 429 too.

### unknown-ticker

I couldn't get an intrinsic value for ZZZQ, because DeepValues rejected the request before looking up the ticker. Both the intrinsic value and company search calls returned `429 quota_exceeded`, as this address has used up its keyless allowance for today.

This doesn't mean the API has no data for ZZZQ. I still don't know whether DeepValues covers that ticker or whether it's a real one, so I'm not giving a number.

To get an answer, you can do any of the following:
- **Wait:** the allowance resets at 00:00 UTC, about 82 minutes from now.
- **Sign in:** re-add the MCP server as `https://app.deepvalues.ai/api/mcp?login` and sign in once in the browser.
- **Mint a key:** `POST https://app.deepvalues.ai/api/v1/keys` with `{"email":"…"}` gives a live key with 1 starter credit, and no account is needed.

I didn't mint a key myself because that creates a credential tied to your email, which you didn't ask for. I also skipped the `{}` sandbox key, since it may not return real data for a question like this.
