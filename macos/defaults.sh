#
# System
#

# Menu bar: show batter percentage
#defaults write com.apple.menuextra.battery ShowPercent YES

#
# Dock
#

# automatically hide and show the deck
defaults write com.apple.dock autohide -bool true

# make dock icons of hidden apps transparent
defaults write com.apple.dock showhidden -bool true

# Set the size of the dock icons
defaults write com.apple.dock tilesize -int 48
defaults write com.apple.dock largesize -int 58

# Allow a tiny bit of magnification on hover
defaults write com.apple.dock magnification -int 1

#
# Keyboard/input
#

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Disable Spotlight cmd-space shortcut
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 64 "
    <dict>
        <key>enabled</key>
        <false/>
        <key>value</key>
        <dict>
            <key>type</key>
            <string>standard</string>
            <key>parameters</key>
            <array>
                <integer>32</integer>
                <integer>49</integer>
                <integer>1048576</integer>
            </array>
        </dict>
    </dict>
"

#
# Terminal.app
#

# Appearance
defaults write com.apple.terminal "Default Window Settings" -string "Pro"
defaults write com.apple.terminal "Startup Window Settings" -string "Pro"

#
# Apply it!
#

# Restart affected apps
for app in "Dock" "Finder" "SystemUIServer"; do
  killall "${app}" &> /dev/null
done