[ -f /usr/local/share/chruby/chruby.fish ]; and source /usr/local/share/chruby/chruby.fish
[ -f /usr/local/share/chruby/auto.fish ]; and source /usr/local/share/chruby/auto.fish

fish_vi_key_bindings

set PATH ~/bin $PATH
set --export EDITOR vim
set --export VISUAL vim
set --export RIPGREP_CONFIG_PATH $HOME/.ripgreprc

source ~/.config/fish/nww_functions_and_aliases.fish

# abbr_add "reload=source ~/.config/fish/config.fish"

set -g theme_nerd_fonts yes
set -g theme_display_git yes
set -g theme_display_git_untracked yes
set -g theme_display_ruby yes
set -g theme_display_vi yes
set -g theme_color_scheme dark
set -g theme_display_date no

abbr -a gic 'git checkout'
abbr -a gicp 'git checkout --patch'
abbr -a gicm 'git commit --message ""'
abbr -a gid 'git diff'
abbr -a gidc 'git diff --cached'
abbr -a giap 'git add --patch'
abbr -a gis 'git status'
abbr -a gip 'git pull --stat'
abbr -a gips 'git push'
abbr -a gib 'git branch'
abbr -a gihi 'git hist'
abbr -a gidob 'git push origin --delete'

abbr -a be 'bundle exec'
abbr -a bo 'bundle open'
abbr -a bi 'bundle install -j4'

abbr -a todo_flo 'rg "TODO\sFlo"'
abbr -a todo 'rg --pcre2 "TODO(?! Prio [23])"'

abbr -a txn 'tmux new-session'
abbr -a http_dir 'ruby -run -e httpd . --port=8080'
