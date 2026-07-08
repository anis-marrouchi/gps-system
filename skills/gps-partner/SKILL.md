---
name: gps-partner
description: Invite, change, or remove an accountability partner — the person who receives the weekly scorecard report (the Matthews mechanism, the single strongest documented lever in the goal literature). Interactive.
---

# GPS Partner — accountability setup

The evidence: Matthews (Dominican University) — participants who sent weekly progress
reports to a friend succeeded ~70% vs ~35%. (The "Harvard goals study" people cite for
this never existed.) Harkin et al. 2016: effects of progress monitoring are larger
when progress is made public. This feature IS the system's strongest lever.

Interactive — read `data/config.json` first.

## Steps

1. **Explain what the partner gets** (before asking who): one short weekly scorecard
   message — goals, %s, verdicts — sent only after the owner approves it each week.
   Nothing else; no daily traffic; no goal-file access.
2. **Capture the partner** with AskUserQuestion: name, channel (whatsapp/telegram/
   email), JID/handle/address, relationship (friend / cofounder / coach).
3. **Compose the invitation message** for the owner to review — plain language:
   what the sender is doing (12-week goals), what the partner will receive weekly,
   what's asked of them (read it; reply with one line if they feel like it — even
   knowing someone reads it is the mechanism). Send ONLY after the owner confirms,
   via the partner's channel.
4. **Update `data/config.json → partner`** on confirmation of sent invite.
5. **Removal/change**: set partner to null or the new person; confirm; note it in the
   next weekly review.

Never message the partner outside the confirmed weekly report + this invitation.
