# Meliona

![tests](https://github.com/ricepillow3000/Meliona-Risk-Engine/actions/workflows/live-audit.yml/badge.svg)
![site up](https://github.com/ricepillow3000/Meliona-Risk-Engine/actions/workflows/uptime.yml/badge.svg)

Hi there! Meliona is a free website that shows how much your stocks could lose in a bad year.

Most people only ask, "How much could I make?" The better question is, "How much could I lose?" Meliona answers that with one clear number.

## Try it

**https://summer-2026-quant-project-risk-engine-blueprint-production.up.railway.app**

## What you will find

- **One big number.** How much you could lose in a really rough year.
- **Real crashes, replayed.** See what 2008, 2020 and 2022 would have done to your stocks.
- **The Grit Zone.** Which of your stocks bounce back fast after a fall.
- **The Book.** Your wild stocks, paired with calmer ones that help steady things.
- **A risk map.** Where your stocks could drift over the next month.

Not sure what to pick? Start with a ready-made group, like big tech, or type in any stock you like.

## How it works

It grabs real prices from Yahoo Finance after each trading day. Then it plays out thousands of possible years and shows you the average loss in the worst 5% of them.

Every number is real. Nothing is made up or guessed, and you can see where each one came from.

## Tested every day

Before any change goes live, over 300 automatic checks make sure the math is right and nothing broke. Every day, the whole site also gets tested on 13 different phones, tablets and computers, and every 15 minutes a check makes sure it's still up.

## Safe to use

There's nothing to sign up for. No accounts, no passwords and no tracking. It's for learning, not investment advice.

## Run it yourself

```bash
docker run -p 8501:8501 ghcr.io/ricepillow3000/meliona:latest
```

Then open http://localhost:8501. No Docker? Run `python -m pip install -r requirements.txt`, then `python -m streamlit run main.py`.

## Say hi

Questions or ideas? Email meleona.support@gmail.com. The fine print lives in [Privacy](PRIVACY.md), [Terms](TERMS.md) and [Accessibility](ACCESSIBILITY.md).
