# Meliona

Meliona is a free website that shows how much a group of stocks could lose in a bad year, using real market data.

**Try it live:** https://summer-2026-quant-project-risk-engine-blueprint-production.up.railway.app

Built by John Nguyen, a Computer Information Systems student at Georgia State University who studies AI and analytics.

---

## What it does, in plain words

Imagine you own a few stocks. A good question to ask is: "If the market has a really bad year, how much could I lose?"

Meliona answers that with one number. It looks at how your stocks really moved in the past, plays out thousands of possible years, and tells you the average loss in the worst ones.

Then it helps you understand that number:

- It replays real market crashes, like 2008, COVID in 2020 and 2022, to show what they would have done to your stocks.
- It shows which of your stocks bounce back fast after a fall and which do not. This is the **Grit Zone**.
- It pairs your fast-moving stocks with steadier ones that can soften a fall. This is **The Book**.
- It draws a map of where your group of stocks could drift over the next month. This is the **Risk Topology** map.

You can start from a ready-made group (big tech, sector funds, currencies and more) or type in any stock symbol you like.

---

## How it works, step by step

1. **Get the prices.** Meliona downloads real daily prices from Yahoo Finance at the end of each trading day.
2. **Check the prices.** It looks for missing days, old data and strange jumps, and tells you if it finds any.
3. **Pick the mix.** It splits your money across the stocks, either evenly or so each stock adds the same amount of risk.
4. **Play out the future.** It runs thousands of possible years built from real past days, plus a second model that allows for sudden big drops.
5. **Show one number.** It shows the average loss in the worst 5% of those years, with everything else one click away.

---

## Rules it follows

- **No made-up numbers.** Every number comes from real market data and Meliona's own math. A panel on the page shows where each one came from.
- **No overselling.** It says "end-of-day data", not "real-time". Crash replays use what really happened. If a stock has to be left out, the page says so.
- **One number first.** The main answer sits at the top. The details are folded away below it.
- **Easy to explain.** Every feature comes with a short note on the math behind it.

---

## The tools inside

| Job | Tools |
|---|---|
| Getting prices | Yahoo Finance (`yfinance`), `pandas`, a small saved copy on disk |
| The math | `numpy`, `scipy` |
| The website | `streamlit`, `plotly` |
| Hosting | Railway |

---

## Run it on your own computer

```powershell
python -m pip install -r requirements.txt
python -m streamlit run main.py
```

Then open http://localhost:8501 in your browser.

### Or run it with Docker

[Docker](https://docs.docker.com/get-docker/) runs the app in a ready-made box, so you do not need to install Python:

```bash
docker run -p 8501:8501 ghcr.io/ricepillow3000/meliona:latest
```

Then open http://localhost:8501. The box runs exactly what the live site runs. To build it yourself:

```bash
docker build -f docker/Dockerfile -t meliona .
docker run -p 8501:8501 meliona
```

### Run the tests

```powershell
python -m tests.test_engine
```

The tests check that the math holds up on made-up data where the right answer is known. One more test starts the whole app, and it skips itself when there is no internet.

Before every change, `python -m tools.check` runs all of the checks at once.

---

## Where things live

```
├── main.py                  # the website
├── static/app.css           # how the website looks
├── src/
│   ├── ingestion.py         # gets and saves the prices
│   ├── analytics.py         # how stocks move together
│   ├── risk.py              # the loss numbers and the thousands of possible years
│   ├── strategies.py        # how the money is split
│   ├── scenarios.py         # replays of real crashes
│   ├── liquidity.py         # how many days it takes to sell everything
│   └── grit.py              # the Grit Zone scores
├── tests/test_engine.py     # the tests
└── requirements.txt         # the packages it needs
```

---

## Keeping it safe

The site has no accounts, no passwords and no database, so there is nothing private to steal. The main risks are someone trying to slow it down or sneak bad text into it. So Meliona:

- only accepts stock symbols that look like real stock symbols,
- only talks to Yahoo Finance and nowhere else,
- limits how much work one visitor can ask for,
- hides the admin buttons and error details from visitors.

Each of these has its own test. More detail is in `docs/security/SECURITY-LESSONS.md`.

---

## Help and policies

- **Need help?** Email meleona.support@gmail.com and include the session code shown at the bottom of the page.
- **Privacy:** `PRIVACY.md`. No accounts, no tracking, nothing sold.
- **Terms:** `TERMS.md`. Meliona is for learning, not investment advice.
- **Accessibility:** `ACCESSIBILITY.md`.
- **Running the site:** `RUNBOOK.md` and `LAUNCH_CHECKLIST.md`.

---

## Credits

The only photos on the site are John Nguyen's own, and they are not for reuse. The crest (`assets/logo.svg`) was drawn for this project. The GitHub and Handshake icons come from Simple Icons (CC0). The LinkedIn icon is drawn here.
