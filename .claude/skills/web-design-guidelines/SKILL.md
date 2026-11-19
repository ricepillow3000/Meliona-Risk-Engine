---
name: web-design-guidelines
description: Review UI code for Vercel's Web Interface Guidelines (accessibility, focus, forms, animation, typography, touch, layout). Use when asked to "review my UI", "check accessibility", "audit design", "review UX", or "check my site against best practices".
metadata:
  author: vercel
  version: "1.0.0"
  argument-hint: <file-or-pattern>
---

# Web Interface Guidelines

Review files for compliance with Web Interface Guidelines.

This repo's `CLAUDE.md` and `docs/design/DESIGN-RULES.md` win wherever they differ. The known
difference is the guidelines' "Title Case for headings/buttons": Meliona uses sentence case, with
capitals only in the label voice.

## How It Works

1. Read the rules in `references/command.md` (a pinned copy, read on install; it is not fetched).
2. Read the specified files (or ask which files to review).
3. Check them against every rule in `references/command.md`.
4. Output findings in the terse `file:line` format it describes.
