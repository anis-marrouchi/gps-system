---
name: gps-reset
description: Quarterly 12-week cycle reset (manual, interactive). Scores the closing cycle, harvests lessons, triages the parking lot (promote max 1), re-asks the accountability-partner question, then hands off to /gps-onboard.
---

# GPS Reset — close a cycle, open the next

Interactive — the owner runs this at week 12 (the monthly rollup reminds them).
Read `CLAUDE.md`, `method/gps-adapted.md`, `data/config.json`, the cycle's reviews,
scorecard, goal files, and `data/parking-lot.md`.

## Steps

1. **Score the cycle**: per goal — final metric vs target, milestones hit, honest
   done/missed/partial call (owner's call, your evidence). Anti-goal totals vs the
   baselines in `data/goals/anti-goals.md`.
2. **Harvest lessons** (AskUserQuestion): which if-thens fired and worked? Where did
   drift start? Was the plan structure right for this person? Update
   `data/profile.md` if a pattern repeated across goals.
3. **Triage the parking lot**: list every parked idea; promote **max 1** into the
   next cycle's candidates; move the rest to Archived with a one-line reason.
   Archiving is success, not failure.
4. **Re-ask the partner question** if none configured (offer `/gps-partner`) —
   solo mode is the documented weaker configuration.
5. **Write `data/reviews/quarterly/<cycle>-reset.md`**.
6. **Close out**: set closing goals' `status`; then run `/gps-onboard` for the new
   cycle (a continuing goal still counts against the cap of 3).
7. Refresh the dashboard (`/gps-dashboard`).
