#!/bin/sh

# TODO: Also configure for work machine, see `.chezmoiignore`

echo "configuring TimeMachine…"

sudo tmutil addexclusion -p /Applications
sudo tmutil addexclusion -p /Library
sudo tmutil addexclusion -p /System
sudo tmutil addexclusion -p /Users/Shared
sudo tmutil addexclusion -p /Volumes
sudo tmutil addexclusion -p /bin
sudo tmutil addexclusion -p /cores
sudo tmutil addexclusion -p /etc
sudo tmutil addexclusion -p /home
sudo tmutil addexclusion -p /opt
sudo tmutil addexclusion -p /private
sudo tmutil addexclusion -p /sbin
sudo tmutil addexclusion -p /tmp
sudo tmutil addexclusion -p /usr
sudo tmutil addexclusion -p /var

sudo tmutil addexclusion -p /Users/der_flo/.bundle
sudo tmutil addexclusion -p /Users/der_flo/.cache
sudo tmutil addexclusion -p /Users/der_flo/.cargo
sudo tmutil addexclusion -p /Users/der_flo/.rustup
sudo tmutil addexclusion -p /Users/der_flo/.vscode
sudo tmutil addexclusion -p /Users/der_flo/Applications
sudo tmutil addexclusion -p /Users/der_flo/Downloads
sudo tmutil addexclusion -p /Users/der_flo/Library
sudo tmutil addexclusion -p /Users/der_flo/Movies
sudo tmutil addexclusion -p /Users/der_flo/Music
sudo tmutil addexclusion -p /Users/der_flo/tmp

sudo tmutil enable

echo "…configured TimeMachine"
