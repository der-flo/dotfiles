#!/bin/sh
set -e

### Mise #############
# https://mise.jdx.dev

# mise uninstall ruby@3.3.5
# TODO: Ist das klug?
mise use --global ruby@4.0.6
