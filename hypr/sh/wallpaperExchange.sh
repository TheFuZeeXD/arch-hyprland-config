#!/bin/bash

WALLPAPER_DIR="$HOME/Settings/HyprWallpaper"
RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)

hyprctl hyprpaper preload "$RANDOM_WALLPAPER"
hyprctl hyprpaper wallpaper " MONITOR NAME,$RANDOM_WALLPAPER" 
hyprctl hyprpaper unload all
