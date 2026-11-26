# Meliona

Hi there! Meliona is a free website that helps you see how much your stocks could lose in a bad year.

You pick some stocks. Meliona looks at how they really moved in the past, then gives you one clear answer.

**Try it here:** https://summer-2026-quant-project-risk-engine-blueprint-production.up.railway.app

---

### Why it exists

Most people who own stocks only ask, "How much could I make?"

The better question is, "How much could I lose if things go wrong?"

Meliona answers that question in plain words, with real numbers.

---

### What you can do with it

- **See your bad-year number.** One number at the top tells you how much you could lose in a really rough year.
- **Replay real crashes.** See what 2008, COVID in 2020 and 2022 would have done to your stocks.
- **Find the tough ones.** The Grit Zone shows which of your stocks bounce back fast after a fall, and which ones struggle.
- **Balance things out.** The Book pairs your wild, fast-moving stocks with calmer ones that help steady things.
- **See where things could go.** The Risk Topology map shows where your group of stocks could drift over the next month.

Not sure what to pick? Start with a ready-made group, like big tech, or type in any stock you like.

---

### How it works

1. It grabs real prices from Yahoo Finance after each trading day ends.
2. It checks the prices for missing days or weird jumps, and tells you if it finds any.
3. It splits your money across your stocks.
4. It plays out thousands of possible years, built from real days in the past.
5. It shows you the average loss in the worst 5% of those years.

That's the one number at the top. Everything else is there if you want to dig deeper.

---

### What it promises

- **Every number is real.** Nothing is made up or guessed. You can see where each number came from.
- **No hype.** It says "end-of-day prices", not "real-time", because that's the truth.
- **Nothing is hidden.** If a stock has to be left out, Meliona tells you why.
- **It's for learning.** It's not investment advice.

---

### What it's built with

- **Python** for the math
- **Streamlit** for the website
- **Yahoo Finance** for the prices
- **Railway** to keep it online

---

### Want to run it yourself?

On your own computer:

```powershell
python -m pip install -r requirements.txt
python -m streamlit run main.py
```

Then open http://localhost:8501.

Or, if you have [Docker](https://docs.docker.com/get-docker/), one line does it:

```bash
docker run -p 8501:8501 ghcr.io/ricepillow3000/meliona:latest
```

To run the tests:

```powershell
python -m tools.check
```

---

### Is it safe to use?

Yes. There's nothing to sign up for. No accounts, no passwords and no tracking.

Behind the scenes, Meliona only talks to Yahoo Finance, only accepts real stock symbols, and makes sure no one visitor can slow it down for everyone else.

---

### Need help?

Send an email to meleona.support@gmail.com. Add the short code at the bottom of the page so we can find your visit.

The fine print lives here: [Privacy](PRIVACY.md), [Terms](TERMS.md) and [Accessibility](ACCESSIBILITY.md).
