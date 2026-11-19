---
name: ui-sources
description: John's five UI sources for Meliona (Motion Primitives, Watermelon UI, Kokonut UI, Bklit UI, Anime.js) - where each lives, what the site already took from them, and how to bring in more without breaking the house style. Use when asked to amplify, polish or animate Meliona's page, or when one of these sources is named.
---

# UI sources for Meliona

Read `docs/design/DESIGN-RULES.md` first: it holds every design rule John has given, and this skill is one step of its "Before any design work" list.

John named five component sites to raise the page's design (2026-11-17). Meliona is a
Streamlit app, so none of them can be installed as-is: they are React/Tailwind or a JS
library. Take the idea, then rebuild it in the page's own terms: a few lines in
`static/app.css` (MOTION / CRAFT sections), `static/reveal.js`, a Plotly setting in
`main.py`, or markup in `hero.py`. The repo's CLAUDE.md wins over anything here.

## The sources

| Source | Site | Code (readable when the site is not) | License | What it offers |
|---|---|---|---|---|
| Motion Primitives | motion-primitives.com | github.com/ibelick/motion-primitives (`public/c/registry.json` lists every component) | MIT (README, npm) | animated React components: text effects, in-view, animated background, disclosure |
| Watermelon UI | ui.watermelon.sh | github.com/WatermelonCorp/watermelon-platform | MIT | landing-page blocks: FAQ, stats, heroes |
| Kokonut UI ("Coconut UI") | kokonutui.com | github.com/kokonut-labs/kokonutui | MIT | cards, buttons, inputs made to hand to an AI assistant |
| Bklit UI ("Backlit UI") | ui.bklit.com | github.com/bklit/bklit-ui | MIT (charts; Bklit Studio is proprietary) | interactive charts, reference areas, end markers |
| Anime.js | animejs.com | npm `animejs` (4.5.0 read) | MIT | stagger, timelines, SVG line drawing, text splitting |

Cloud sandboxes may not reach the five sites. Read their GitHub source instead; never
fetch from a host outside the network policy.

## Already on the page (do not add twice)

- **Bklit end labels + reference mark** - the cone's day-252 best 5, median and worst 5,
  and the headline CVaR as a "Bad-year loss" mark (`fan_chart` in `main.py`;
  `test_the_cone_says_its_own_numbers_and_ends_on_the_last_day`).
- **Anime.js line drawing, by hand** - a chart's lines draw once as they arrive
  (`pathLength="1"` set in `reveal.js` `show()`, `@keyframes line-draw` in `app.css`). No library.
- **Motion Primitives animated background** - a 3px gold bar follows the pointer down
  the footer index (mouse only; `.f-trail`).
- **Kokonut card stat column** - each lead and anchor in the Book shows its ticker,
  share (with a bar to scale), grit and partner beside its sentence (no grit for a
  steady name from outside the basket: grit ranks within the basket)
  (`test_the_books_figure_column_repeats_only_its_sentence`).
- **Watermelon FAQ block** - the five questions are native `<details>` rows, closed at
  first (`test_the_faq_is_five_questions_a_reader_opens`).
- **Risk by name as a dumbbell** (2026-11-19, turned down on 11-17 as "worth a later look", then built) - one row per name, gold square = money share, dark diamond = risk share, a hairline between; the trace names stay for deep_scan (`risk_by_name_fig` in `main.py`; `test_risk_by_name_is_a_dumbbell_of_the_engines_own_shares`).

## Rules for anything new from these sources

1. **Numbers stay the engine's.** A component may show only figures the engine computed,
   in the same format the page prints them. Reject anything that scrambles, rolls,
   interpolates or projects numbers (Kokonut Metric Card, Bklit Projection Line,
   Live Line Chart, Text Scramble).
2. **Calm motion.** No bounce or overshoot, no tilt, flip, 3D, zoom, parallax or
   scroll-linked motion. Entrances ease out, on-screen moves ease in-out, and
   `prefers-reduced-motion` turns it off. Nothing a button flies to animates, and nothing
   a reader opens gets an arrival.
3. **Flat look.** No gradients, glow, glass, shadows, rounded cards, purple or emoji.
   Georgia for words, the label voice for capitals, and text colours that pass AA.
4. **No new dependency** when a few lines of CSS or vanilla JS do it. Anime.js was read,
   not installed.
5. **Prove it.** Add a test that fails on the old page, run `python -m tools.check`, and
   show before/after screenshots on the same data.

## Considered and turned down (2026-11-17)

Watermelon stats cards (gradients, glow, a wall of cards); numbered FAQ rows (a numbered
list that is not a sequence reads as generated); Kokonut Liquid Glass, Card Flip, Particle
and Gradient buttons; Bklit gradient areas, crosshair (the page turned spikes off) and glass
pills; Motion Primitives Tilt, Spotlight, Glow, Border Trail, Magnetic, Infinite Slider and
Text Roll.
