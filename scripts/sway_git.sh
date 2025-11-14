#!/bin/bash

# Configuration
DEST_DIR="/home/max/git/sway"
SOURCE_DIR="$HOME"

echo "Starting sync to $DEST_DIR..."

# Create destination directories
mkdir -p "$DEST_DIR/.config"

# Sync directories with rsync
echo "Syncing .themes..."
rsync -av --delete "$SOURCE_DIR/.themes/" "$DEST_DIR/.themes/"

echo "Syncing .icons..."
rsync -av --delete "$SOURCE_DIR/.icons/" "$DEST_DIR/.icons/"

echo "Syncing alacritty..."
rsync -av --delete "$SOURCE_DIR/.config/alacritty/" "$DEST_DIR/.config/alacritty/"

echo "Syncing rofi..."
rsync -av --delete "$SOURCE_DIR/.config/rofi/" "$DEST_DIR/.config/rofi/"

echo "Syncing sway..."
rsync -av --delete "$SOURCE_DIR/.config/sway/" "$DEST_DIR/.config/sway/"

echo "Syncing waybar..."
rsync -av --delete "$SOURCE_DIR/.config/waybar/" "$DEST_DIR/.config/waybar/"

echo "Syncing nvim..."
rsync -av --delete "$SOURCE_DIR/.config/nvim/" "$DEST_DIR/.config/nvim/"

echo "Syncing scripts..."
rsync -av --delete "$SOURCE_DIR/scripts/" "$DEST_DIR/scripts/"

echo "Sync completed!"
