# Meliona feature map (GEN-76)

One public Streamlit page, no accounts, so there is no admin: walk it as an anonymous visitor, laptop (1366x768) and phone (iPhone 13).

## Start it locally
- `python -m streamlit run main.py`, open http://localhost:8501 (CLAUDE.md "Commands"). Production runs `streamlit run serve.py` (Procfile). One server at a time.
- Market data comes from Yahoo at runtime. A cloud sandbox cannot reach it: run the live walks through the Live audit workflow (`.github/workflows/live-audit.yml`) and read its log.
- Gate: `python -m tools.check`. Real-browser walks take the page URL: `node tools/<name>.mjs http://localhost:8501`.

## Features (main.py unless noted)
| Feature | User path | Working looks like | Covered by |
|---|---|---|---|
| Hero and boot skeleton | open `/` | skeleton outlines the hero, then the hero (crest, title, 4 stats, "Start with the Grit Zone", "Contact John") with no sideways scroll | tools/site_check.mjs, tools/craft_check.mjs |
| Button glides | press a `.cta-btn` / `.cta-link` (hero.py:99, main.py:1010,1070,1175,1186) | the page flies to `#grit-showcase`, `#crisis-record`, `#the-slice`, `#engine`, `#analysis`; also while still loading | tools/glide_load_check.mjs, tools/map_wheel_check.mjs |
| Arrival motion, wheel tow | scroll down with the wheel | blocks fade in once where the reader sees them, no gold block flash | tools/arrival_check.mjs, tools/key_wheel_check.mjs |
| Phone dock and cookie notice | phone width: first visit | notice shows once, clear of the CTA; "Run the risk engine" bar glides to `#engine` | tools/site_check.mjs (static/dock.js) |
| Side of the trade | `#engine`: radio "Which side of the trade are you on?" Bullish / Bearish | headline, cone, crisis replays, Risk Breakdown and map rerun short; Book and Grit stay long | tools/recruiter_walk.mjs, tests/options_audit.py |
| Pick a basket | drawer "Portfolio: which names to test": preset select, "Tickers to analyze" (type BRK-B) | `?preset=` set in the address; reload keeps it; a name past 25 is refused with a message | tools/recruiter_walk.mjs, tests/test_engine.py (test_the_preset_rides_in_the_address_and_only_a_known_one, test_universe_size_is_capped_at_the_funnel) |
| Weights | drawer "Weights": "How the names move together" (3 choices), "Weighting" Equal / Risk parity, "Aim for a set level of yearly swings" + slider 5-30 | weights and leverage text change; EWMA shows the Panic view note | tools/deep_scan.mjs, tests/options_audit.py |
| Stress test | drawer "Stress test": "How bad years are simulated", "Scenario", market fall and turbulence sliders | custom shock moves the cone; a crisis replay lists excluded names and its caption | tools/deep_scan.mjs (DEPTH=full), tests/batch_audit.py |
| Headline verdict and cone | read the CVaR sentence, then the cone chart and "How to read the cone" | one finite percentage, no NaN, CVaR >= VaR | tools/demo_check.py, tools/site_check.mjs |
| The Book | `#the-book`: "Book size ($)", "Most of a day's volume you trade (%)" | LEADS and ANCHOR cards change with size; big size drops names | tests/test_narrative.py, tools/deep_scan.mjs |
| Risk Topology tab | tab strip at `#analysis`, first tab; calibration Calm / Baseline / Stressed, "Explain the map" | map draws, glossary opens and closes, no panels over the plot at any width | tests/map_layout.mjs, tests/map_probe.mjs, tools/map_wheel_check.mjs |
| Risk Breakdown tab | second tab | "Risk by name" and "Return for the risk taken" (Sharpe vs T-bill) render | tools/recruiter_walk.mjs, tools/deep_scan.mjs |
| Grit Zone tab | third tab | "Grit, part by part" bars, case studies, excluded-for-thin-history caption | tests/batch_audit.py (GRIT-01..05), tools/deep_scan.mjs |
| Crisis Conviction tab | fourth tab; open "Show the full table" | "What a buyer actually got" per crisis | tools/deep_scan.mjs |
| Data checks and audit trail | drawer "Where the numbers come from": Data Quality, Lineage & Audit tabs | PASS/WARN/FAIL report and the run's step list | tools/live_provenance.py, tools/demo_check.py |
| Your data | "Clear this session's data" | session state and `?preset` cleared, shared cache kept | tests/test_engine.py (test_no_visitor_control_clears_the_shared_cache) |
| John, story, FAQ | scroll to the close: About, "Why I built this", 5 questions | photos load, answers read, no advice or guarantee | tests/test_engine.py (test_johns_story_sits_beside_his_out_of_suit_photo_above_the_contact, test_the_faq_is_five_questions_a_reader_opens), tools/craft_check.mjs |
| Contact form | `#contact`: name, Topic, Message, "Prepare my email" | a mailto is prepared, the thank-you state shows, nothing stored or sent | tests/test_engine.py (test_the_contact_form_prepares_an_email_and_keeps_nothing) |
| Footer index | footer boxes (`.f-box`) | each lands on its section | tools/deep_scan.mjs, tools/site_check.mjs |
| Phones and tablets | open every drawer and tab on 13 devices | no sideways scroll, no cut text, every control clickable | tools/device_check.mjs |
| Security headers, kill switch | `MELIONA_MAINTENANCE=1` | maintenance page and no market call | tools/security_probe.py (headers); the kill switch: none found by name |
