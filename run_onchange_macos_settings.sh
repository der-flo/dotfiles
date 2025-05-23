#!/bin/sh

# Sources
# * https://gist.github.com/romanhaa/9804183f242991007b316a59c4ba5e5a
# * https://marketmix.com/de/mac-osx-umfassende-liste-der-terminal-defaults-commands/
# * TODO: https://github.com/rusty1s/dotfiles/blob/master/macos/defaults.sh

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

# TODO: "Alle Eingabequellen: Punkt mit doppeltem Leerzeichen hinzufügen" deaktivieren
