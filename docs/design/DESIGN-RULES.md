# Meliona design rules

Every design rule, preference and lesson John has given for the Meliona website, from the first
session to 2026-11-17, in one file. John asked for "every single thing, not a single one missed
out", and that "every design session from here on out" starts here "before anything gets designed".

This file is the design half of the repo's rules. `CLAUDE.md` stays authoritative where the two
overlap, and a rule's enforcing test is named beside it wherever one exists. Copy it into the
Obsidian vault as it is; when a design session adds a rule, add it here in the same pull request.

How it was built (2026-11-17): two read-only agents went through the whole record. One read every
commit in the git history, bodies and diffs included. The other read CLAUDE.md, PROGRESS.md,
ACCESSIBILITY.md, README.md, LAUNCH_CHECKLIST.md, every stylesheet and script comment, every test
docstring and every probe header. Their two lists make up the sections below. Rules John later
changed show their final state, and the history appendix keeps how each one got there. The vault's
own notes (Lessons, Memory-Bridge, Pod-Workflow) sit on John's computer and could not be read from
the cloud, so a rule kept only there must be added here by hand.

## Before any design work

Read this before changing anything a visitor sees: the page, the map, the banners, the words.

1. **Read this whole file**, then load the `ui-sources` skill (`.claude/skills/ui-sources/SKILL.md`).
2. **Go to John's five UI sources first** (next section). Look for the pattern there before
   inventing one, then rebuild it in the house's own terms. Never paste a React, Tailwind or
   library component into this Streamlit app.
3. **Check the idea against every section below**, the turned-down list included. If it breaks a
   rule, drop it or ask John. Never quietly bend a rule.
4. **Keep the numbers the engine's.** A design may show only figures the engine computed, in the
   format the page already prints, from live Yahoo Finance data.
5. **Prove it before and after.**
   - Write a test that fails on the old page, then make it pass.
   - Run `python -m tools.check`.
   - Run the browser probes the change touches (craft_check, arrival_check, device_check, map_layout).
   - Take before/after screenshots on the same data.
   - Show John, in plain words and with a simple visual, why it is easier, simpler or more fun.
6. **Fix the page, not the threshold**, when a probe fails. Two fix rounds, then ask John.
7. **Add the new rule here** (and its test name) in the same pull request.
8. **Review the change against the web interface guidelines** (the `web-design-guidelines` skill, a pinned
   copy of Vercel's list). Where it disagrees with this file (it asks for Title Case), this file wins.

## John's five UI sources

John named these on 2026-11-17 as the places to look first for any design improvement.

| Source | Site | Code, readable when the site is not | License |
|---|---|---|---|
| Motion Primitives | motion-primitives.com | github.com/ibelick/motion-primitives | MIT |
| Watermelon UI | ui.watermelon.sh | github.com/WatermelonCorp/watermelon-platform | MIT |
| Kokonut UI ("Coconut UI") | kokonutui.com | github.com/kokonut-labs/kokonutui | MIT |
| Bklit UI ("Backlit UI") | ui.bklit.com | github.com/bklit/bklit-ui | MIT (charts) |
| Anime.js | animejs.com | npm `animejs` | MIT |

What the page already took from them (2026-11-17):
- **Bklit:** the cone's end labels and its "Bad-year loss" mark.
- **Anime.js:** chart lines that draw once, done by hand in CSS.
- **Motion Primitives:** the footer index's gold trail.
- **Kokonut:** the Book's figure column.
- **Watermelon:** the FAQ as rows a reader opens.

Details, the porting rules and what was turned down are in the `ui-sources` skill.

---

## Look and palette

- **The share banner is the reference for the whole site.** — "the entire website's design matches the design of our banner" — 2026-11-05 (ME-28). Reference file: `tools/og_image.html`.
- **The palette.** Paper `#EDE9E3`. Ink `#3F3B35`. Second ink `#5D574D`. Bronze for text `#6A5030`. Stone `#2E2A25` for the dark blocks. Deep stone `#26221E` for the footer. Gold for words on stone `#C6A26B`. Gold for rules on stone `#B8955E`. Words on stone are `#EDE9E3`, or `#D8D1C5` for quieter ones. Bronze `#9A7B4F` is for rules only.
- **Fewer shades.** Nine beige grounds became three, five muted inks became two, five hairlines became one. Current tokens: page `#EDE9E3`, panel `#F1EDE5`, tile `#E9E4DB`, hairline `#C4BDAE`. — 2026-11-04 (LAUNCH_CHECKLIST #136).
- **Overall style: Citadel-like, calm and neutral, not flashy.** No bright or flashy colours. — CLAUDE.md constraint 5. "Square, matte, and alive on arrival" — 2026-10-30.
- **Flat colour, square corners, hairline rules.** No gradients, shadows, glass, glow, sheen, grain or rounded cards. — 2026-11-04 and ME-28 — `test_no_decorative_gradients_glass_or_grain`, `test_corners_are_square_and_the_maps_rings_stay_in_the_plot`, `test_the_page_carries_none_of_the_generated_site_tells`; craft_check (fails on any painted rounded corner).
- **Gradients only where they do a job:** the loading shimmer and the "Updating" rail. The photo scrims left with the photos. main.py may contain no `gradient(` at all, and the map and the 404 page none in their styles. No `background-clip: text` (the old gradient-filled verdict numeral). — `test_no_decorative_gradients_glass_or_grain`.
- **No hover lift or floating shadow.** Hover feedback is a colour change only (no `translateY(-…)`, no `box-shadow` on hover). — 2026-11-04 — same test.
- **Square everything.** The only round shapes allowed are radio buttons ("it is what tells a radio from a checkbox") and the crest's disc. — "soft corner radius on everything" and "circle icons" read as a generated site — 2026-11-10 — `test_the_page_carries_none_of_the_generated_site_tells`; craft_check `square`; cta_style_check.
- **No purple, blue or rainbow.** Every hex in the stylesheet must be a warm neutral or from the bronze/gold family. — 2026-11-10 — same test.
- **Text tones are separate from decorative tones.** Decorative colours may stay light. Any colour that carries words must clear AA on the ground it sits on. — 2026-08-26 — `test_text_colours_meet_wcag_aa`.
- **Alerts are not blue, yellow, green or red.** An alert is a panel under a rule, and the rule's tone plus the words say what kind it is. — app.css.
- **No colour emoji status marks.** The Data Quality tab was the only bright colour on the page. Status marks are a fixed-width serif glyph that lines up like a ledger. — ME-04, 2026-10-22 — `test_the_outlier_links_and_marks_now_match_their_siblings`.
- **Theme pinned light.** A dark operating system or a forced dark mode still renders the beige page. The menu that could switch themes is hidden. — LAUNCH_CHECKLIST #125.
- **Ornaments:** the crest's faint engraving is the only decoration (see "Images, crest, banners and link preview").
- **The Risk Topology map uses the house palette in its dark-band register.** Ember (the hazard red) is used only for function, never decoration. The off-palette gold `#C9A227` and `--bronzehi` are banned. — war_room.html header; `test_no_decorative_gradients_glass_or_grain`.

## Type

- **Georgia for every word that is read.** Weight 700 for display titles. Serif headings only, never sans-serif. — CLAUDE.md constraint 5; app.css header.
- **No web fonts.** Georgia and system fonts only. — LAUNCH_CHECKLIST #62.
- **Capitals appear only in the "label voice":** Helvetica, bold 700, 12–14px, tracked .2em. In bronze on paper and gold on stone. Used for kickers, the labels over numbers, buttons and tabs. Nothing is tracked unless it is that label. The map, the 404 page and main.py's copy never set capitals themselves. — 2026-11-04, then ME-28 2026-11-05 — `test_capitals_speak_only_in_the_banners_label_voice`.
  - Superseded: on 2026-11-04 capitals were kept for the verdict's label alone.
- **No negative letter-spacing anywhere.** Type sets at its own spacing. Streamlit's −0.005em on its headings is undone. — "the generated-page look", 2026-11-04 — `test_no_negative_letter_spacing_anywhere`; craft_check `tracking`.
- **No italics in the copy.** No Instrument Serif. Little monospace: ticker names and the session reference are plain text, not code font. — LAUNCH_CHECKLIST #133; `test_visitor_copy_has_no_numbers_eyebrows_honest_or_shouting` (no `<i>`).
- **Buttons speak the label voice, never Source Serif.** Streamlit's markdown rule overrode `font: inherit`, so the fix uses `!important`. — ME-28 part 4.
- **The CRAFT layer** — "make the website feel more immersive, alive, less AI and human" — 2026-11-09 — `test_the_pages_craft_holds_kerning_figures_measure_widows_and_touch`; craft_check:
  - Kerning on, `optimizeLegibility`, `font-size-adjust: from-font` (keeps the x-height on a fallback font).
  - Tabular, lining figures on every number on the page and on the map.
  - Line spacing: prose 1.45–1.8, display type 0.9–1.25.
  - Prose stops at 68ch (craft_check fails a paragraph wider than 75 characters a line) and wraps `pretty`. Headings wrap `balance`. No paragraph ends on a lone word.
  - A figure is never broken across lines: a slider's value label stays on one line.
- **Sizes in rem,** so a reader's own font-size setting reaches the page. Nothing on the page under 11px. Footer bar and session reference at least 12px. Book role labels at least 11px. Nothing on the map under 10px. — 2026-11-04 — `test_type_follows_the_readers_font_size_and_stays_readable`.
- **The hero's name** is the banner's display: Georgia 700, with the product line under it. On a phone the name keeps its display size.
- **No Streamlit heading-link icon.** It is a sans-serif icon that read as a stray control on serif headings. It is hidden; in display titles its empty line box is removed too. — ME-04/ME-28 — `test_the_outlier_links_and_marks_now_match_their_siblings`.

## Layout and spacing

- **Lead with one number.** One headline CVaR verdict and one sentence at the top. Everything else is folded into tabs and drawers. Never flatten it back into a wall of charts. — CLAUDE.md constraint 3.
- **The page tells one story:** a bad year's loss, what real crashes did, which names hold up, and how anchors carry flyers. The tab strip is exactly Risk Topology, Risk Breakdown, Grit Zone, Crisis Conviction, in that order. — John, 2026-11-05 (ME-28) — `test_the_tab_strip_tells_one_story`.
- **Cut what the risk engine does not need; keep what carries its identity** (grit, and the links between names). — John, 2026-10-29 (the overwhelm audit).
- **Order of the page:** hero → Grit Zone showcase → engine → verdict → fan chart → the Book → tab strip → the folded "Where the numbers come from" drawer → About → story → FAQ → contact → footer.
- **Nothing above the tab strip may change the number of top-level elements.** Variable output goes in one `st.container()`; slots are held with `st.empty()`. Otherwise the old map and tabs stay on screen, faded, beside the new ones. — John, 2026-10-19 (the map shown twice) — `test_the_tab_strip_keeps_its_slot_whatever_the_basket`.
- **Building blocks** (app.css header):
  - **Kicker:** the label voice with a 3px charcoal bar on its left.
  - **Annual-report rule:** a hairline across the column, with a 3px charcoal "key" over its first 160px.
  - **Receipt:** a 3px top rule, then rows divided by hairlines.
  - **Section heading:** kicker, serif title, annual-report rule, then words.
- **Ruled columns instead of boxes.**
  - Slabs and metric tiles: a 3px charcoal rule and no box.
  - Pillars: three ruled columns under a 3px rule, divided by hairlines, always one row of three (they once wrapped to two plus an orphan, 2026-11-02).
  - Tables: a receipt (the 3px rule over a hairline frame).
  - Cards keep only the house's top rule, never a full box. — LAUNCH_CHECKLIST #132.
- **Plain-language read-out under a chart:** a hairline over it, no panel.
- **Hero:**
  - Built like the share banner: flat paper on the left carrying the crest, its kicker, the name, the annual-report rule, the sentence and the button. A charcoal stone block on the right runs to the page's top and right edges and to the band below, and carries the engine's facts as a receipt.
  - Full-bleed. Its margin is 16px × (the top-level blocks above it + 1). — `test_the_skeleton_paints_first_and_the_hero_lifts_it`.
  - The words sit at the optical centre, about 4% above the middle, in every height tier. Each tier keeps the same total padding, so the call-to-action button does not move. — 2026-11-09 — craft_check `optical`.
  - Short-screen tiers are keyed off the viewport HEIGHT and start at 1000px. Nothing is hidden. They sit last in the stylesheet with `!important`.
  - The main call-to-action button must be on the first screen without scrolling: at 1440×900 and 390×844, and with the cookie notice showing. — LAUNCH_CHECKLIST #22/#169; site_check.
  - `min-width: 0` all the way down, so the hero fits at 200% zoom on a phone.
- **Dark band:** the twin showcases share one row on one full-bleed stone slab between beige fields, with a 3px gold cap line top and bottom.
- **The Slice (Gungnir):**
  - Flat paper between two hairlines.
  - The plaque is a receipt: 3px charcoal rule, the equation, a hairline, then the sentence.
  - It reads as one screen: the controls and the button onward are both in view.
  - The dense paragraph under the sketch is cut.
  - The plaque names the sketch's own blocks (two equal-area blocks in a 3:1 pair). — `test_gungnir_plaque_matches_its_sketch_and_its_math`.
- **The Book:**
  - Its paragraph, then one ruled row per name. Each row stands under a hairline whose 3px key, over the role column, carries the role: bronze for a flyer, charcoal for an anchor, a light hairline tone for the rest. The role is set in the label voice.
  - The cards with no role and two finer settings fold into one drawer.
  - The lead and anchor cards show a stat column (after Kokonut UI): ticker, share with a bar scaled to the largest share, grit, and partner — only figures its own sentence prints. — John, 2026-11-17 — `test_the_books_figure_column_repeats_only_its_sentence`.
- **"Where the numbers come from"** (Data Quality, Lineage & Audit) is one folded drawer, one click away, never in the way.
- **Case studies** (Crisis Conviction): one ruled row per crisis — its name, then the fall, the way back and a year later, each a label, a number in bold serif and a line of what it means. — `test_the_case_studies_read_the_live_record`.
- **Orientation strip** ("New here?"): three sentences before any dial, set as a receipt with numbered steps. Its numbers are allowed because they are a real sequence. — 2026-08-26.
- **Page width** is capped at 1600px. Phone gutters are 20px (were 56px); craft_check fails under 16px. — `test_touch_targets_phone_fields_and_gutters`.
- **Wide content scrolls inside its own container**; full-bleed bands never cause a horizontal scrollbar.
- **No extra hairlines, `<hr>`s or dividers.** The pair diagram is down to two circles, a dashed line and the weights. — LAUNCH_CHECKLIST #135.
- **No section numbering** (01/02/03), **no eyebrows** that repeat the heading, **no period at the end of a title.** — 2026-11-04 — `test_visitor_copy_has_no_numbers_eyebrows_honest_or_shouting`.
- **No identical feature cards.** The footer's sections are one contents index, not three boxes. — John, 2026-11-10 — `test_the_page_carries_none_of_the_generated_site_tells`.
- **Keep raw HTML on one line per element**, because `st.markdown` cuts raw HTML at a blank line. — hero.py (vault Lessons #5).

## Motion and scrolling

**Current house rules**
- **One motion vocabulary** (app.css "MOTION"). — "twenty motion rules for a premium, corporate feel" — 2026-11-06 — `test_motion_follows_the_house_rules`.
  - Entrances ease out. On-screen moves (the tab underline, the CVaR tick, the button glide, the wheel tow) ease in-out.
  - Exits are about 20% shorter than their entrance.
  - Dropdowns and help tips open in 150–250ms (now 200ms in, 160ms out), from scale .95, growing out of their trigger and shrinking back into it — never from their own centre.
  - List rows arrive 30ms apart. A press sinks to .97.
  - A dragged slider thumb stretches 12%; its position follows the hand and is never animated.
  - Masks for photos and for button colour changes, never a cross-dissolve.
  - An icon that changes arrives with scale and blur. Success confirms with one pulse.
  - **No bounce:** no `cubic-bezier` leaves the 0..1 range, so nothing overshoots.
- **Arrivals:**
  - Every block arrives once, where the reader can see it: it starts once it is 10% inside the screen's bottom edge (`FOOT`), or after 250ms (`DWELL_MS`) if the reader stopped short of it.
  - Headings slide in from the left. On screens wider than 760px, a block in the first column of a row comes from the left and one in the last column from the right, and the text beside John's photos comes from its own side. Everything else rises.
  - Distances and time: 28px rise, 40px slide, .8s, expo-out curve `cubic-bezier(0.16,1,0.3,1)`, 90ms stagger, at most 5 steps of stagger.
  - Nothing turns or zooms.
  - — "I do not see ... headers and body of line text coming in from the left side or the right side" — 2026-11-13 — `test_motion_is_calm_enough_to_read_while_scrolling` (rise 20–32px, slide 24–48px, .6–.9s, no rotate/perspective/scale); arrival_check.
  - Superseded: the 2026-11-09 "one calm way" (a 16px rise over .6s with no side moves). The 2026-11-13 side slides are still calm: short travel, one soft landing, no turns.
- **Never 3D.** No card turns, no `rotateX/Y/Z`, no `perspective(`, not even on the first load. — "turns made him motion sick", 2026-11-09; "floating 3D shapes" are a tell, 2026-11-10 — `test_the_page_carries_none_of_the_generated_site_tells`.
- **No arrival plays during the first load.** At first the blocks sit on a short first screen before the hero's slot pushes them down. — "15 of 22 had played during the load", 2026-11-13 — arrival_check `load`; the test checks `if (!ready) return;`.
- **At least 80% of blocks are still visibly arriving when they come on screen**, and 1.2s after the wheel stops no gap is left on screen. — arrival_check `seen` / `rest`.
- **Only opacity and transform animate** (GPU), so nothing shifts the layout. `will-change` is released when a block lands. Arrivals are trigger-based: an IntersectionObserver rooted on stMain, and no scroll listener anywhere in reveal.js. — "Citadel-grade transitions: trigger-based, GPU-only, custom easing, staggered, no flash of content, and working without JavaScript", 2026-10-30 — `test_blocks_reveal_on_arrival_on_the_gpu_and_never_hide_without_script`.
- **No flash and no hidden page.** The hidden state lives only under `html.reveal-on`, which the `<head>` sets before first paint. It is never set without JavaScript or under reduced motion, and it comes off at DOMContentLoaded if the script did not run.
- **Never animated:** the hero (it has its own first-load rise: crest, stat rows, headline and line each rise 16px and fade, one after another), the boot skeleton, the map, the glide frame, the thank-you card, and any section a button flies to.
- **A destination never fades or slides as the glide lands** ("that read as a slide change"). — 2026-10-15 — deep_scan "destination never fades".
- **What a reader opens** (a drawer's body, a tab's panel) never gets an arrival. Its contents only settle in a flat 30ms-staggered rise (30/60/90/120/150ms). WebKit and touch screens move flat, never with a perspective turn. — John's iPhone screenshots of blocks frozen mid-turn, 2026-11-05 — `test_what_the_reader_opens_never_animates_and_touch_screens_move_flat`; device_check (fails on a tagged block inside opened content).
- **An interrupted arrival lands at once**, never hangs mid-way (`transitioncancel`). A block resized mid-move lands. — a wide-block test that went with the card turns on 2026-11-09 (commit `a9cb3b9`); `test_motion_is_calm_enough_to_read_while_scrolling`.
- **A section heading's rule draws once, on arrival, a beat after the heading** — never tied to the scroll position. — "frozen half-drawn", 2026-11-06.
- **Chart lines draw once as they arrive** (Anime.js-style `pathLength=1`, done by hand). Charts settle in rather than snapping.
- **The CVaR tick moves on an arc** (height 15% of the distance, 2–8px) and hops only when it really moves. — "use arcs for object movement", 2026-11-06 — `test_the_cvar_tick_hops_an_arc_only_when_it_really_moves`.
- **Masks:** John's photos are uncovered from their cap down as they arrive.
- **Button hover:** the colour change is a rising paper mask that opens from where the pointer came in (`--mx/--my`) and closes toward where it left. Without a pointer it rises from the bottom middle. — 2026-11-09 — craft_check `origin`.
- **Tabs:** one shared underline slides between tabs (in-out curve). A pick made mid-slide continues from where the underline is. — craft_check `shared` / `interrupt`.
- **Footer index:** a 3px gold bar follows the pointer down the entries (Motion Primitives' animated background, mouse only). On the first hover it appears in place.

**Wheel and scrolling**
- **The wheel tows the page "like a boat being tugged".** — "heavier ... like a boat being tugged" — 2026-11-04. It uses a critically damped spring (`TOW` = 10), keeps momentum between notches and settles in about 0.6s without overshoot. — `test_motion_is_calm_enough_to_read_while_scrolling` (TOW must be 8–12); `test_blocks_arrive_from_where_they_sit_and_the_wheel_glides`.
  - Superseded values: 4.6, then 3.8. At 3.8 the page drifted 1.7s after the wheel stopped and made him motion sick. — "gives me motion sickness and unfocuses my eyes", 2026-11-09.
- **Hard ends, no rubber band.** Pushed past the top, the page stays put and no gap shows. — 2026-11-09.
- **The tow stands aside** while a button's glide flies, inside anything that scrolls on its own, for zoom, touch and keys, and under reduced motion.
- **The wheel glides over the Risk Topology map too:** every same-origin frame gets the same listener, and the map's own scrolling panels take the wheel first. — "once it got to the map, it went back to the static state", 2026-11-06 — map_wheel_check (one notch spreads over many frames; a run of notches never jumps more than 40px a frame).
- **The map's last pixel row belongs to the page**, so a fractional pixel row cannot cause a 100px step. — Live audit, 2026-11-12.

**Button glides**
- **Every button glides; none jumps.** — 2026-10-30 — `test_every_in_page_button_is_flown_by_both_glide_scans`.
  - The glide follows a moving target, flies one flight at a time, yields to the reader's wheel, touch or keys, and lands about 26px from the top (within 60px).
  - No frame covers more than 25% of the flight. The ease is a sine curve (the quartic peaked at 4× the average speed).
  - A press made before the target section exists, or before the glide script has loaded, is kept and flown later.
  - — "very laggy and buggy", "sometimes the button does not transition", 2026-10-19/22 — `test_the_glide_follows_a_moving_target_and_yields_to_the_reader`, `test_a_press_waits_for_its_section_as_long_as_the_page_is_still_being_written`, `test_a_button_pressed_while_the_page_is_still_loading_still_glides_all_the_way`, `test_a_waiting_press_yields_only_to_the_readers_own_hand`, `test_only_a_decaying_flick_is_forgiven_and_every_exit_restores_the_page`; glide_load_check; deep_scan.
- **Glide brief:** "guiding them, a sense of calmness", "like an airline commercial" — 2026-08-26.
- **The call-to-action arrow is drawn, not printed.** It is invisible at rest. On hover the shaft draws downward, then the head lands; on click the finished arrow falls and fades while the page glides after it. Under reduced motion it is a plain, finished arrow. — cta_style_check (the arrow draws on hover and on focus).
- **The off-screen map stops rendering only while a glide flies** (`.st-key-risk-map`), never permanently.

**Other motion**
- **The crest's rings ripple only while hovered**, inner ring first, and settle at rest after the pointer leaves. Off under reduced motion.
- **Nothing on the map loops idly.** Every moving mark is data. — war_room.html header.
- **Reduced motion:** every CSS animation and transition stops, and the JavaScript glide asks the setting itself and lands at once. — `test_the_glide_respects_reduced_motion`.
- **Superseded motion history:**
  - 2026-11-02: "more exaggerated ... more present ... everywhere" — 46px rise, 150px swings, 16° card turns, 1.45s. Replaced on 2026-11-09.
  - 2026-10-30: scroll-linked parallax and view timelines. Removed.
  - 2026-11-06: rubber band past the page's ends. Removed 2026-11-09.

## Words and tone

- **Honest labels, no overclaiming.** "Live end-of-day", not "real-time". Scenarios "replay actual returns". Exclusions are disclosed. "13F-popular", not "Citadel's picks". — CLAUDE.md constraint 2.
- **No invented numbers.** Counts (crises, paths, history lengths, dates replayed) are read from the engine, never typed in. — `test_every_history_length_on_the_page_is_read_from_the_loaded_returns`, `test_replay_caption_states_the_dates_actually_replayed`.
- **AI-writing tells removed from every visible string:** em dashes, and spaced hyphens doing a dash's job; "It's not X. It's Y"; random bold; emoji bullets; title case; one-line paragraphs; pivotal / moreover / serves as; restating closers. — John's list, 2026-11-02.
- **No "honest" in the copy. No shouting** (all-caps words other than an allowed list of acronyms and tickers). — 2026-11-04 — `test_visitor_copy_has_no_numbers_eyebrows_honest_or_shouting`.
- **No buzzwords:** seamless, cutting-edge, revolutionary, game-changing, unlock, empower, supercharge, next-gen, state-of-the-art, world-class, best-in-class, synergy, effortless, elevate, unleash, innovative, ai-powered, actionable insights, one-stop. — 2026-11-10 — `test_the_page_carries_none_of_the_generated_site_tells`.
- **Headings say something**: no generic three-word headlines, no "Before you ask", no bare "Contact". An FAQ answer never opens by restating its question. — 2026-11-10 — same test.
- **No vague calls to action.** Buttons say where they go ("Start with the Grit Zone", "Run the risk engine", "Contact John"). — 2026-11-02/10.
- **No placeholder text** (lorem ipsum, TODO, TBD, "coming soon"). — 2026-11-04 — `test_every_link_on_the_page_goes_somewhere_and_no_placeholder_is_left`.
- **Captions, list items and notes say their one thing in 45 words or fewer**, in every tab and drawer. — "anything boring, irrelevant, bloat description, remove it", 2026-11-12 — craft_check `bloat`.
- **The story and the five answers read aloud in one breath:** no sentence over 24 words, an average of 13 words or fewer. Write "nothing", never "None". — "I already got bored", 2026-11-12 — `test_the_story_and_the_answers_read_aloud_in_one_breath`.
- **Plain words first, the method's name in brackets.** For example: "How the names move together" (Steady – Ledoit-Wolf / Plain history / Quick to react – EWMA), "Equal risk (risk parity)", "How bad years are simulated". Only the visible words changed; the values behind each choice are the same. — "simpler and easy for a user with limited technical skills", 2026-11-05 — `test_the_engines_controls_speak_plain_words_first`.
- **Explanations in plain, short words.** The map's full model statement folds under "The maths, for specialists". — "simplify this for non technical users ... fun to read and they understand 100%", 2026-11-09.
- **EWMA is explained everywhere it appears:** "recent days count most, older days fade out". — "explain EWMA in plain words too", 2026-11-12 — `test_ewma_is_spelled_out_in_plain_words_wherever_it_shows`.
- **"Anchor", never "cushion"**, in every word a visitor reads (the code's own names stay). — "anywhere it says cushion, replace it with anchor ... anchor sounds cooler", 2026-11-13 — `test_the_steady_name_is_called_the_anchor_never_the_cushion`.
- **Units are spelled out:** "16.8 points shallower", never "pp". A difference of two percentages says "points"; a ratio says "relative". — "I have no idea what that is", 2026-10-19 — `test_the_pairing_never_shows_pp_or_percent_for_a_points_gap`, `test_a_difference_of_two_percentages_says_points_and_a_ratio_says_relative`.
- **Words never assume a sign.** A median that can be negative is a "return", not a "gain". A negative CVaR reads "still ends up +X%". Tail wording follows the sign of the gap. — `test_a_median_that_can_be_negative_is_called_a_return_not_a_gain`; recruiter_walk; `test_tail_wording_follows_the_sign_of_the_gap`.
- **Captions state the method, never a fixed result** (no "a fatter, more honest crash"). A caption claims block resampling only when it happened. The crisis verdict names the engine that made it. — `test_the_jump_diffusion_caption_states_its_method_not_a_result`, `test_fan_chart_caption_claims_block_resampling_only_when_it_happened`, `test_the_crisis_verdict_names_the_engine_that_made_it`.
- **The page points only to controls that exist**, naming the drawer by its title. — `test_the_page_points_only_to_controls_that_exist`.
- **The headline's liquidity widening names its book size and participation.** — `test_the_headline_unwind_names_its_book_size_and_participation`.
- **Nothing contradictory.** Two return figures on one tab each say where they come from. — "nothing contradictory", 2026-11-12.
- **Confident and humble.** Keep the confident, true lines: every number is computed from live prices and checked a second way, the trading-desk bar, "John replies within 2 business days", "a barrier is fixed as a defect". Promise no outcome — banned: guarantee, risk-free, can't/cannot lose, will make you, no risk, always right, never wrong. Say that every model can be wrong, ask visitors to tell John about a mistake, and say mistakes get fixed and learned from. — "have confidence but have humbleness", 2026-11-13 — `test_the_page_is_confident_and_says_it_can_be_wrong`.
- **The Book's sentences never use:** capped, guarantee(d), ensure(s), fortress, risk-free, riskless, protect(s/ed), pairs trading, automated investing, manages capital, will outperform, should buy. — `test_every_template_renders_and_avoids_forbidden_vocabulary`.
- **The Book's labels.** "Left out" is used only for a name holding nothing. A card without a role shows the weight it holds. An outside ETF appears only as the anchor, and says it comes from outside. — `test_a_held_name_is_never_labelled_left_out`, `test_a_card_without_a_role_shows_the_weight_it_holds`, `test_the_book_lists_an_outside_etf_only_when_it_is_the_anchor`.
- **Loading lines are a few calm words** (60 characters or fewer). They never apologise, excuse the wait or blame the feed — no "slow", "yahoo", "sorry", "please wait", "may take". — "Remove the 'yahoo is the slow part', I cringe looking at that", 2026-10-19 — `test_every_spinner_is_a_few_calm_words`.
- **Every cached data pull says, in words, what it is doing** while it waits. — "looked stalled, as if the project crashed", 2026-10-19 — `test_every_cached_yahoo_pull_says_what_it_is_doing`.
- **Errors explain what to do.**
  - A typo gets "check the spelling"; a preset with the feed down gets "the feed is probably unreachable".
  - No raw exception text ever reaches the page.
  - A setting that would lose more than the whole book in a day stops with a sentence and no number.
  - — `test_unknown_symbols_get_a_readable_error`, `test_a_cold_start_with_the_feed_down_shows_guidance_not_a_crash`, `test_no_raw_exception_text_reaches_the_page`, `test_a_setting_that_loses_more_than_the_book_in_a_day_is_refused_in_words`.
- **Plain names on data-quality checks**, not code IDs. — LAUNCH_CHECKLIST #137.
- **Jargon gets a plain explanation nearby** (CVaR, VaR, Sharpe, beta, EWMA, drawdown, and others). No NaN or inf reaches the screen. — tools/demo_check.py; deep_scan `surface`.
- **The hero and headline speak plainly** ("Bad-year loss", "Simulated years"). — 2026-10-29.
- **The README** dropped "Institutional-Grade", "coming August 2026" and its emoji checkmarks. — LAUNCH_CHECKLIST #74/#122.
- **Every feature can be defended in an interview:** it carries a "Quant Deep Dive" explanation one click away. — constraint 4.

## Accessibility

- **Target: WCAG 2.2 AA.** ACCESSIBILITY.md must list its known gaps and never claim full conformance. — `test_accessibility_statement_matches_what_the_app_does`.
- **Text contrast:** 4.5:1 on the ground the text really sits on, measured after any opacity. Captions are drawn at full opacity because Streamlit's 60% opacity dropped them to 2.7:1. Metric labels use bronze text. Panel subtitles went from 2.04:1 to 5.91:1. — `test_text_colours_meet_wcag_aa`, `test_captions_and_small_labels_clear_aa_after_their_opacity`; caption_contrast_check.
- **The map's words clear AA on its lightest ground,** the selected pairing row `#362C1E`. Tones for words: `--dimtext #A09788`, `--bronzetext #B49563`; the breach label `#D98463`; VaR labels gold at 75%. — 2026-10-20.
- **One focus ring** for every in-page link: a 2px solid outline, no box-shadow ring, square, at 3:1 or better on its ground. Dark text bronze on beige, light bronze on stone. The page's scroller also gets a ring. — `test_every_button_wears_one_focus_ring_that_clears_3_to_1_on_its_ground`; cta_style_check.
- **The standalone pages (404, offline, thank-you) wear the same ring**, never `outline: none` with only a colour change; the FAQ rows too (text bronze, 3px offset). The contact form's name field tells the browser it is a name (`autocomplete="name"`). — web-design-guidelines review, 2026-11-17 — `test_the_web_interface_guidelines_review_holds`.
- **Status marks on the verdict:** the freshness mark differs in shape as well as pulse — a filled bronze square when live, a hollow grey square when stale.
- **Meaning is never carried by colour alone:** verdicts, exclusions and data states are also stated in words.
- **Map accessibility:**
  - The canvas layers are `aria-hidden`; a live region states the same numbers as the HUD in sentences.
  - The switches have names. — `test_the_maps_switches_have_names`.
  - The pairing rows are focusable buttons that answer Enter and Space. — `test_the_pairing_rows_answer_the_keyboard`.
  - The glossary opens with `aria-expanded`; Escape closes it.
- **Structure:** one `<h1>`, headings in order, real table header cells.
- **Images:** every `<img>` has alt text, width and height; decorative marks are `aria-hidden`; the crest has `role="img"` and a label.
- **Contact form:** visible labels, errors in words, and the thank-you state announced as a status.
- **Links name themselves** ("John Nguyen on LinkedIn"). The hidden glide frame is out of the Tab order.
- **Every animation respects `prefers-reduced-motion`.** The skeleton and the "Updating" sign still show, held still.
- **No third-party assets in the browser** (no CDN script, external stylesheet or pixel). — `test_no_third_party_assets_are_loaded`.
- **A barrier is fixed as a defect**, ahead of other work.

## Phones and tablets

- **Works on every phone and tablet, with no buttons over words.** — John, 2026-10-17 — device_check on 13 devices: Android 360; iPhone SE, 15 and Pro Max; iPad mini, Air and Pro in both orientations; laptop 1280; desktop 1440; desktop 1920.
- **device_check fails on:** sideways scroll; words on words; a control over text that is not its own; a control that cannot be clicked where it is drawn; text cut off or ending in an ellipsis; two elements sharing an id. It measures what the visitor sees.
- **Metric labels and values wrap** instead of ending in "…". — `test_metric_labels_and_values_wrap_instead_of_ending_in_an_ellipsis`. **Section titles wrap** too. — `test_section_titles_wrap_instead_of_running_out_of_their_box`.
- **Touch targets of 44×44px** on a coarse pointer. Where growing a box would move the layout, an invisible hit area grows instead. Footer links on a phone sit 44px apart. A mouse keeps the denser layout. — 2026-11-04 (67 of 78 controls were too small) — `test_touch_targets_phone_fields_and_gutters`; craft_check `touch`.
- **16px phone fields** (iOS zooms into anything smaller); **20px gutters.**
- **Safe area:** `viewport-fit=cover`, and the gutters and the dock clear the notch.
- **The map on a phone** spans the screen 8px from each edge. On frames of 520px or less the map comes first and its x-axis is on the first screen. The pairing SVG scales down. A touch picks the nearest dot. — John saw it cut off on his iPhone, 2026-10-17 — map_layout (`m414/m374/m359/m320`); site_check; `test_map_names_the_dot_under_the_finger_not_the_first_one_near_it`.
- **On a phone, blocks only rise** (headings still slide from the left), so nothing can open a sideways scroll.
- **Phone shortcut:** at 640px and under, a slim stone bar "Run the risk engine" appears only after the hero's button has left the screen, and goes as soon as the engine is on screen. It never covers the verdict, the Book or the tabs. — John, 2026-11-04 — `test_the_phone_shortcut_flies_to_the_engine_and_never_covers_it`; site_check.
- **No hamburger menu.** The tab strip scrolls sideways with a labelled button. — LAUNCH_CHECKLIST #160.
- **Nothing is pinned to the bottom except the dock**, so the keyboard never covers a field.
- **iPhones show the press state** thanks to an empty passive `touchstart` listener.

## Charts and the Risk Topology map

- **Plotly charts in the beige/bronze theme. No glow on charts.** Crosshair spikes are off.
- **The cone** (after Bklit UI): its right edge prints the day-252 best 5%, median and worst 5%, plus the headline CVaR as a "Bad-year loss" mark — each the engine's own figure. The axis ends on the last day. — John, 2026-11-17 — `test_the_cone_says_its_own_numbers_and_ends_on_the_last_day`.
- **Risk-by-name weights** are the unlevered base weights, so the two bars share one "% of portfolio" denominator.
- **Map design:**
  - Flat, near-opaque plates over a full-bleed matte terrain. Square panels with bronze crop marks, a framed and ticked plot, rhombus marks for names and the pairing, square toggles. — "a Swiss-grid map", 2026-10-30.
  - The film grain was removed later (2026-11-04).
  - No drawn territories (they "read as an RTS biome map").
  - Labels in sentence case, never tracked capitals.
- **The probability rings stay inside the plot.** — the rings were "expanding outwards on the graph", 2026-10-30 — `test_corners_are_square_and_the_maps_rings_stay_in_the_plot`.
- **Words, not codes.** No "OU" and no "BASE"/"STRESS" chips; "beta" and "vol" instead of Greek letters. Every short form the map prints is in the glossary that "Explain the map" opens under itself. — "I don't know what OU is ... add a legend", the "dead button", 2026-10-19 — `test_every_short_form_on_the_map_is_in_its_glossary`.
- **Map text matches the maths.** Each leg carries half the risk; a short flyer's loss is a squeeze; the hover reads risk direction correctly on a short book; the perimeter hover states its floor and caps; every calibration clamp is named in the footnote; the map draws no node or link the data did not produce. — `test_map_explanations_match_the_maths`, `test_map_hover_reads_risk_direction_on_a_short_book`, `test_every_calibration_clamp_is_named_in_the_footnote`, `test_the_map_draws_no_node_or_link_the_data_did_not_produce`.
- **Layout at every width** (390–1920, plus the app's real 1476/1488, plus a Windows-width font) — map_layout and `test_map_layout_holds_at_every_width`:
  - No panel covers another panel or the plot. Chips never cover tick labels. Every control can be clicked where painted. The plot is never too small to read. The canvas is never stretched.
  - Below 1000px the panels stack.
  - The HUD chips sit in a wrapping row at every width — "any breakpoint is a guess at a font's width". — John, 2026-10-19.
- **The x-axis title rides the right end of its axis**; the bottom-left corner belongs to the identity chips.

## Drawers, tabs and other controls

- **Drawers:** the old hairline box made "clean, minimal, corporate". No fill. The label in bold serif on the left, the chevron in text bronze on the right edge, room in the header. Hover and open turn the frame charcoal; an open header stands on a hairline. Colour changes only, nothing lifts. — "the old designs were good but bold the words"; "clean, minimal, corporate, and most importantly visually appealing" — 2026-11-05 — `test_drawers_are_the_old_hairline_box_made_clean_and_corporate`.
- **Tabs:** label voice; quiet ink at rest; charcoal when hovered or open; a 3px charcoal underline on the open tab; the strip stands on one hairline. — John, 2026-11-05: "the old design, kept".
- **Buttons:** a flat charcoal rectangle in the label voice. Hover inverts it into the paper colour. A button on stone is the inverse: a paper rectangle with stone words, turning gold on hover. Choose the variant by the BACKGROUND the button sits on. No bevel, shadow, shine or radius. A button sizes to its words. — ME-06/ME-28; cta_style_check.
- **The skip link** ("Skip to the analysis") is a quiet call to action: it keeps its size but takes the label voice and the drawn arrow.
- **Inputs:** flat panel ground, bronze on hover and focus.
- **Dropdowns:** square, the field's own paper, one hairline, no shadow; the row under the pointer gets a faint bronze wash.
- **Ticker tags:** square, dark bronze with paper words (6.4:1).
- **Help tips** are square and flat, and the "?" is a square mark.
- **Slider:** a square charcoal thumb on a hairline track.
- **Checkboxes and toggles** are square; radio buttons stay round.
- **Every control answers a press** — tabs, radios, checkboxes, the footer index, text links and buttons all sink to .97. — "you want buttons to feel like they did something", 2026-11-10 — `test_the_page_answers_like_an_app_skeletons_taps_and_offline`.
- **Links inside a sentence are underlined quietly**, and the line firms up on hover. Every button shows a pointer cursor. — craft_check `affordance`.
- **The ticker picker is a combobox** that filters as you type. — craft_check.
- **Drawers never snap shut on the first change.**
- **Streamlit's header bar is hidden** (it covered the crest). — `test_streamlit_header_bar_is_hidden`.
- **The preset rides in the address** (`?preset=`), and only a known preset name is accepted. — `test_the_preset_rides_in_the_address_and_only_a_known_one`.

## Hero, About, story, FAQ, contact and footer

- **Hero copy:** "Meliona / Portfolio Risk Engine". The sub-line asks what a bad year could cost and what real crashes did, and names grit. The button reads "Start with the Grit Zone"; beside it sits the quiet "Contact John" link. — call to action above the fold, 2026-11-05 — `test_the_builder_block_shows_the_portrait_and_links_out_safely`.
- **The hero's receipt counts up** to the server's exact text, and so does the verdict. Only the page's own HTML numbers count up, never a Streamlit-owned text node. — craft_check `count-up`.
- **About the builder:**
  - A full-bleed stone block between 3px gold caps. The portrait on the left under its own gold cap; the words on the right.
  - The bio is in John's own voice: "deeply passionate about building tools with AI, and still corporate and clean" (2026-11-09). It states only facts John gave.
  - Bio wording: Computer Information Systems, specializing in AI & Analytics.
  - The profile links are a receipt: gold caps line, 3px gold rule, one row per profile with a 44px square holding a monochrome mark (`currentColor`, never the brand's colour), its name, and a diagonal "opens elsewhere" arrow. Hover and focus fill the square gold. Each opens in a new tab with `noopener noreferrer me`.
  - — "a photo of me where my LinkedIn, Handshake and GitHub can be clicked on", 2026-11-05 — `test_the_builder_block_shows_the_portrait_and_links_out_safely`.
- **Why I built this (the story):**
  - On paper. The out-of-suit photo sits under a 3px charcoal cap, the words in a reading column, one pulled line on a bronze rule (a `<p>`, not a `<blockquote>`), then a signature.
  - It sits between About and the questions, near LinkedIn and the contact form.
  - His dad starts it lightly, then it speaks to everyone with the same problem.
  - No advice and no guarantee, and nothing that contradicts the FAQ.
  - — "a story place where we explain why we wanted to create this", a second photo "when I'm not in my suit", 2026-11-05; the contradiction with the FAQ raised 2026-11-06 — `test_johns_story_sits_beside_his_out_of_suit_photo_above_the_contact`, `test_the_story_and_the_faq_say_the_same_thing`.
- **FAQ:**
  - Five plain questions under the heading "What people ask before trusting a number".
  - Ruled rows a reader opens: the question in bold serif with a + on the right, native `<details>`, all closed at first, every answer still in the page.
  - The same tuple serves the FAQPage JSON-LD.
  - — Watermelon UI, John, 2026-11-17 — `test_the_faq_is_five_questions_a_reader_opens`, `test_the_schema_parses_and_its_faq_is_the_pages`.
- **Contact:**
  - Kicker "Write to John"; the heading is set by role, so there is only one `#contact`.
  - The form sits beside a small receipt of facts. Fields: an optional name (80 characters), a topic from a closed list, a message of up to 1,000 characters. Errors in words.
  - With no mail server, it prepares a `mailto:` email in the visitor's own app. The visitor's words are never printed into the page, logged or stored.
  - The thank-you state is a receipt with one pulse.
  - "John replies within 2 business days" appears everywhere it is relevant.
  - Both addresses are listed, each with its job; LinkedIn is the second way to reach him.
  - — "I'm more active there", 2026-11-05 — `test_the_contact_form_prepares_an_email_and_keeps_nothing`, `test_the_contact_form_writes_to_john_and_linkedin_is_the_second_way`, `test_the_thank_you_page_is_branded_noindexed_and_says_when_john_replies`.
  - John's Gmail may appear only in the contact UI and PRIVACY.md, never in TERMS, SUPPORT or LAUNCH_CHECKLIST. — PROGRESS "Rules that bite".
- **Footer:**
  - The deepest stone plinth under a 3px gold cap, run to the page's bottom edge.
  - An index read like an annual report's contents, not three identical cards (John, 2026-11-10).
  - Links to Privacy, Terms, Accessibility and "Source code on GitHub" in one row and one tone. — `test_the_footer_links_to_the_source_code`.
  - The support email and phone are clickable (`mailto:` and `tel:`).
  - The session reference is full size, in light ink.
  - Small light profile marks and the copyright.
  - No dead footer links. — craft_check.
- **Thank-you page, 404 and offline page:** the banner's paper and stone, a way back, `noindex`. The 404 has no eyebrows and no gradients.

## Images, crest, banners and link preview

- **No photo backdrops.** The only photographs are John's own two: the About portrait and the story photo. They are real `<img>`s with alt text, width and height, lazy loading and async decoding, served as files. Never base64 on the websocket and never a CSS background. `static/` serves no other image. — ME-28, 2026-11-05 — `test_blocks_reveal_on_arrival_on_the_gpu_and_never_hide_without_script` (the exact list of image files).
- **Photo editing** (`tools/portrait.py`): a 4:5 crop at 480×600 (twice the 240×300 drawn size), one global grade only (portrait warm; story saturation ×0.88), no local retouching, no EXIF. AVIF, WebP and JPEG, each under 30KB.
- **The crest:**
  - A charcoal disc with three rings fading outward, and a regular hexagon cut by an X into two inward-pointing equilateral triangles and top/bottom rhombuses, plus a keystone rhombus. Beige pieces. Nothing touches. Perfectly symmetric (drawn about 0,0).
  - No plate or frame.
  - Ripple on hover, made 15% stronger on 2026-11-04.
  - — John's mandate from his sketches (with the outer triangles crossed out), 2026-10-28/29 — `test_the_crest_is_symmetric_and_its_pieces_never_touch`.
- **The crest's engraving** is the only ornament: the logo's own five pieces, as a gold outline at 10%, a 1px hairline, used once (in the dark band), never on paper, and never behind the hero's receipt. — John, 2026-11-09 — `test_the_crest_engraving_is_the_banners_and_used_sparingly`.
- **No watermark logo** anywhere. — "a watermark logo reads tacky", 2026-10-30.
- **Tab icons** are rendered from `assets/logo.svg` at each shown size (the tab icon drops the rings, which blur at 16px) and linked by a hash of their bytes, so no browser keeps showing the old lion. — "the browser tab still showed the old lion", 2026-11-05 — `test_the_tab_icon_is_the_crest_at_an_address_no_browser_has_cached`.
- **Share image** (`public/og-image.png`, 1200×627):
  - Content: the crest, the name, one sentence, and a ruled receipt from the newest committed live audit. Every figure on it and in its alt text must appear in that audit.
  - Leave out: fan charts, stat tiles, eyebrow capitals, italic subtitles and the date. Avoid a phrase like "727 of 728", which reads as one failure.
  - Layout: twelve columns, 64px margins, 24px gutters; a stone block from column 8 to the edge with the faint crest; a plinth with a gold cap. Gelasio and FreeSans as Georgia/Helvetica stand-ins. No gradients outside the crest, no rounded cards, glow or shadow.
  - — "weight, stability and defense; Swiss discipline, primitive shapes and chevrons, real architecture" (2026-11-05); "the image carries no date"; preview figures (2026-11-13) — `test_the_link_preview_quotes_the_newest_live_audit`.
- **LinkedIn cover:** the same system cut into a strip. The lower-left corner carries nothing (the profile photo sits there); words start at 460px; it uses the same audit receipt as the share image.

## Loading and app feel

- **A skeleton from the first frame.** index.html paints the hero's own markup in transparent ink, matching the real hero within 2px. The hero lifts it when it arrives (not a timer); a 30s safety net covers the case where it never does. Shimmers run until the lift. Under reduced motion it is held still. A "Loading Meliona" label is shown. — "I was not met with a skeleton loader", 2026-10-19 — `test_the_skeleton_paints_first_and_the_hero_lifts_it`; site_check.
- **Skeletons, never spinners.** A loading line is a grey shimmering block where the result will land, and its words stay. No `st.spinner`. — "blank screens and spinners" are a tell, 2026-11-10 — `test_the_page_answers_like_an_app_skeletons_taps_and_offline`; craft_check.
- **A visible "Updating…" sign:** a bronze rail across the top plus a still "Updating…" tag. It takes no clicks and stays visible (still) under reduced motion. — "the loading wheel has no animation or no clear noticeable visual", 2026-10-19 — `test_a_running_script_is_visible_to_the_visitor`.
- **Optimistic update:** the rail lights on the press itself, within 150ms. Stale numbers dim to .72 and are never blanked. — 2026-11-09 — craft_check `optimistic`.
- **Offline:** a notice when the connection drops, and an offline page for a fresh load with no connection. The service worker touches nothing else. — 2026-11-10.
- **The head preloads dock.js** (no empty first screen).
- **Streamlit's own bundle goes out gzipped.** Streamlit serves `/static/` raw; `serve.py`'s `StaticGzip` compresses each immutable file once and keeps it (21 MB of text becomes about 6 MB). On a 4G phone the largest paint fell from 8.9 s to 1.4 s and the headline from 7.6 s to 6.3 s. — speed check, 2026-11-17 — `test_streamlits_static_bundle_goes_out_gzipped_and_compressed_once`.
- **First visit:** a full preset basket. An emptied basket says what to do next.
- **Layout shift under 0.02** once the loading screen lifts. — craft_check.
- **Freshness:** the "data pulled" mark updates at most every 30s (currently 60s) and pulses once per tick only while the data is live. A 1px bronze reading-progress line driven by the scroll timeline only. Nothing styles `stMain::before` (it merged with Streamlit's focus ring into a full-screen gold block, John 2026-11-06). — `test_freshness_ticker_does_not_tick_every_second`, `test_the_freshness_dot_and_the_reading_line_are_honest_and_still`, `test_a_key_and_the_wheel_never_paint_a_gold_block`; key_wheel_check (bronze over 3% of the screen fails).
- **Meaningful accents on the verdict:**
  - A 0–100% hairline scale with a tick at the value and a faint tick at the last headline.
  - "+N points vs your last setting", read from the numbers as displayed; equal displays say nothing.
  - "Stressed" and "Short book" marks.
  - A "beyond" notch when the loss passes the whole book.
  - — "make the website feel alive ... add visual details and accent marks that are meaningful", 2026-10-22 — `test_the_headline_accents_follow_real_state`, `test_the_headline_move_is_read_from_the_numbers_as_displayed`.
- **The cookie notice** informs and never blocks: a stone slab with a gold cap and an OK button, shown once, never over the call to action or the phone bar. — 2026-11-04 — `test_the_cookie_notice_informs_once_and_never_blocks`.
- **"Clear this session's data" confirms itself after the reload.** — "add success messages", 2026-11-04 — `test_clearing_the_session_says_so_after_the_reload`.
- **A double press lands once;** the map's Run button disables itself while it runs.
- **No Streamlit deprecation warnings.** `st.iframe`, never `components.html`. — `test_the_app_calls_nothing_streamlit_has_deprecated`.

## Process rules for design work

- John's four rules: think before coding (state assumptions, ask when unclear); simplicity first; surgical changes; goal-driven (a test that fails first, then passes). Code that nothing ships is deleted. — CLAUDE.md, 2026-11-06.
- When a mistake happens twice, add a rule-test so it cannot happen a third time.
- When a page change breaks deep_scan, fix the page, not the threshold.
- Run `tests/map_layout.mjs` after any change to `prototypes/war_room.html`.
- Run `python -m tools.check` before every push. The browser checks (craft_check, device_check, arrival_check, map_wheel_check, key_wheel_check, site_check, deep_scan, glide_load_check, cta_style_check, caption_contrast_check) run in the Live audit.
- Layout probes measure the landed state through `__melionaReveal.revealAll()` and answer the cookie notice through `__melionaNotice.dismiss()`.
- Measured, not assumed: verify in a real browser on rendered pixels and real input (real wheel, real keys); give before/after figures.
- **John's five UI sources** (Motion Primitives, Watermelon UI, Kokonut UI, Bklit UI, Anime.js). Take the idea and rebuild it in the house's terms. Read their GitHub source when the sites are unreachable. — ui-sources skill, 2026-11-17. Rules for anything taken from them:
  1. Numbers stay the engine's. Nothing scrambles, rolls, interpolates or projects a number.
  2. Calm motion: no bounce, tilt, flip, 3D, zoom, parallax or scroll-linked motion.
  3. The flat look.
  4. No new dependency when a few lines will do (Anime.js was read, not installed).
  5. Prove it: a test that fails on the old page, `tools.check`, and before/after screenshots on the same data.
- A new in-page button must be added to both glide-scan lists.
- Front-end and back-end sessions own separate files. Say so in the PR before touching the other side's file. Start each branch from the latest main.
- Comments in `src/` stay short and plain; dates and incident stories go in commit messages. (John, 2026-11-09)
- Never copy the vault's contents into this public repo.
- Run only one Streamlit server at a time.

---

## Turned down by John

Tools reviewed and not used (2026-11-17, recorded in `.claude/skills/THIRD_PARTY.md`): img2threejs (photos turned
into 3D objects to spin: John turned down 3D and spinning); awesome-design-md (copies another site's fonts,
colours and spacing; this file is Meliona's own design file); the impeccable installer and an unpinned
chrome-devtools-mcp server (the guidance and a pinned speed check were used instead).

- Drawer designs: a stone plaque, a beige plaque, and a partial rule on the top edge ("looks a little tacky"). — 2026-11-05.
- A watermark logo: the crest fragments behind the Grit Zone and the fan chart, and the old balance-scale and lion-tail engravings. — "reads tacky", 2026-10-30.
- The glossy square plate or frame behind the crest. — 2026-10-29.
- The crest's engraving behind the hero's receipt and behind "Inside the engine". — 2026-11-09.
- The old lion crest; the outer triangles he crossed out in his sketches. — 2026-10-28.
- Photo backdrops (the hero and band Unsplash photos, their scrims and parallax). He chose flat paper and stone. — ME-28, 2026-11-05.
- Card turns, 3D turns, side swings and long settles; the drifting wheel (TOW 3.8, 1.7s); the rubber band past the page's top. — motion sickness, 2026-11-09.
- The "more exaggerated" motion of 2026-11-02 (46px rises, 150px swings, 16° turns). Replaced on 2026-11-09.
- "Yahoo is the slow part" in a loading line ("I cringe"). — 2026-10-19.
- "pp" as a unit, and "OU" or Greek letters on the map's chips. — 2026-10-19.
- The cone's smooth coloured airflow ("not the design I was looking for"), then the whole wind-tunnel flow. — cut in ME-28, 2026-11-05.
- "Cushion" as a visitor-facing word. — "anchor sounds cooler", 2026-11-13.
- The research workshop (Signal Lab, Regime Atlas, Security Master) stays removed: an ISIN cannot be filled honestly from free data. — 2026-10-30.
- Off the one story: the Liquidity, Correlation Watch and Balance tabs, the AI-capex recovery race, and the model-validation drawer. — 2026-11-05.
- On the share image: the star fort and the chevron pilaster (second pass), and a date. — 2026-11-05.
- The preview phrase "727 of 728". — 2026-11-13.
- The FAQ as five long answers standing open in an uneven grid. — 2026-11-17.
- A story that promised "a stock they can count on", or said a replacement flyer was chosen by crash tests. — 2026-11-06.
- From his UI sources (ui-sources skill, 2026-11-17):
  - Watermelon stats cards; numbered FAQ rows ("a numbered list that is not a sequence reads as generated").
  - Kokonut Liquid Glass, Card Flip, Particle and Gradient buttons, and Metric Card.
  - Bklit gradient areas, crosshair, glass pills, Projection Line and Live Line Chart.
  - Motion Primitives Tilt, Spotlight, Glow, Border Trail, Magnetic, Infinite Slider and Text Roll; Text Scramble.
  - A dumbbell chart for "Risk by name" — deferred, "worth a later look".
- Generated-site tells he listed (2026-11-10): gradient blobs, circle icons, purple, floating 3D shapes, identical feature cards, rainbow accents, buzzword copy, three-word headlines, FAQs that restate the question, emoji, vague calls to action, dead footer links, soft corners, no personality. Also spinners, blank screens, no tap feedback, and nothing shown offline.
- AI-writing tells he listed (2026-11-02): em dashes, "It's not X. It's Y", random bold, emoji bullets, title case, one-line paragraphs, pivotal/moreover/serves as.

**Decided against by the project, not by John directly:** a hamburger menu; a cookie consent wall; testimonials or reviews; a map, directions or postal address (a safety risk); an embedded GitHub activity feed; a third-party analytics SDK; a sticky phone call-to-action that could cover the verdict (built later in a form that cannot); arrival effects on button destinations (removed 2026-10-15); the quartic glide easing; hover lifts and floating shadows; a fix for the tab underline's mid-slide retarget (written, measured unneeded, deleted).

---

## History: how the rules got here (from the git log)

The same rules again, read from every commit, with the date John gave each one, the commit that first records it, and every reversal. Where this history and the sections above differ, the sections above hold the final state.

**Sources:**
- All 285 commits in `git log --all`, bodies included. I read all 5,289 lines.
- Every added diff line that names John (`git log -p`). These are mostly test docstrings and CSS comments that quote him word for word.
- `PROGRESS.md`, and the oldest root snapshot (`515416d`), for rules older than the earliest commit, 2026-10-06.

**Notation:**
- Dates are the dates John gave the instruction. Hashes are the first commit that records the rule. A squash-merge such as `7c09e4d` can come before the branch commit it repeats.
- Where a rule was later changed, the line says **→ final:** and gives the final state.

---

### 1. Overall look and design system

- **The whole site follows the share banner's design** (`tools/og_image.html`): high premium, corporate, Citadel-style, minimalist. — "the entire website's design matches the design of our banner"; "high premium, corporate, Citadel-style, minimalist". 2026-11-05, `21e7c48` (ME-28 part 2)
- **Flat paper and flat charcoal-stone blocks**, plus the crest's faint engraving. No photo backdrops, gradients, scrims, parallax or textures. John chose this over the photo backgrounds. 2026-11-05, `21e7c48`
- **Palette** (CLAUDE.md constraint 5, ME-28):
  - paper `#EDE9E3`, ink `#3F3B35`
  - stone `#2E2A25`, stone-deep `#26221E` for the footer
  - 3px gold `#B8955E` cap lines
  - words on stone: `#EDE9E3`, or gold `#C6A26B`
  - bronze `#9A7B4F` for rules only, never for words
  - 2026-11-05, `21e7c48` / `bff4bbb`
- **Background "more in our element design"**: the Slice's watermark is gone. 2026-11-05, `21e7c48`
- **Square corners everywhere.** — "no curved boxes". 2026-10-30, `110432d`. Widened on 2026-11-10 (`b498377`) to every Streamlit control (number box, ticker picker and its tags, selects, checkboxes, toggles, inputs, buttons, tab underline). Exception: radio buttons stay round, because roundness is what marks a radio. The loading bars are square too.
- **Matte and flat.** No glass, sheen, glint, gloss, film grain, gradient-filled numerals, "lacquer" radial gradients or hover lifts. Hover feedback is a colour change only. 2026-11-04, `a93e0ef` (John's design and "AI-slop" list)
- **No glow.** No bronze halo behind charts, no glowing bars, no blurred glow blobs behind the hero. — "glow on every element" read as AI-generated. 2026-11-02, `8d1dc98`
- **No purple, no rainbow accents, no gradient blobs.** 2026-11-10, `b498377`
- **Fewer shades.** Panel subtitles and other near-duplicate greys were merged. 2026-11-04, `a93e0ef`
- **Hairline rules, and an "annual-report rule" under headings.** Section headings are a kicker, a serif title and the annual-report rule. 2026-11-05, `21e7c48`
- **Components follow the banner system:**
  - crisis slabs and `st.metric` as ruled columns
  - CTAs and buttons as flat stone rectangles in the label voice
  - the How-to-use and Book cards as ruled rows
  - 2026-11-05, `21e7c48`
- **Meaningful accents only.** Every accent must reflect a real state; nothing is decoration for its own sake. — "make the website feel alive, do not change too much but add visual details and accent marks that are meaningful". 2026-10-22, `d76f9c2`
  - The accents built: a 0%-to-whole-book hairline scale under the CVaR, with a tick at this value and a faint tick at the last value; "-1.9 points vs your last setting"; "Stressed" and "Short book" marks; a freshness mark; a 1px reading line.
- **More immersive and alive, less AI, more human.** — "make the website feel more immersive, alive, less AI and human". 2026-11-09, `9ede3c5` (the craft list is in section 4)

### 2. Crest, logo, name and engravings

- **The name is spelled "Meliona" everywhere.** — "Meliona is the correct spelling". 2026-10-28, `b889c6d`
  - The one exception is the real mailbox `meleona.support@gmail.com`: Gmail cannot rename an address.
- **New crest** (John's logo mandate, built from his two reference sketches with the six red-X'd outer triangles removed):
  - a hexagon cut by an X: two inward-pointing triangles, top and bottom rhombuses, and a keystone rhombus
  - set on a charcoal disc with three rings that fade outward
  - flat and geometric; pieces never touch
  - 2026-10-28, `2dc9ee8`
- **Crest refinements** (2026-10-29, `554af23`):
  - beige pieces
  - no glossy square plate or frame around it
  - perfectly mirror-symmetric
  - its rings ripple smoothly from inside to outside while hovered, and settle at rest when the pointer leaves instead of snapping
  - the ripple is off under reduced motion
- **Ripple 15% more noticeable.** 2026-11-04, `82bedf4`
- **Replace the old lion everywhere, including the browser tab.** 2026-10-29, `50de216`; tab fixed for good 2026-11-05, `a5c2fc4`
  - The tab icon is served at a content-hashed address so browsers drop the cached lion.
- **Tab icon and logo finish.** — "premium, make it look expensive": lacquered disc, a brushed-gold bezel, satin ivory pieces, dark bronze rings, every gradient vertical so the mark stays symmetric. 2026-11-05, `a5c2fc4`
- **No watermark logos.** The crest fragments behind the Grit Zone and the fan chart were removed. — "a watermark logo reads tacky". 2026-10-30, `110432d`. The crest lives in the hero, once.
  - → **final (ME-28):** the crest's faint gold engraving (outline at 10%, hairline) is the banner's one ornament, used sparingly. 2026-11-05, `21e7c48`
- **Never behind the hero's receipt** ("Inside the engine"). The engraving appears once, in the dark band only. — "remove the logo in the background". 2026-11-09, `a9cb3b9`
- **Older:** the Nordic rune engravings were removed at John's call because they "read as ornament noise against the institutional register". 2026-07-09, recorded in `515416d` `static/app.css`

### 3. Photographs

- **No photo backdrops.** The hero and dark-band photographs and the Gungnir topography were removed. 2026-11-05, `21e7c48`
  - Earlier state: the band photo was given a warm "dusk-bronze city" duotone "per John's references", with parallax. Both were removed in ME-28.
- **The only photographs are John's own two:**
  - the About portrait: "a photo of me where my LinkedIn, Handshake and GitHub can be clicked on". 2026-11-05, `d23da85`
  - a second photo beside his story, "another perspective when I'm not in my suit". 2026-11-05, `240a5d4`
  - Both are real `<img>`s with alt text, cropped with one global grade, no retouching, no EXIF.
- **The photos are uncovered by a mask as they arrive.** 2026-11-06, `b60ba09`

### 4. Type, capitals and craft

- **Serif (Georgia) for words.** No sans-serif headings (CLAUDE.md).
- **Capitals only in the banner's label voice:** bold Helvetica, 12–14px, tracked .2em. Used for kickers, labels over numbers, buttons and tabs. 2026-11-05, `21e7c48`
  - Earlier rule (2026-11-04, `a93e0ef`): capitals only on the verdict label. Superseded by the label voice.
- **No negative tracking.** Type is set at its own spacing; tight kerning is "the generated-page look". 2026-11-04, `a93e0ef`
  - Restated on 2026-11-09 (`07e6a77`): Streamlit's -0.005em heading rule was overridden.
- **No words shouted in capitals** (NOT, SEE, RISK, END, FULL, MORE…). **No italics, no pills, no code breadcrumbs.** 2026-11-04, `a93e0ef`; map copy 2026-11-02, `ec389b5`
- **No numbered labels.** "01 · Universe", "02 · Allocation" and the plaque's "block 01/02" were removed. 2026-11-04, `a93e0ef` (`5c58767` notes "the numbering came off")
- **Sentence case, not title case**, for labels. 2026-11-02, `493f428` / `ec389b5`
- **Craft list** — "kerning, optical center, tabular numbers, layout shift, tracking, optimistic update, x-height, touch target, leading, origin aware animation, OKLCH, widow, safe area, stagger, line length, affordance, combo box, interruptible animation, shared element transition". 2026-11-09, `9ede3c5`. Implemented as:
  - kerned text
  - tabular lining figures everywhere, the map included
  - `font-size-adjust` to keep the x-height
  - prose at 68ch that wraps `pretty` (no widows); headings `balance`
  - OKLCH state tints after a hex fallback
  - `viewport-fit=cover` with safe-area gutters
  - 44px touch targets
  - the hero's words lifted to the optical centre
  - hover colour that opens from the pointer's entry point
  - an optimistic "Updating" rail on the press itself
  - stale numbers dimmed to .72, never blanked
  - the verdict and hero receipt counting up to the server's exact text
- **A slider's figure never wraps** ("20" once stood as a 2 over a 0). The Book's cards are set at 68ch. 2026-11-09, `a9cb3b9`
- **12px minimum text and rem font sizes.** 2026-11-04, `a93e0ef`

### 5. Colour contrast and accessibility

- **Text colours must clear WCAG AA (4.5:1) on the ground they sit on.** Decorative bronze is allowed only for rules. CLAUDE.md constraint 5. Enforced on the map from 2026-10-20 (`74c7d3e`) and on captions after their opacity (2026-10-22, `faa4d32`).
- **One focus ring:** 2px, offset 3px, `#6A5030` on beige and `#C6A26B` on dark grounds. 2026-10-22, `1fe193b`
- **Reduced motion is honoured, including the JavaScript glide**, which then lands at once. This was John's call on the council's flagged gap. 2026-10-19, `c6744e4`
  - (His "missing motion" on 2026-11-04 was Windows' animation setting being off — by design, `75efe69`.)

### 6. Page structure and story

- **Lead with one number.** One headline CVaR verdict and one sentence up top; everything else collapsed (CLAUDE.md constraint 3).
- **Cut what the risk engine does not need; keep what carries its identity: grit, and the linkages between names.** 2026-10-29, `5221939`
  - The research workshop (Signal Lab, Regime Atlas, Security Master), the dense paragraph under the Slice's equation, and the hero jargon were removed.
  - Data Quality and Lineage moved into one closed drawer, "Where the numbers come from".
  - The Workshop stays removed (2026-10-30, `499059a`).
- **One story** — a bad year's loss, what real crashes did, which names hold up (grit), and how steady anchors cushion high-flyers. 2026-11-05, `57d1944` (ME-28 part 1)
  - Removed: the cone's airflow, the Liquidity / Correlation Watch / Balance tabs, the AI-capex recovery race, and Risk Breakdown's model-validation drawer.
  - Tab strip: Risk Topology, Risk Breakdown, Grit Zone, Crisis Conviction.
- **Remove anything boring, irrelevant or bloated; the Risk Topology map stays whole.** — "act as a new user, remove anything boring, irrelevant or bloated, keep what needs to be kept". 2026-11-12, `7c09e4d`
- **The map shows once.** Nothing above the tab strip may change the number of top-level elements. John saw the map twice after switching to MAG-7. 2026-10-19, `516d4c1`
- **Drawers never snap shut on the first change.** 2026-10-15, `4539e63` (recruiter walk; not a quoted John rule)
- **The page's close, in order:** About the builder, then John's story, then five questions, then the contact form. 2026-11-05, `d23da85` / `240a5d4`

### 7. Hero

- **Plain title:** the product name, not "Grit. Discipline. Evidence.". The boot skeleton is built from the hero itself. 2026-10-06, `954b1a0` (owner commit; no quote)
- **No jargon in the hero.** Hero tiles are read from the engine's constants. 2026-10-29, `5221939`
- **The four boxes under the hero must trace to a source**, never be hallucinated. 2026-10-30, `499059a`
- **The hero button says where it goes:** "Start with the Grit Zone" (it was "Explore what we do"). 2026-11-02, `493f428`
- **Hero layout (ME-28):** flat paper with the crest, a kicker, the name in Georgia 700, the annual-report rule, the sentence and the button. The engine facts sit on a charcoal receipt block (gold cap line, gold rule, label/value rows). 2026-11-05, `21e7c48`
- **Contact CTA above the fold:** a quiet "Contact John" link beside the button, which glides to the form. 2026-11-05, `d23da85`
- **Earlier:** hero stat tiles "fully solid" — "fading them read unprofessional" (`515416d`). In 2026-10-30 (`110432d`) they became matte rectangles; later a receipt.

### 8. Motion: block arrivals (changed many times — final state first)

**Final, 2026-11-13 (`aa5e3ac`)** — "when scrolling down, I do not see the animations, headers, and body of line text coming in from the left side or the right side":
- Each block must be seen arriving, on screen.
- Headings slide in from the left.
- On screens wider than 760px, a block in the first or last of a row of columns, and the text beside John's photos, comes in from its own side.
- Everything else rises.
- Distances and timing: 28px / 40px over .8s, with a fade.
- An arrival starts 10% inside the bottom edge; a block the reader stopped short of starts after 250ms.
- No arrival plays during the first load.
- Still nothing turns or zooms.

**History:**
- **2026-08-26 (PROGRESS, "Guided descent")** — "guiding them, a sense of calmness", "like an airline commercial". The CTA arrows became drawn SVG marks; the glide was set to 1.5s.
- **2026-10-30, `396a164`** — "Citadel-grade" motion: trigger-based (IntersectionObserver), opacity and transform only (GPU), an expo-out curve, staggered, no flash of the finished page, and a page that works without JavaScript.
  - The first load lifted the crest and tiles from face-down (`110432d`). → Removed 2026-11-10.
- **2026-11-02, `84fd19c`** — "more exaggerated … more present … everywhere": left blocks from the left, right from the right, middle "turned face up like a card", every block including the engine. → Reversed 2026-11-09.
- **2026-11-04, `82bedf4`** — a wide block must never freeze mid-turn (John's screenshot of the Book's sentence as a sliver).
- **2026-11-05, `9283e24`** — what a reader opens (a drawer body or tab panel) is never given an arrival; iPhones and touch screens move flat. From John's iPhone screenshots of frozen, squeezed, sideways blocks.
- **2026-11-06, `a3e34d7`** — nothing may stop part-way or sit out of place at the foot of the screen. Heading rules draw once, never scroll-linked.
- **2026-11-09, `a9cb3b9`** — the side swings, card turns and long settles "gave me motion sickness and unfocused my eyes". Arrivals became one calm 16px rise and fade over .6s. → Superseded on 2026-11-13 by gentle side entries (still no turns or zooms).
- **2026-11-10, `b498377`** — the hero's first load only rises and fades: no 3D tip of the crest, no slide.

### 9. Motion vocabulary

- **Twenty motion rules "for a premium, corporate feel"** (2026-11-06, `b60ba09`):
  - entrances ease out; on-screen moves ease in-out
  - dropdowns 150–250ms; popovers start at .95 and grow from, and shrink back into, their trigger
  - exits about 20% shorter
  - list rows 30ms apart
  - a press to .97
  - a dragged knob stretched 12% and never tweened
  - masks for reveals (John's photos)
  - a success pulse
  - no bounce: no curve leaves 0..1
- **"use arcs for object movement":** the CVaR tick hops an arc only when it really moves. 2026-11-06, `b60ba09`
- **Never at the cost of the page's own motion.** A heavy effect must not freeze buttons or arrivals (the cone tunnel did). 2026-11-04, `f03f20f`
- **A first-visit click plus a key or the wheel must never paint a gold block over the page.** — "when pressing S or any key a giant block from the left side would appear slowly … the yellow block would get bigger and bigger". 2026-11-06, `dd84358`

### 10. Scrolling and the mouse wheel

- **2026-11-02 (`84fd19c`): the wheel glides.** The scroll felt "normal".
- **2026-11-04 (`75efe69`): heavier.** — "I want the scrolling to feel heavier … like a boat being tugged". A critically damped tow line, TOW 4.6.
- **2026-11-06 (`b60ba09`): heavier still, with a rubber band.** — "heavy … slightly delayed … more fluid". TOW 3.8, plus a rubber band at the page ends. → Reversed.
- **2026-11-06 (`8920cbf`): over the map too.** — "Throughout the whole site, the scrolling was nice and smooth, but once it got to the map, it went back to the static state." The glide continues over the Risk Topology map (and its bottom edge, fixed 2026-11-12/13).
- **2026-11-09 (`a9cb3b9`) — final:** TOW 3.8 drifted ~1.7s and caused motion sickness, and forcing past the top showed a gap. The tow now settles in about 0.6s (TOW 10). No rubber band: the page ends are hard.
- **The tow always stands aside** for a button's glide, for anything that scrolls on its own, and for touch and keys.

### 11. Buttons and in-page glides

- **Every button glides; it never jumps.**
  - "sometimes the button does not transition and instead does a non-transition presentation" (2026-10-19, `e8f750f`)
  - "the buttons guarantee 100% transition, sometimes it does not" (2026-10-22, `49b7062`)
  - "every button must glide the reader down, never jump" (2026-10-30, `499059a`)
- **The glide must not lag.** — "very laggy and buggy". One flight at a time, following a moving target. 2026-10-19, `9f0c9ba`
- **A button's arrival is the scroll itself.** No fade or slide of the destination (a "slide change"), and an even pace. 2026-10-15, `8145ea3`
- **Buttons must "feel like they did something".** Tabs, radios, checkboxes, the footer index and text links all sink on press, iPhones included. 2026-11-10, `5079665`
- **Buttons and marks look and act alike;** no vague CTAs. 2026-10-22, `1fe193b`; 2026-11-10, `b498377`
- **Buttons and fields take the square corners and the label voice.** 2026-11-05, `d23da85`

### 12. Loading states and app feel

- **A skeleton loader from the first frame.** — "When opening the website, I was not met with a skeleton loader." 2026-10-19, `60f2cdb`
- **A clear, moving loading sign:** the bronze rail and the "Updating…" tag. — "the loading wheel has no animation or no clear noticeable visual that it is loading". 2026-10-19, `591d3bc`
- **Every slow pull says what it is doing.** The Grit Zone "looked stalled, as if the project crashed". 2026-10-19, `24513ef`
- **Spinner text is a few calm words, with no excuse for the wait and no naming of the feed.** — "Remove the 'yahoo is the slow part', I cringe looking at that." 2026-10-19, `c4561aa`
- **Skeletons, not spinners; never a blank first screen; tap feedback; offline support** (a notice when the connection drops, and an offline page). — "blank screens and spinners" are a tell. 2026-11-10, `5079665`
- **Optimistic update:** a press is answered at once. 2026-11-09, `9ede3c5`
- **Speed asks** (performance, but visitor-felt): "fix the slow first basket switch", "make typed-in baskets load faster too", "fix the crisis pair slow download". 2026-10-20, `a61dc86` / `d7fb368` / `554e694`

### 13. Drawers (expanders) and tabs

**Final drawer, 2026-11-05 (`4853323`)** — "clean, minimal, corporate, and most importantly visually appealing":
- the old hairline box, no fill
- the label in bold serif on the left
- the chevron in text bronze on the right edge, with room in the header
- hover turns the frame charcoal; open keeps it charcoal, the header on a hairline

How it got there (all 2026-11-05):
1. **Stone plaques** (`9283e24`) — "make the drop down / tabs more noticeable, using our design direction and color scheme and geometric patterns". → Turned down.
2. **Beige plaques** (`25afd50`) — "don't make it a dark color, keep it … a beige but come up with a design that makes it noticeable and relevant to the overall design". → Turned down.
3. **Hairline box with a charcoal "key" drawing along the top edge** (`d9965f3`) — "the old designs were good but bold the words … keeping the same elements, how can we uplift this". → Turned down: "the partial line on top looks a little tacky".
4. **Final** (`4853323`), as above.

**Tabs, final:** the label voice with a 3px charcoal underline — "the old design, kept". 2026-11-05, `d9965f3`. The stone band and beige strip versions were reverted.

### 14. Charts, the cone and the headline

- **Charts:** no fill, hairline axes, quiet tick and title ink, a stone hover receipt, gold/bronze/stone bars only. 2026-11-05, `21e7c48`
- **The cone (fan chart) — airflow history, all reversed:**
  - 2026-11-04, `82bedf4`: smoke blown through it, many colours that "must not be random … correlate with the engine and the cumulative return, along with its trading days".
  - 2026-11-04, `c476dbb`: "Do not generate a static or generic looping animation that mimics a fluid … Every line, color, velocity vector, and animation timestep must be directly driven by … the provided data array"; FluidX3D's engineering look; red only where the flow hits the data; a Verification Overlay; no glass, gloss, glow or blur; not pixelated.
  - 2026-11-04, `66ec557`: the smooth field was "not the design I was looking for"; he wanted FluidX3D grid cells.
  - The chart key "Air speed, x inflow" meant nothing beside trading data; it must use financial terms. 2026-11-04, `75efe69`
  - → **Final:** all cone airflow was cut in the ME-28 story cut (2026-11-05, `57d1944`). The cone stays flat, with a short plain caption.
- **Headline label:** "Bad-year loss - 1-year CVaR (95%)". 2026-10-29, `5221939`. CVaR is explained as "a bad year (the worst 5 of every 100 simulated years)". 2026-11-05, `2c38d50`

### 15. Risk Topology map

- **It must fit an iPhone.** John saw it cut off: full-width frame, map first, nothing sideways. 2026-10-17, `24be9c7`
- **The Explain button must work.** — "pressing the 'explain the map' button does not work or direct me anywhere, its a dead button". It opens a glossary at every width. 2026-10-19, `9f0c9ba`
- **Every short form has to be explained.** — "I don't know what OU is … add a legend in the topology map that explains all the suffixes and shortened phrases". No "OU" on the tiles; chips in words. 2026-10-19, `9f0c9ba`
- **No "pp".** — "find a better way to show status than 'pp', I have no idea what that is". It reads "16.8 points shallower"; percentage points are never shown as a misleading %. 2026-10-19, `9f0c9ba`
- **Chips wrap at every width** and never run outside their section ("overlapping outside its section" on his laptop). 2026-10-19, `9f0c9ba`
- **Swiss-grid map:** square matte panels, a framed and ticked plot, rhombus marks, square toggles. The probability rings stay clipped to the plot ("expanding outwards on the graph"). 2026-10-30, `110432d`
  - The faint grain added then was removed on 2026-11-04 (`a93e0ef`): film grain is a tell.
- **The map's every dot and line must be real.** 2026-10-30, `499059a`
- **The map's model note leads with a plain paragraph;** the full model statement folds under "The maths, for specialists". 2026-11-09, `79b6067`
- **Pair names read "META · AVGO"** (a middot), never a spaced dash. 2026-11-02, `a6b74f3`

### 16. Grit Zone, the Slice, Crisis Conviction and the Book

- **The Grit Zone's three pillars sit in one even row** (one column on a phone), with no orphan. 2026-11-02, `8d1dc98`
- **Every Grit Zone description is accurate and traced to data.** — "all the descriptions about the grit zone consistency resilience and recovery … accurate and traced from a data source". 2026-11-04, `8b27727`
- **The Slice keeps its flyer-and-anchor sketch and the w1σ1 = w2σ2 equation;** the paragraph under it was cut. 2026-10-29, `5221939`
  - Earlier, the circle-and-line motif was "drawn to John's sketch" (`515416d`).
- **The Book keeps its LEADS (grit) and ANCHOR (pairing) cards on the page;** the no-role cards and finer settings sit in one drawer. 2026-10-29, `5221939`
- **"no role", not "left out",** for a held name. 2026-10-22, `9b62b62` (council; no quote)

### 17. Words, tone and honesty

- **No hallucination: every sentence follows its numbers.** — "ensure that there is no hallucination". 2026-10-22, `5693e2a`
- **Every claim on the page matches the engine; nothing argues for a trade.** — "if a description from the top doesn't match the description at the bottom, figure out why … rewrite it accurate to the data or remove it." 2026-11-06, `0d7e811`
- **Remove "all elements of AI generic slop"** (2026-11-02, `493f428`; map copy `ec389b5`):
  - no em or en dashes, and no spaced hyphens doing a dash's job; a middot in titles
  - no "It's not X. It's Y" staging contrasts
  - no random bold (bold only on figures, legend keys and defined terms)
  - no emoji bullets, no title-case headings, no one-line paragraphs
  - no "pivotal / moreover / serves as / genuinely / actually / Deep dive"
  - no restating closers
  - the honest negatives stay: not a forecast, not investment advice
- **No word "honest" in the copy, no marketing eyebrows.** 2026-11-04, `a93e0ef` ("honest" appeared nine times); eyebrows "The Innovation" / "The Conviction" removed 2026-11-02, `493f428`
- **No buzzwords, no three-word headlines, headings that say something, FAQs that don't restate the question, no emoji.** 2026-11-10, `b498377`
  - "Before you ask" → "What people ask before trusting a number"; "Contact" → "A question, a role, or a number that looks wrong".
- **Plain words first for every control**, with the method's name in brackets for interviews. — "simpler and easy for a user with limited technical skills". 2026-11-05, `6a729d5`
  - Examples: "How the names move together: Steady (Ledoit-Wolf) / Plain history (sample) / Quick to react (EWMA)".
- **Simplify for non-technical users.** — "i got bored reading this, simplify this for non technical users ... fun to read and they understand 100%". Applied to the Book's sentences, captions and the map note. 2026-11-09, `79b6067`
- **Explain EWMA in plain words wherever it shows.** — "explain EWMA in plain words too". 2026-11-12, `7c09e4d`
- **Read aloud in one breath:** no sentence over 24 words, an average of 13 or under, for the story and answers. 2026-11-12, `7c09e4d`
- **Every caption, list item or note is 45 words or fewer,** in every tab and drawer. 2026-11-12, `7c09e4d`
- **Nothing contradictory:** say where each return figure comes from (simulated vs real days). 2026-11-12, `7c09e4d`
- **Promise nothing; be humble.** — "no elements of us guaranteeing anything ... be humble". 2026-11-13, `c361912`
  - → **final:** "keep John replies within 2 days, keep anyone can check every number, keep every number is computed, keep a barrier is fixed as a defect ... remain confident in your skills, even though there are cons. Have confidence but have humbleness." 2026-11-13, `9cfcb05`
  - The confident lines stay. Each model's limits are said as a fact ("Like any model, it simplifies…"). Readers are asked to report mistakes. No promised outcome (guarantee, risk-free…).
- **"anchor", never "cushion",** anywhere a visitor reads. — "anywhere it says cushion, replace it with anchor ... anchor sounds cooler." 2026-11-13, `3b444ab`
- **Honest labelling, no overclaiming** (CLAUDE.md constraint 2): "live end-of-day", not "real-time"; scenarios "replay actual returns"; excluded assets disclosed.
  - "End of day means end of day": a data platform "pulled accurately by end of day". 2026-11-12, `0da712f`

### 18. Phones and tablets

- **The site must work on every phone and tablet.** 2026-10-17, `9255017` (device_check on 13 devices)
- **The map fits an iPhone.** 2026-10-17, `24be9c7`
- **Phone UX fixes** (2026-11-04, `a93e0ef`):
  - 44px touch targets
  - 16px phone inputs (no iOS zoom)
  - 20px phone gutters, with the map 8px from the edges
  - the preset kept in the address
  - names on the map's switches and pressed states on its buttons
- **A sticky phone CTA,** "Run the risk engine". It shows only between the hero and the engine, so it never covers the verdict. 2026-11-04, `c6e7b25` (John's launch list)
- **Nothing freezes when a drawer opens on an iPhone.** 2026-11-05, `9283e24`
- **Safe-area gutters and 44px targets.** 2026-11-09, `9ede3c5`

### 19. Footer

- **The footer is stone-deep with a gold cap,** running to the page's foot. 2026-11-05, `21e7c48`
- **It names Privacy, Terms and Source code on GitHub;** links get 44px spacing on touch. 2026-11-04, `c6e7b25`
- **One contents index, not three identical feature cards;** no dead footer links. 2026-11-10, `b498377`
  - Dead "where to next" links were already fixed on 2026-10-15 (`8145ea3`).
- **The profile marks appear in the footer too.** 2026-11-05, `d23da85`

### 20. About, story, FAQ and contact

- **About the builder** sits on a stone block: a portrait and links to LinkedIn, GitHub and Handshake (monochrome marks, new tab, 44px). 2026-11-05, `d23da85`
- **Bio:**
  - "Computer Information Systems student specializing in AI & Analytics". 2026-11-05, `9283e24`
  - → "in his own voice, deeply passionate about building tools with AI, and still corporate and clean" ("Hello! I am John…"). 2026-11-09, `a9cb3b9`
  - → **final:** the humble additions of 2026-11-13 (`c361912` / `9cfcb05`).
- **John's story** — "a story place where we explain why we wanted to create this", near LinkedIn and the contact form. 2026-11-05, `240a5d4`
  - Mention his dad lightly, then speak to everyone with the same problem.
  - Covers grit and the AI-stock linkage.
- **The story gives evidence, not a promise, and must agree with the FAQ.** — "we said the risk engine is not financial advice ... but in my story I said I wanted to help people like my dad. Does this contradict?" 2026-11-06, `4e49502`
  - Pull quote → "Not the best every year. The one that keeps getting back up."
- **The story was boring read aloud; make it shorter and punchier, with more drive.** 2026-11-12, `7c09e4d`
  - Title: "My dad asked one question. I built an engine around it."
- **Five plain questions** on the page, also served as FAQPage JSON-LD. 2026-11-05, `d23da85`
- **Contact form:** a custom form for a CTA above the fold, plus a thank-you page. Nothing is sent, logged or stored. 2026-11-05, `d23da85` / `fb0bc63`
  - Contact mail goes to John's own Gmail — "I'm more active there" — with LinkedIn as a second way. 2026-11-05, `9283e24`
  - List both addresses, each with its job: "adding both, our official email and Meliona email". 2026-11-05, `25afd50`
- **Reply time:** "John replies within 2 business days".
  - → Changed to "aims to reply" (`c361912`), then **restored** to "replies" at John's request (2026-11-13, `9cfcb05`).
- **Clickable email and phone, success messages, no placeholder text.** 2026-11-04, `bb0a0a0`
  - Support phone as tap-to-call; "Clear this session's data" shows a success message after the reload.

### 21. Link preview, share banner and LinkedIn cover

- **The link preview must not look generic.** 2026-10-29, `50de216`
  - The crest, the name, one sentence and a ruled receipt of a real live audit.
  - No fan chart, stat tiles, eyebrow caps or italic subtitle.
- **Banner** (2026-11-05, `4cbd67d`):
  - no date ("Live audit on Yahoo Finance data")
  - nothing that reads as AI design
  - the site's colours and type; Inter removed
  - "weight, stability and defense" through Swiss discipline: a 12-column grid, primitive shapes, chevrons, real architecture
- **Then, 2026-11-05:**
  - `a51fd1a`: the star-fort lines and the chevron pilaster were removed; the crest stays faded into the background.
  - `82abef2`: "keep it small" — the small, faint crest (radius 79, 10% gold), not the large one.
  - `6dd56b4`: "sleek, modern, corporate and minimal, nothing childish beyond the crests". One annual-report hairline with a heavier key replaced the short rule and bronze triangle; the plinth's joint ticks were removed.
- **The preview quotes the newest live audit.** "727 of 728 checks passed" read as one failure. Now "0 of 832 checks failed". 2026-11-13, `1d3a3f8`
- **LinkedIn cover in the banner's design** (1584x396; the words start at 460px to clear the profile photo). 2026-11-05, `a4353b6`
  - Updated to the same receipt on 2026-11-13 (`83d2095`): "The claim line stays as John wants it."

### 22. Launch items a visitor sees (John's 2026-11-04 launch list, `c6e7b25`)

- **An informational cookie notice:** the only cookie is the anti-forgery token, so there is no consent wall. 2026-11-04, `c6e7b25`
- **The phone CTA dock**, the footer source link and touch spacing (sections 18–19). 2026-11-04, `c6e7b25`

---

### Turned down by John

| Rejected design | His words | Date / hash |
|---|---|---|
| Nordic rune engravings | read as "ornament noise against the institutional register" | 2026-07-09, `515416d` comment |
| Faded hero stat tiles | "fading them read unprofessional" | pre-Oct, `515416d` comment |
| Glossy square plate/frame around the crest | wanted no plate | 2026-10-29, `554af23` |
| Old lion crest, anywhere including the browser tab | replace it everywhere | 2026-10-28/29 `2dc9ee8`/`50de216`; 2026-11-05 `a5c2fc4` |
| Watermark crest logos behind sections | "reads tacky" | 2026-10-30, `110432d` |
| Curved/rounded boxes, soft corners on everything | "no curved boxes"; "soft corner radius on everything" | 2026-10-30 `110432d`; 2026-11-10 `b498377` |
| Glow: chart halos, glowing bars, blurred blobs behind the hero | "glow on every element" | 2026-11-02, `8d1dc98` |
| Vague hero CTA "Explore what we do" | — | 2026-11-02, `493f428` |
| Marketing eyebrows ("The Innovation", "The Conviction") | — | 2026-11-02, `493f428` |
| Rounded cards with a thick coloured side | — | 2026-11-02, `493f428` |
| Em dashes and spaced hyphens; "It's not X. It's Y"; random bold; emoji bullets; title case; one-line paragraphs; pivotal/moreover/serves as | "all elements of AI generic slop" | 2026-11-02, `493f428` |
| Negative tracking; tracked capitals on every label; gloss and glass; film grain on the map; numbered "01 ·" sections and block numbers; "honest" in the copy; shouted capitals; italics; pills; code breadcrumbs; hover lifts; decorative gradients | design/AI-slop list | 2026-11-04, `a93e0ef` |
| The cone's smooth coloured field; a "generic looping animation that mimics a fluid"; glass, gloss, glow, blur, pixelation | "not the design I was looking for" | 2026-11-04, `c476dbb`/`66ec557` |
| The chart key "Air speed, x inflow" | meant nothing next to trading data | 2026-11-04, `75efe69` |
| The whole cone airflow, Liquidity / Correlation Watch / Balance tabs, AI-capex race, model-validation drawer | the page tells one story | 2026-11-05, `57d1944` |
| Photo backdrops, scrims, parallax, the Slice's watermark | chose flat charcoal and beige blocks | 2026-11-05, `21e7c48` |
| Banner: the date | — | 2026-11-05, `4cbd67d` |
| Banner: star-fort lines and chevron pilaster | — | 2026-11-05, `a51fd1a` |
| Banner: the large crest | "keep it small" | 2026-11-05, `82abef2` |
| Banner: short rule, bronze triangle, plinth ticks | "nothing childish beyond the crests" | 2026-11-05, `6dd56b4` |
| Banner: anything that reads as AI design | — | 2026-11-05, `4cbd67d` |
| Stone-plaque drawers and a dark tab strip | "don't make it a dark color" | 2026-11-05, `25afd50` |
| Beige-plaque drawers | "not something I am looking for" | 2026-11-05, `d9965f3` |
| A partial rule / key on the drawer's top edge | "looks a little tacky" | 2026-11-05, `4853323` |
| Side swings, card turns, 3D perspective, zooms, long settles | "gave me motion sickness and unfocused my eyes" | 2026-11-09, `a9cb3b9` |
| 3D tip of the crest on first load; "floating 3D" | — | 2026-11-10, `b498377` |
| Rubber band past the page ends | showed a gap at the top | 2026-11-09, `a9cb3b9` |
| The slow wheel tow, TOW 3.8 | drifted ~1.7s; motion sick | 2026-11-09, `a9cb3b9` |
| The crest engraving behind the hero's receipt ("Inside the engine") | "remove the logo in the background" | 2026-11-09, `a9cb3b9` |
| Gradient blobs, circle icons (circled "?", round freshness dot), purple, rainbow accents, identical feature cards, buzzwords, three-word headlines, FAQs restating the question, emoji, vague CTAs, dead footer links | — | 2026-11-10, `b498377` |
| Spinners and blank screens | — | 2026-11-10, `5079665` |
| The spinner line "Yahoo is the slow part" | "I cringe looking at that" | 2026-10-19, `c4561aa` |
| "pp" as a unit | "I have no idea what that is" | 2026-10-19, `9f0c9ba` |
| "OU" and unexplained short forms on the map | — | 2026-10-19, `9f0c9ba` |
| A dead "Explain the map" button | — | 2026-10-19, `9f0c9ba` |
| A button that jumps instead of gliding; a laggy glide | — | 2026-10-19/22/30 |
| The story's promises ("a stock they can count on", "back up after every fall", "worth holding") | contradicted the FAQ | 2026-11-06, `4e49502` |
| Text arguing for a trade ("The hardest trade is the one history rewards") | — | 2026-11-06, `0d7e811` |
| Boring, bloated copy; long sentences in the story and FAQ | "I already got bored" | 2026-11-12, `7c09e4d` |
| The word "cushion" | "anchor sounds cooler" | 2026-11-13, `3b444ab` |
| Any guarantee or promised outcome | — | 2026-11-13, `c361912` |
| Over-humbling his confident lines (e.g. "aims to reply") | keep them | 2026-11-13, `9cfcb05` |
| "727 of 728 checks passed" on the preview | reads as one failure | 2026-11-13, `1d3a3f8` |

### Rules that were later reversed (final state shown above)

- Exaggerated arrivals that swing and turn like a card (2026-11-02) → calm rise only (2026-11-09) → gentle side entries with no turns (2026-11-13).
- Wheel tow: 9% ease → TOW 4.6 → 3.8 with a rubber band → **TOW 10, hard ends**.
- Drawers: stone plaque → beige plaque → top-edge key → **clean hairline box, chevron on the right**.
- Tabs: stone → beige → **label voice with a charcoal underline**.
- Capitals only on the verdict label (2026-11-04) → **capitals only in the banner's label voice** (2026-11-05).
- Photo backdrops with a warm duotone → **no backdrops; only John's two photos**.
- Watermark crests removed (2026-10-30) → **one faint engraving in the dark band only**, never behind the hero receipt.
- Cone smoke and airflow (2026-11-04) → **cut** (2026-11-05).
- Liquidity tab added to the strip (2026-10-29) → **removed** (2026-11-05).
- "aims to reply" → **"replies within 2 business days"**.
- Bio: "Data Analytics student" → CIS / AI & Analytics → **first-person, passionate, humble**.

### Gaps and things worth knowing

- **Quotes from code, not commit messages.** Several quotes (the drawer and tab quotes, "use arcs for object movement", "premium, make it look expensive", the EWMA, pp and OU quotes) appear in test docstrings and CSS comments added by the cited commits, not in the commit messages themselves.
- **Rules older than the earliest commit.** The commit history starts on 2026-10-06. The runes, faded tiles, dusk-bronze duotone and "airline commercial" glide come from the root snapshot `515416d` (the `static/app.css` and `main.py` comments) and from `PROGRESS.md`.
- **Unquoted rules.** A few rules are marked "no quote": they came from councils or audits and were merged by John, but no commit quotes him for them.
- **Repo state.** No files were changed.
