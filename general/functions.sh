_original_background_path=~/.dotfiles/local/original_background.txt
_new_background_path=/Volumes/DriveD/Dropbox/work/screen_casts/backround.jpg

_original_dock_size_path=~/.dotfiles/local/original_dock_size.txt

activate_screen_cast_env() {
  desired_dock_size=71

  # Hide the desktop icons
  defaults write com.apple.finder CreateDesktop -bool true ; killall Finder

  # Change the background
  osascript -e 'tell application "System Events" to picture of every desktop' > $_original_background_path
  osascript -e 'tell application "System Events" to set picture of every desktop to "'"$_new_background_path"'"'

  # Change the dock size
  echo $(defaults read com.apple.dock tilesize) > $_original_dock_size_path
  defaults write com.apple.dock tilesize -int $desired_dock_size
  killall Dock
}

deactivate_screen_cast_env() {
  # Show the desktop icons
  defaults write com.apple.finder CreateDesktop -bool false ; killall Finder

  # Restore the background
  original_background=$(cat $_original_background_path)
  osascript -e 'tell application "System Events" to set picture of every desktop to "'"$original_background"'"'

  # Restore the dock size
  original_dock_size=$(cat $_original_dock_size_path)
  defaults write com.apple.dock tilesize -int $original_dock_size
  killall Dock
}

# Find alias using fuzy search then execute the selected one
find_alias() {
  # Capture the selected alias using fzf and awk
  local selected_alias
  selected_alias=$(alias | fzf | awk -F'=' '{print $1}')

  # Execute the selected alias if there is one
  if [ -n "$selected_alias" ]; then
    echo "Executing: $selected_alias"
    eval "$selected_alias"
  fi
}
