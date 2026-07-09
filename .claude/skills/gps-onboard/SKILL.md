---
name: gps-onboard
description: Interactive goal-setting session for a new 12-week cycle. Captures the owner's profile (first run), elicits up to 3 goals, walks each through the adapted-GPS template (why, anti-goals, milestones, 80% checks, WOOP, if-thens), writes goal files, and initializes the scorecard.
---

# GPS Onboard — start a 12-week cycle

Read `CLAUDE.md`, `method/gps-adapted.md`, and `data/config.json` first. This is an
**interactive** ritual — use AskUserQuestion throughout; never invent the owner's goals.

## Steps

0. **First run only** (no `data/config.json` or `data/profile.md`): create them.
   Config: name, channel (email/whatsapp/telegram/none + address/JID/handle — email
   is the zero-dependency default), nudge time, tone
   (full-scorecard / firm / log-only), partner (offer `/gps-partner`, can skip).
   Profile: ask about past follow-through honestly — when do they deliver (external
   deadlines? bursts?), how do goals usually die (drift week? shiny objects? overload?),
   health/life guardrails worth standing anti-goals. Write `data/profile.md` and seed
   `data/goals/anti-goals.md` from the answers.
1. **Determine the cycle**: `YYYY-qN` from today. Create `data/goals/<cycle>/`. If
   active goals exist for this cycle, ask whether to revise instead.
2. **Elicit direction** (divergent → convergent): what would make this cycle a win in
   work, health, life? Push vague answers toward a metric.
3. **Enforce the cap**: max 3 goals (1 work, 1 health, 1 optional — empty third slot
   is a recommended choice). Everything else → `data/parking-lot.md`, said explicitly.
4. **Walk EACH goal through the template** (`templates/goal-template.md`):
   - Specific measurable outcome; **learning-goal override** for novel work.
   - Identity why (one sentence).
   - The two **80% checks** — owner scores them; <80% → shrink and re-score, using
     the base rate in `data/profile.md`.
   - **WOOP**: pre-mortem obstacles, then ≥3 if-thens covering the profile's
     obstacle classes.
   - **Operating procedure (machine test)**: ask whether the goal is reached by
     *repeating a unit of work* (an experiment, a weekly ship, a session) whose steps
     the milestones don't already spell out. If YES, build the ordered step-by-step for
     ONE unit with the owner (how to pick/start it, do it, close and log it) — the goal
     is not fully set up without it; if it has a per-unit ledger, create that file too.
     If NO (one-shot deliverable, milestones are the steps), delete the section — no
     empty circuitry.
5. **Write** `data/goals/<cycle>/g<N>-<slug>.md` per goal, fully filled.
6. **Initialize `data/tracking/scorecard.md`**: goals × W1–W12 (real dates) + anti row.
7. **Create `data/tracking/YYYY-MM.md`** if missing, with the format header.
8. Close with the first nudge time and the single next action per goal. Offer
   `/gps-dashboard` to publish their dashboard.
