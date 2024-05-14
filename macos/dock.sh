dockutil --no-restart --remove all

dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/Spotify.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add "/Applications/WhatsApp.app"
dockutil --no-restart --add "/System/Applications/Messages.app"

# Apply the new settings
killall Dock