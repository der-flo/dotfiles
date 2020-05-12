#!/bin/sh
set -e

# brew tap caskroom/cask
# brew tap caskroom/versions

brew install \
  awscli \
  chruby \
  chruby-fish \
  fish \
  git \
  gnupg \
  iperf \
  mysql-connector-c \
  mysql-client \
  netcat \
  node \
  pwgen \
  reattach-to-user-namespace \
  ruby-install \
  ripgrep \
  telnet \
  terraform \
  tmux \
  tree \
  watch \
  wget

brew install --HEAD universal-ctags/universal-ctags/universal-ctags

# Previously but not actually used software installed with Homebrew:
#   coreutils, cowsay, dos2unix, fswatch, graphviz, htop-osx,
#   jemalloc, memcached, ntfs-3g, s3cmd, terminal-notifier, unison

# brew cask install karabiner-elements
# brew cask install hammerspoon
# brew cask install iterm2

# brew tap caskroom/fonts
# brew cask install font-bitstreamverasansmono-nerd-font-mono

# brew install --HEAD universal-ctags/universal-ctags/universal-ctags

