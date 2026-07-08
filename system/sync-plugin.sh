#!/bin/zsh
# Sync project skills (.claude/skills — the canonical source) into the plugin
# layout (skills/) used by Claude Code plugin installs. Run after editing skills.
set -e
REPO="$(cd "$(dirname "$0")/.." && pwd)"
rm -rf "$REPO/skills"
cp -R "$REPO/.claude/skills" "$REPO/skills"
echo "synced $(ls "$REPO/skills" | wc -l | tr -d ' ') skills to plugin layout"
