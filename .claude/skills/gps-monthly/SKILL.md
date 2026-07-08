---
name: gps-monthly
description: Monthly GPS rollup (scheduled 1st of month). Aggregates weekly reviews, trends anti-goal metrics, flags multi-week drift, and reminds about the quarterly reset when week 12 approaches.
---

# GPS Monthly — rollup

Non-interactive; runs scheduled. Read `CLAUDE.md`, `data/config.json`, the past
month's weekly reviews, tracking files, scorecard, and active goal files.

## Steps

1. **Write `data/reviews/monthly/YYYY-MM.md`**:
   - Per goal: month trend (weekly %s), milestones hit vs planned, cumulative drift.
   - Anti-goal trends by week; apply any escalation rules defined in
     `data/goals/anti-goals.md`.
   - Verdict per goal, in the configured tone.
   - Parking-lot growth (a rising count mid-cycle is a signal, not a failure).
2. **Reset reminder**: cycle at week 10+ → state the reset date; `/gps-reset` due
   week 12.
3. **Send** one `[GPS] <Month> rollup:` message via the configured channel —
   3–5 lines, worst news first (or per tone).
