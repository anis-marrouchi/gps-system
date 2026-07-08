# Hosted Accountability — paid service (draft)

The self-hosted framework is free (MIT). This documents the paid layer we're paving
toward. Nothing here is live yet.

## The product

**Accountability reports as a service.** The user sets goals (guided, 10 minutes, no
Claude setup needed); every week they and their chosen partner receive a written
scorecard report — computed from their check-ins, phrased in their chosen tone.
The pitch is the evidence: weekly progress reports to another person roughly doubled
goal success in Matthews' study; monitoring effects grow when progress is shared
(Harkin et al. 2016).

## Why people would pay

- No self-hosting, no CLI, no API keys: onboard in chat (WhatsApp/Telegram), get the
  dashboard as a link.
- The partner needs zero setup: they just receive a readable weekly report.
- The report is the deliverable: honest, specific, consistent — the thing humans are
  bad at doing for themselves.

## Tiers (working hypothesis)

| Tier | Price idea | What |
|---|---|---|
| Self-hosted | Free | This repo |
| Solo hosted | ~$9/mo | Daily nudge + weekly report to you |
| Partner | ~$19/mo | + partner delivery, invitation handling, reply relay |
| Cohort/team | ~$49/mo | Shared scorecards for small teams (the team-scorecard pattern) |

## Build path (incremental, no big-bang)

1. **Now**: public repo + dashboard; "interest: hosted accountability" issues as the
   waitlist.
2. **Concierge MVP**: run the first 5–10 paying users on this very framework,
   operated from our own infrastructure (one instance per user, WhatsApp onboarding).
   Zero new code; validates pricing and the report format.
3. **Productize** only what concierge proves: multi-tenant store, billing, partner
   link page.

## Constraints to respect

- Health-adjacent data (anti-goals may include sleep, blood pressure): treat all user
  data as sensitive; per-user isolation; delete on request; never train on it.
- The weekly partner report must always be user-approved before sending — trust is
  the product.
