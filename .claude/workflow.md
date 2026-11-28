# John's workflow: verify-first, copied from Lauren Tan ("All Code Is Slop (Except Mine)", AI Engineer CODE 2026)

This prints at the start of every session (.claude/hooks/session-start.sh) and holds no matter what the task is.
Master copy: second-brain-vault/.claude/workflow.md. Full rules: the vault's 90-System/Verify-First-Workflow.md
and 90-System/Pod-Workflow.md, and Claude Code memory. A repo's own CLAUDE.md gates still win.

Lauren's trust pyramid, most trust at the bottom. Put each rule as low as it can go:
1. The codebase: design APIs and structure so the wrong thing is hard to write. Refactor rather than warn.
2. Deterministic checks: types, tests, lint rules, the git gate. Every agent mistake becomes a check that fails on
   it, and its error message says the root-cause fix, so the agent sees the guidance the moment it breaks the rule.
   Ban what agents misuse (the gate's ban list). Comments are rare: a lint rule beats a comment.
3. Runtime proof: run the real app as the real user (never admin, unless the test is about the admin page) on a
   laptop and a phone, and bring back screenshots or video. Most of the work (about 70%) is verifying.
4. Written rules (CLAUDE.md, prompts): only for judgment no check can catch.

Every session:
- Ticket first on the vault board. Then a check alone, seen failing (RED), then the fix (GREEN), as two steps.
  A wording change gets a check too.
- Humans review the evidence, not just the diff: every report carries the RED and GREEN lines, the gate run and the
  screenshots.
- Root causes only: no workarounds, timers, sleeps or timing guesses, retries to get green, skipped or flaky tests.
- Helpers are the agents researcher (haiku), builder (sonnet), verifier (sonnet) and reviewer (opus; always for code
  that saves, loads, deletes or signs in). 2 fix rounds, then John breaks the tie.
- Trust grows with the checks: auto-merge only when every check is green, on John's own repos, never on SwayForm.
- Commits: one small verified change, as John Nguyen with his noreply email, first person, a casual 6th-grade why,
  the vault's co-author rule. Never rewrite pushed history.
- In a team repo, ask John before any file that is not his. Text he has not rewritten goes to him first.
- Reports to John: short, plain 6th-grade words, a simple visual, and the proof.
