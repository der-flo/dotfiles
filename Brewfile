# https://github.com/Homebrew/homebrew-bundle
# https://gist.github.com/ChristopherA/a579274536aab36ea9966f301ff14f3f

tap 'hashicorp/tap'

brew 'chezmoi'
brew 'coreutils' # For e. g. `numfmt`
brew 'fish'
brew 'fisher'
brew 'libyaml' # For 'ruby-install' via mise
brew 'mas'
brew 'mise'
brew "mysql-client" # For gem 'mysql2'
brew 'pass'
brew 'pwgen'
brew 'ripgrep'
# brew 'ruby-build' # Needed or included in mise?
brew 'tmux'
brew 'watch'
brew 'zstd' # For gem 'mysql2'
brew 'hashicorp/tap/terraform'

# https://github.com/Homebrew/homebrew-cask/blob/master/USAGE.md
cask 'alacritty'
cask 'docker'
cask 'font-blex-mono-nerd-font'
cask 'font-ibm-plex-mono'
cask 'font-victor-mono-nerd-font'
cask 'hammerspoon'
cask 'karabiner-elements'
cask 'p4v' # P4Merge
cask 'rubymine'
cask 'sourcetree'
cask 'spotify'
cask 'signal'
cask 'visual-studio-code'
cask 'vlc'
cask 'zed'

# https://github.com/mas-cli/mas
# TODO Home: Ist das alles aus dem App Store?
mas 'Numbers', id: 409203825
# mas 'GarageBand', id: 682658836
# mas 'iMovie', id: 408981434
mas 'Xcode', id: 497799835
mas 'Pages', id: 409201541
mas 'Keynote', id: 409183694
mas 'Trello', id: 1278508951
mas 'JSON Peep for Safari 1.3.2', id: 1458969831

############################
# Specific for home computer
if `chezmoi data --format=json | jq .chezmoi.config.data.isHome`.chomp == 'true'
  brew 'borgbackup'
  brew 'ffmpeg' # For 'photo_archive_index'
  brew 'gtk4' # For crate 'relm4'
  brew 'imagemagick' # For 'photo_archive_index'
  brew 'pkg-config' # For crate 'relm4'
  brew 'rclone'
  brew 'rustup-init'

  cask 'adobe-creative-cloud'
  cask 'audacity'
  cask 'blackhole-2ch'
  cask 'elgato-stream-deck'
  cask 'fujitsu-scansnap-home'
  cask 'izotope-product-portal'
  cask 'mixing-station'
  cask 'moneymoney'
  cask 'reaper'
  cask 'sonos'
  cask 'webstorm'
  cask 'wezterm'

  # TODO Home: Do I need VS Code at home?
  vscode "rust-lang.rust-analyzer"
else
  # Previously but not currently used software installed with Homebrew:
  #   cowsay, dos2unix, fswatch, graphviz, htop-osx,
  #   jemalloc, memcached, ntfs-3g, s3cmd, terminal-notifier, unison

  brew 'awscli'
  brew 'iperf'
  brew 'telnet'
  brew 'wget'
  # brew 'git'
  # brew 'gnupg'
  # brew 'mysql-connector-c'
  # brew 'reattach-to-user-namespace'

  cask 'bitbar'
  cask 'bitwarden'
  cask 'cyberduck'
  cask 'gimp'
  cask 'google-chrome'
  cask 'mysqlworkbench'
  cask 'veracrypt'
  cask 'wireshark'

  mas 'Microsoft Remote Desktop', id: 1295203466
  mas 'The Unarchiver', id: 425424353
  mas 'Telefon', id: 406825478

  # TODO: Everything needed for work environment?
  vscode "dbaeumer.vscode-eslint"
  vscode "dotjoshjohnson.xml"
  vscode "fabianlauer.vs-code-xml-format"
  vscode "golf1052.code-sync"
  vscode "gruntfuggly.todo-tree"
  vscode "hashicorp.terraform"
  vscode "idleberg.textile"
  vscode "leighlondon.eml"
  vscode "michaelnewton.textile-preview"
  vscode "mitchdenny.ecdc"
  vscode "ms-azuretools.vscode-docker"
  vscode "ms-ceintl.vscode-language-pack-de"
  vscode "ms-python.debugpy"
  vscode "ms-python.isort"
  vscode "ms-python.python"
  vscode "ms-python.vscode-pylance"
  vscode "ms-toolsai.jupyter"
  vscode "ms-toolsai.jupyter-keymap"
  vscode "ms-toolsai.jupyter-renderers"
  vscode "ms-toolsai.vscode-jupyter-cell-tags"
  vscode "ms-toolsai.vscode-jupyter-slideshow"
  vscode "ms-vscode-remote.remote-containers"
  vscode "ms-vsliveshare.vsliveshare"
  # vscode "faustinoaq.crystal-lang"
  vscode "oderwat.indent-rainbow"
  vscode "serayuzgur.crates"
  vscode "skyapps.fish-vscode"
  vscode "tamasfe.even-better-toml"
  vscode "tomoki1207.pdf"
  vscode "usernamehw.errorlens"
  vscode "vadimcn.vscode-lldb"
  vscode "wayou.vscode-todo-highlight"
  vscode "yzane.markdown-pdf"
  vscode "ziyasal.vscode-open-in-github"
end
