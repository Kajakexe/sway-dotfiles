#!/usr/bin/env bash
set -e

flag="$XDG_RUNTIME_DIR/sway_theme_applied"

if [ -f "$flag" ]; then
    exit 0
fi

THEMES_DIR="$HOME/.config/themes/colors"
theme=$(ls "$THEMES_DIR"/*.sh | shuf -n 1 | xargs -n1 basename | sed 's/\.sh$//')

"$HOME/.config/themes/switch.sh" "$theme"

touch "$flag"
