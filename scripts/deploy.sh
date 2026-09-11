#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEME_SRC="$SCRIPT_DIR/../src/yugen-ash.json"

if [ ! -f "$THEME_SRC" ]; then
  echo "error: theme file not found at $THEME_SRC" >&2
  exit 1
fi

OPENCODE_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/opencode"
THEME_DST="$OPENCODE_DIR/themes"

mkdir -p "$THEME_DST"
cp "$THEME_SRC" "$THEME_DST/yugen-ash.json"

echo "installed to $THEME_DST/yugen-ash.json"

if grep -q '"theme"' "$OPENCODE_DIR/tui.json" 2>/dev/null; then
  echo "update your theme in $OPENCODE_DIR/tui.json:"
  echo '  "theme": "yugen-ash"'
else
  echo "add to a config file (e.g. $OPENCODE_DIR/tui.json):"
  echo '  { "theme": "yugen-ash" }'
fi
