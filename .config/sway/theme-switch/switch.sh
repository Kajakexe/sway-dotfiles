# ~/.config/themes/switch-theme
#!/usr/bin/env bash
set -e

theme=$1
themefile="$HOME/.config/sway/theme-switch/colors/$theme.sh"

if [ ! -f "$themefile" ]; then
  echo "Theme not found: $theme"
  exit 1
fi

# Load theme colors
source "$themefile"

# Generate Alacritty config
envsubst < "$HOME/.config/alacritty/alacritty.toml.template" \
  > "$HOME/.config/alacritty/alacritty.toml"

# Generate Sway colors include
envsubst '$BG $FG $ACC'< "$HOME/.config/sway/colors.inc.template" \
  > "$HOME/.config/sway/colors.inc"
  
# Generate Rofi colors inculde
envsubst < "$HOME/.config/rofi/themes/sway.rasi.template" \
  > "$HOME/.config/rofi/themes/sway.rasi"
  
# Generate Waybar colors include
envsubst < "$HOME/.config/waybar/config.jsonc.template" \
  > "$HOME/.config/waybar/config.jsonc"
  
envsubst < "$HOME/.config/waybar/style.css.template" \
  > "$HOME/.config/waybar/style.css"


# GTK 3
mkdir -p "$HOME/.config/gtk-3.0"
envsubst '$GTK_THEME $ICON_THEME $FONT' > "$HOME/.config/gtk-3.0/settings.ini" <<EOF
[Settings]
gtk-theme-name=${GTK_THEME}
gtk-icon-theme-name=${ICON_THEME}
gtk-font-name=${FONT}
gtk-application-prefer-dark-theme=true
EOF

# GTK 4
mkdir -p "$HOME/.config/gtk-4.0"
envsubst '$GTK_THEME $ICON_THEME $FONT' > "$HOME/.config/gtk-4.0/settings.ini" <<EOF
[Settings]
gtk-theme-name=${GTK_THEME}
gtk-icon-theme-name=${ICON_THEME}
gtk-font-name=${FONT}
gtk-application-prefer-dark-theme=true
EOF

if command -v gsettings >/dev/null 2>&1; then
    gsettings set org.gnome.desktop.interface gtk-theme "$GTK_THEME"
    gsettings set org.gnome.desktop.interface icon-theme "$ICON_THEME"
    gsettings set org.gnome.desktop.interface font-name "$FONT"
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
fi

rm -rf ~/.cache/gtk-3.0/*
rm -rf ~/.cache/gtk-4.0/*


# reload waybar
pkill waybar &
sleep .05
exec waybar &
echo "should change waybar"

# Reload sway so it picks up new colors
swaymsg reload

wallpaper="$HOME/.config/sway/theme-switch/wallpaper/$theme.jpg"
echo "Wallpaper path: $wallpaper" >> /tmp/theme-debug.log

if [ -f "$wallpaper" ]; then
    echo "File exists, applying wallpaper" >> /tmp/theme-debug.log
    # Use the exact same format that works manually
    swaymsg output "*" bg "$wallpaper" fill

else
    echo "Wallpaper not found: $wallpaper" >> /tmp/theme-debug.log
fi

pkill -f nemo || true
