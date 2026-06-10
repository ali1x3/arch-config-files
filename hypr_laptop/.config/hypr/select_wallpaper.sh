WALLPAPER_DIR="$HOME/wallpapers"

SELECTED_WALLPAPER=$(ls "$WALLPAPER_DIR" | rofi -dmenu "∂" )
 
if [ -n "$SELECTED_WALLPAPER" ]; then

   wal -i "$HOME/wallpapers/$SELECTED_WALLPAPER"
   awww img "$HOME/wallpapers/$SELECTED_WALLPAPER"

   killall waybar
   waybar

   killall swaync
   swaync
fi
