#!/bin/sh

# Sources
# * https://gist.github.com/romanhaa/9804183f242991007b316a59c4ba5e5a
# * https://marketmix.com/de/mac-osx-umfassende-liste-der-terminal-defaults-commands/
# * TODO: https://github.com/rusty1s/dotfiles/blob/master/macos/defaults.sh
#
# Or `-g` instead of `NSGlobalDomain`

# Keyboard: cycle through windows of the current application with Cmd+<.
# For the German layout: character 60 (<), keycode 50, modifier 1048576 (Cmd).
# Merge only shortcut 27 so all other system shortcuts are preserved.
# XML keeps booleans and integers typed; OpenStep syntax stores them as strings.
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 27 \
  '<dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>parameters</key><array>
        <integer>60</integer><integer>50</integer><integer>1048576</integer>
      </array>
      <key>type</key><string>standard</string>
    </dict>
  </dict>'

# Reload shortcuts in the current session without requiring a new login.
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

# Dock
defaults write com.apple.dock "orientation" -string "left"
defaults write com.apple.dock autohide -bool true

# Finder
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder NewWindowTarget PfHm
killall Finder
chflags nohidden ~/Library

# Mission Control
defaults write com.apple.dock "mru-spaces" -bool "false"
killall Dock

# Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true


# No period for two spacebar presses
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
