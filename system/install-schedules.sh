#!/bin/zsh
# Installs the GPS launchd schedules (macOS). Run from anywhere; re-run to update.
set -e
REPO="$(cd "$(dirname "$0")/.." && pwd)"
CLAUDE="$(command -v claude || echo "$HOME/.local/bin/claude")"
NUDGE=$(grep -o '"nudge_time"[^,]*' "$REPO/data/config.json" 2>/dev/null | grep -o '[0-9][0-9]:[0-9][0-9]' || echo "08:00")
HOUR=${NUDGE%%:*}; MINUTE=${NUDGE##*:}
mkdir -p "$REPO/logs" "$HOME/Library/LaunchAgents"

for j in daily weekly monthly; do
  plist="$HOME/Library/LaunchAgents/gps.$j.plist"
  sed -e "s|__REPO__|$REPO|g" -e "s|__CLAUDE__|$CLAUDE|g" \
      -e "s|__HOUR__|$((10#$HOUR))|g" -e "s|__MINUTE__|$((10#$MINUTE))|g" \
      "$REPO/system/launchd/gps.$j.plist.template" > "$plist"
  launchctl bootout "gui/$(id -u)/gps.$j" 2>/dev/null || true
  launchctl bootstrap "gui/$(id -u)" "$plist"
  echo "loaded gps.$j"
done
launchctl list | grep '^\S*\sgps\.' || launchctl list | grep gps
echo "Done. Logs: $REPO/logs/"
