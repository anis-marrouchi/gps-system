---
name: gps-dashboard
description: Regenerate and republish the GPS dashboard artifact from current data (goals, scorecard, tracking, anti-goals, parking lot, partner). Use on demand and after weekly/monthly reviews and resets.
---

# GPS Dashboard — refresh

The dashboard is generated as `dashboard.html` at the repo root (gitignored — it
contains private data). The design/interaction source of truth is
`templates/dashboard-template.html` (committed, example data only).

The owner's stable artifact URL lives in `data/config.json → dashboard_artifact_url`.
**Always republish to that URL** (pass it as `url` to the Artifact tool from any
session that didn't originally publish it). Never mint a new URL. Favicon stays 🧭.

## Steps

1. Read current state: `data/config.json`, active goal files, scorecard, this month's
   tracking, anti-goals, parking lot.
2. Generate `dashboard.html` from `templates/dashboard-template.html`: replace ONLY
   the `window.GPS_DATA = {...}` JSON block with real data (schema documented at the
   top of the template). Do not alter markup/CSS/JS — design changes happen in the
   template and get committed.
   - **Operating procedure**: for any goal whose file has a filled `## Operating
     procedure`, populate that goal's `procedure` (array of short step labels, one per
     step — trim each to a phrase, the full text lives in the goal file) and `unit`
     (the thing repeated, e.g. `experiment`, `week`, `session`). Omit both for one-shot
     goals — the card renders nothing, no empty circuitry.
3. Publish with the Artifact tool (title `GPS — <cycle>`); if config has no
   `dashboard_artifact_url` yet, save the returned URL into config.
4. If the template itself changed, commit it: `feat(dashboard): <what changed>`.
