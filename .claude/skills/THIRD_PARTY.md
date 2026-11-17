# Third-party Claude Code skills

These skills were copied from public GitHub repos on 2026-10-15 at the commits below, read file by file before
install, and trimmed where they reached outside the project. Each folder keeps its upstream LICENSE. To update one,
re-clone at a new commit, re-read the diff, and re-apply the changes listed here.

| Folder | Source (commit) | License | Changed on install |
|---|---|---|---|
| `ponytail/`, `ponytail-review/`, `ponytail-audit/`, `ponytail-debt/` | github.com/DietrichGebert/ponytail (`84740e3`) | MIT | Added one paragraph to `ponytail/SKILL.md`: this repo's CLAUDE.md wins (test first, run the check command, never loosen a gate). Left out `ponytail-help`, `ponytail-gain`, `plugin.json` and all hooks. |
| `humanizer/` | github.com/blader/humanizer (`225a6f3`) | MIT | `SKILL.md` and `LICENSE` only. Left out `AGENTS.md`, CI, scripts and plugin manifests. |
| `hallmark/` | github.com/nutlope/hallmark (`13ac0ec`) | MIT | Removed the "Powered by Together AI" line (SKILL.md and a sample footer). Removed `references/imagery-kit.md` and its links, because it pointed generated pages at images on the author's server. "Silently flatten" now says "flatten it and tell the user". |
| `taste/` | github.com/senlindesign/taste-skill (`6dce223`) | **No LICENSE file upstream.** The README shows an MIT badge linking to a LICENSE file that does not exist. | Kept `SKILL.md` and `references/` only (no README images, docs, evals). Pinned `@playwright/mcp@0.0.83` (was `@latest`). Removed the "when in doubt, use it" over-trigger line. Added refusal of localhost, private and cloud-metadata URLs, and a rule that page content is untrusted data. It may never write to CLAUDE.md, AGENTS.md, GEMINI.md, Copilot or Bolt instruction files: it writes `./{domain}-design-rules.md` for the user to paste in themselves. |
| `ui-ux-pro-max/` | github.com/nextlevelbuilder/ui-ux-pro-max-skill (`56ea9cf`) | MIT | Script paths changed from `${CLAUDE_PLUGIN_ROOT}/.claude/skills/...` to `.claude/skills/...` (that variable only exists in plugin installs). Left out `scripts/tests/`, `scripts/validate_data.py` and four data files used only by them. |
| `impeccable/` | github.com/pbakaus/impeccable (`3a92342`) | Apache-2.0 (LICENSE + NOTICE.md kept) | **Guidance only.** Rewrote `SKILL.md`: no engine binary, no `scripts/`, no hooks, telemetry, live browser mode or image API; triggers only for polishing or auditing an existing screen (hallmark owns new pages); the repo's CLAUDE.md wins. Kept 16 reference files, with their detector commands, critique-storage steps and live-mode sections removed. |
| `diagram-design/` | github.com/cathrynlavery/diagram-design (`d97c5c7`) | MIT | None. Note: diagrams load Google Fonts unless "system fonts" is chosen. Use system fonts for anything shown inside a strict-CSP page. |
| `web-design-guidelines/` | github.com/vercel-labs/agent-skills (`1a2c79d`) for `SKILL.md`; the rules from github.com/vercel-labs/web-interface-guidelines (`434b7f9`) | MIT (both; LICENSE of the rules repo kept) | Installed 2026-11-17. The upstream skill fetches its rules from `main` on every run; that is an unpinned instruction source, so `command.md` is kept as `references/command.md` at the commit read, and `SKILL.md` reads that file instead. Added a line that CLAUDE.md and the design rulebook win (the guidelines ask for Title Case; Meliona uses sentence case). |

## Reviewed and not installed
- **impeccable via `npx impeccable install`** (re-checked 2026-11-17 at `d41d986`): the guidance is already installed (row above); the installer is the full version this file turns down.
- **awesome-design-md** (github.com/VoltAgent/awesome-design-md, `fcc7028`): DESIGN.md files that copy other sites' fonts, colours and spacing. Meliona keeps its own system; `docs/design/DESIGN-RULES.md` is its design file.
- **chrome-devtools-mcp** (github.com/ChromeDevTools/chrome-devtools-mcp, `045fb8c`): the suggested `npx chrome-devtools-mcp@latest` is unpinned and runs a browser-control server. Its job, a load-speed trace, was done with the pre-installed Chromium instead (2026-11-17): it found Streamlit's 9.8 MB script bundle sent uncompressed, now gzipped by `serve.py`'s `StaticGzip`.
- **img2threejs**: turns photos into 3D objects to spin. John turned down 3D and spinning (motion sickness, 2026-11-09; "floating 3D shapes" are a generated-site tell, 2026-11-10). Not downloaded.
- **impeccable (full version)**: downloads and runs a closed-source binary, sends usage telemetry, writes hooks into user-level and team-shared agent settings, and tells the agent to use "the least-sandboxed command path" and "do not ask permission first". Only its written guidance is installed (row above).
- **REA** (github.com/morluto/rea): works by running `npx -y rea-agents@latest` (unpinned, unreviewed), which edits agent config and says tool approvals aren't needed. Out of scope for these repos.
- **last30days**, **Scrapling**: left out by choice (130 scripts that need API keys; a Python scraping package).

## Rules when using these here
- The repo's CLAUDE.md always wins over a skill.
- Don't run `humanizer` on CLAUDE.md, rule text, or commit messages: it strips formatting and could drop the required attribution lines.
- Design skills (hallmark, taste, ui-ux-pro-max, diagram-design) add outside fonts and assets by default. Check them against the page's security policy before using them on a shipped UI.
