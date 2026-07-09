---
name: gps-daily
description: Daily GPS nudge (scheduled at config nudge_time, also manually invokable). Appends today's tracking line and sends one short [GPS] message with the single lead action per goal plus the anti-goal check.
---

# GPS Daily — morning nudge

Non-interactive; runs scheduled. Read `CLAUDE.md`, `data/config.json`, active goal
files in the current cycle dir, `data/goals/anti-goals.md`, and the last ~7 lines of
`data/tracking/YYYY-MM.md`.

## Steps

1. **Skip check**: skip ONLY if today's tracking line exists AND contains the `nudged`
   marker (this ritual already ran today — manual notes without the marker do NOT
   count; then send the nudge and add `nudged` to the existing line instead of
   appending a duplicate). No active goals → send one `[GPS] No active cycle. Run
   /gps-onboard.` message (max once; check the log).
2. **Derive today's single lead action per goal** from milestones and recent tracking.
   One action each, concrete, doable today. If a goal has an `## Operating procedure`,
   the lead action is its next un-done step for the current unit — not a re-invented one.
3. **Append the tracking line** to `data/tracking/YYYY-MM.md` (create from the format
   header if needed), marking yesterday's outcomes from available evidence (git
   activity, the owner's `done`/`skip` replies since the last nudge, read via the
   configured channel) and `?` where unknown. End the line with `nudged` only after
   step 5 succeeds.
4. **Compose ONE short message** (30-second read):

   ```
   [GPS] Wed 09 Jul — day N/84
   g1 <slug>: <today's lead action>
   g2 <slug>: <today's lead action>
   anti: <the one or two checks that matter today> · streak: <n>d clean
   Reply done/skip per goal anytime — I log it · "why g1" = the how & the science
   📍 <dashboard_artifact_url from config, if set>
   ```

   The dashboard link and the `why` invite are the owner's route to guidance — the
   home base is the dashboard (tour + inline help), never a raw file. A `why <gN>`
   reply is answered from that goal's file (Operating procedure + WOOP) in plain terms.
   Omit the 📍 line if config has no `dashboard_artifact_url`.
   Drift callouts per config tone: `full-scorecard` → `g2: untouched 5d`.
5. **Send** per the channel-dispatch rules in `CLAUDE.md` (whatsapp / email /
   telegram / none). Only ever to the owner — never the partner.
