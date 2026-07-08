# GPS System — Operating Manual

An evidence-based, Claude-run goal system: Ali Abdaal's GPS skeleton (Goal → Plan →
System), corrected against the research and personalized to the owner. Any Claude
session working here follows these rules. Rationale lives in `method/` — read it
before changing any rule.

**Privacy split:** everything under `data/` is the owner's private instance (goals,
tracking, reviews, config, profile) and is gitignored — never commit it, never copy
its contents into framework files, README, or example files. `dashboard.html` is
generated with private data and is gitignored too. Framework files must stay generic.

## Hard rules (non-negotiable)

1. **Max 3 active goals per 12-week cycle.** Never create a 4th goal file in the
   active cycle dir — new ideas go to `data/parking-lot.md`, triaged only at the
   quarterly reset (`/gps-reset`).
2. **Anti-goals (`data/goals/anti-goals.md`) are checked at every ritual** and
   override goal progress: hitting a goal by violating an anti-goal counts as a miss.
3. **WOOP, never bare visualization.** Every goal file needs obstacles and ≥3 if-then
   implementation intentions covering the owner's obstacle classes from
   `data/profile.md`.
4. **Tone comes from `data/config.json`** (`tone`): `full-scorecard` = blunt, factual
   drift callouts with dates and numbers; `firm` = factual, no confrontation;
   `log-only` = record, never editorialize.
5. **Rituals commit their own writes** — but data/ is gitignored, so ritual commits
   only apply to framework changes; data writes are just saved.

## Configuration (data/config.json)

`user_name`, `channel` (whatsapp | telegram | none), `whatsapp_jid`, `nudge_time`,
`tone`, `partner` (null or `{name, channel, jid_or_handle}`), `dashboard_artifact_url`.

## File conventions

- `data/goals/<cycle>/g<N>-<slug>.md` — active goals, from `goals-template.md`
  (repo root: `templates/goal-template.md`). Cycle dirs are `YYYY-qN`.
- `data/tracking/YYYY-MM.md` — append-only daily log; a line ends with `nudged` only
  after the day's nudge actually sent (skip-check marker).
- `data/tracking/scorecard.md` — current cycle, weekly % per goal.
- `data/reviews/{weekly,monthly,quarterly}/`.
- Dates absolute, never relative.

## Rituals (skills in .claude/skills/)

| Skill | When | Scheduled? |
|---|---|---|
| `/gps-onboard` | Start of a cycle | Manual, interactive |
| `/gps-daily` | `nudge_time` daily | Yes (launchd, see system/) |
| `/gps-weekly` | Sunday evening prep; owner completes | Yes (prep run) |
| `/gps-monthly` | 1st of month | Yes |
| `/gps-reset` | Week 12 | Manual, interactive |
| `/gps-dashboard` | On demand + after reviews | Manual |
| `/gps-partner` | When inviting/changing an accountability partner | Manual, interactive |

## Message delivery

Send via the channel in `data/config.json`, always prefixed `[GPS]`. One message per
ritual, short. Messages to the accountability partner require the owner's explicit
confirmation before each send — never auto-send to a third party.
