---
name: gps-weekly
description: Weekly GPS review. Scheduled Sunday evening as a prep run (computes scorecard, drafts the review, sends a summons); the owner then runs it manually to complete the review and, if a partner is configured, approve the partner report.
---

# GPS Weekly — scorecard + review

Tone from `data/config.json`. Read `CLAUDE.md`, `data/config.json`, active goal files,
`data/goals/anti-goals.md`, this month's tracking file, and last week's review.

## Mode A — scheduled prep run (non-interactive)

1. **Compute the week**: per goal, % of planned actions done (tracking lines +
   corroborating git activity), milestone status vs dates, days untouched.
   Anti-goals: violations, dated.
2. **Update `data/tracking/scorecard.md`** (this week's column).
3. **Write the draft** `data/reviews/weekly/YYYY-Wnn.md`:
   - Scorecard table + one-line verdict per goal (`ON TRACK` / `SLIPPING: <fact>` /
     `STALLED: untouched Nd`).
   - Anti-goal violations, dated.
   - Open questions (unreconciled `?` days, milestone re-dates).
   - Next week's WOOP re-check: the most likely obstacle THIS week + its if-then.
   - **If partner configured**: a drafted partner report (short, factual scorecard
     summary) marked `PENDING OWNER APPROVAL`.
4. **Send summons** to the owner per the channel-dispatch rules in `CLAUDE.md`:
   `[GPS] Wnn scorecard: g1 71% · g2 40% SLIPPING (M2 +1w) · anti: 2 late nights. Run /gps-weekly to close it.`
5. Never send anything to the partner in Mode A.

## Mode B — interactive completion (owner runs /gps-weekly)

1. Walk through the draft with AskUserQuestion: reconcile `?` days, confirm/contest
   verdicts, log scope changes in the goal file (shrinking is allowed, silent drift
   is not), set next week's if-then.
2. Goal stalled 2+ weeks → force a decision: recommit (with what change?), shrink,
   or park (frees a slot only at reset).
3. **Partner report**: show the drafted report; owner may edit; send ONLY on explicit
   confirm, via the partner's channel (dispatch rules in `CLAUDE.md`). Record
   sent/skipped in the review.
4. Mark the review completed, save files.
5. Refresh the dashboard (`/gps-dashboard`).
