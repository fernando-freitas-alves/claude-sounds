#!/usr/bin/env bash
set -euo pipefail

DEST="$HOME/.ai_coding_hooks"

echo "Installing claude-sounds to $DEST..."

for dir in session_start notification stop user_prompt_submit post_tool_use_failure pre_tool_use post_tool_use pre_compact post_compact; do
  mkdir -p "$DEST/$dir"
  if ls "$dir/"*.mp3 &>/dev/null; then
    cp "$dir/"*.mp3 "$DEST/$dir/"
    echo "  Copied $(ls "$dir/"*.mp3 | wc -l | tr -d ' ') file(s) → $DEST/$dir/"
  fi
done

echo ""
echo "Done. Merge the hooks from settings-hooks.json into ~/.claude/settings.json to activate."
echo "On macOS, sounds play via 'afplay'. No additional dependencies needed."
