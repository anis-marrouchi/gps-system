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

`user_name`, `channel` (whatsapp | email | telegram | none), `whatsapp_jid`,
`email_to`, `telegram_chat_id`, `nudge_time`, `tone`, `partner` (null or
`{name, channel, jid_or_handle}`), `dashboard_artifact_url`.

## Channel dispatch (all rituals send this way)

Read `channel` from config and deliver accordingly — skills never hardcode a channel:

- `whatsapp` → `wacli send text --to <whatsapp_jid> --message "<msg>"`
- `email` → subject = the message's first line (starts with `[GPS]`), body = the rest.
  Use whatever mail CLI exists on the machine, in this order of preference:
  `gog gmail send`, `himalaya`, `mail`/`sendmail`. If none is available, log the
  message to `logs/undelivered.log` and say so in the ritual output — never fail
  silently.
- `telegram` → Bot API `sendMessage` to `telegram_chat_id` (bot token from the
  `GPS_TELEGRAM_TOKEN` env var).
- `none` → write the message to `logs/messages.log` only (terminal-only mode).

Partner messages use the partner's own `channel` from config, same dispatch rules.

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
| `/gps-goal` | Revise or replace one existing goal mid-cycle | Manual, interactive |
| `/gps-daily` | `nudge_time` daily | Yes (launchd, see system/) |
| `/gps-weekly` | Sunday evening prep; owner completes | Yes (prep run) |
| `/gps-monthly` | 1st of month | Yes |
| `/gps-reset` | Week 12 | Manual, interactive |
| `/gps-dashboard` | On demand + after reviews | Manual |
| `/gps-partner` | When inviting/changing an accountability partner | Manual, interactive |

## Plugin layout

The repo doubles as a Claude Code plugin (`.claude-plugin/plugin.json` +
`marketplace.json`). Canonical skill source is `.claude/skills/`; after editing any
skill, run `system/sync-plugin.sh` to mirror into `skills/` (the plugin layout) and
commit both.

## Message delivery

Send via the channel in `data/config.json`, always prefixed `[GPS]`. One message per
ritual, short. Messages to the accountability partner require the owner's explicit
confirmation before each send — never auto-send to a third party.
