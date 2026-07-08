# GPS System

**An evidence-based goal system run by Claude Code.** Goal → Plan → System, with a
daily nudge, a weekly scorecard, an accountability partner, and a browser dashboard —
built on what the research actually supports, not productivity folklore.

No app to install. Your goals are markdown files; Claude Code runs the rituals; your
phone gets one short message a day.

## Why another goal system?

Most goal advice fails at the same spot: the gap between *setting* a goal and anyone
noticing you stopped. The strongest findings in the goal literature all target that gap:

- **Record progress and share it** — Harkin et al. 2016, *Psychological Bulletin*
  meta-analysis (138 studies, d≈0.40). The single strongest lever.
- **Weekly accountability reports to a real person** — Matthews (Dominican University):
  ~70% vs ~35% success. (You may have heard this as "the Harvard goals study" — that
  study never existed. Matthews is the real one, and the effect came from
  *accountability*, not from writing goals down.)
- **If-then plans** — Gollwitzer's implementation intentions (meta d≈0.65).
- **Obstacle-contrast (WOOP), not visualization** — Oettingen: pure positive
  visualization measurably *reduces* achievement.
- **Specific goals with guardrails** — Locke & Latham, tempered by "Goals Gone Wild"
  (anti-goals against tunnel vision; learning goals for novel work).

Full review with citations: [`method/science-notes.md`](method/science-notes.md).
The method: [`method/gps-adapted.md`](method/gps-adapted.md).

## How it works

1. **Onboard once** — `/gps-onboard` in Claude Code walks you through up to 3 goals
   (hard cap, by design) for a 12-week cycle: metric, why, milestones, honesty checks,
   obstacles, if-thens. Ideas beyond 3 go to a parking lot.
2. **Daily** — one short `[GPS]` message on WhatsApp at your chosen time: today's lead
   action per goal + anti-goal check. Reply `done`/`skip`. Thirty seconds.
3. **Sunday** — your scorecard arrives; `/gps-weekly` closes the week in 5 minutes.
   If you've invited an accountability partner, your weekly report goes to them after
   your confirm.
4. **Week 12** — `/gps-reset`: score the cycle, harvest lessons, pick the next goals.
5. **Anytime** — `/gps-dashboard` publishes your private browser dashboard (tour
   included); "park this: [idea]" captures shiny objects without derailing you.

## Quick start

```bash
git clone <this-repo> gps-system && cd gps-system
cp examples/config.example.json data/config.json   # edit: your name, channel, time
claude                                              # then type: /gps-onboard
./system/install-schedules.sh                       # macOS launchd: daily/weekly/monthly
```

Requires: [Claude Code](https://claude.com/claude-code), and
[wacli](https://wacli.sh) if you want WhatsApp delivery.

## Accountability partner

`/gps-partner` invites a friend, cofounder, or coach: they receive your weekly
scorecard (after your confirmation, every time). This is the Matthews mechanism — the
single feature with the largest documented effect. Solo mode works, but the system
will keep reminding you it's the weaker configuration.

## Roadmap — hosted accountability (paid)

The self-hosted framework is and stays free (MIT). Planned paid layer:

- **Accountability reports as a service**: your weekly scorecard reviewed, written up,
  and delivered to you and your partner — no self-hosting, no Claude setup.
- Partner-side experience: a link, not a repo.
- Team/cohort scorecards.

Interested? Open an issue titled `interest: hosted accountability`.

## License

MIT — see [LICENSE](LICENSE). Your data never leaves your machine except the messages
you configure (`data/` is gitignored).
