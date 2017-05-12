fish_vi_key_bindings

set PATH ~/bin $PATH
set -Ux EDITOR 'atom -w'
set -Ux VISUAL 'atom -w'

source ~/.config/fish/nww_functions_and_aliases.fish

# abbr_add "reload=source ~/.config/fish/config.fish"

set -g theme_nerd_fonts yes
set -g theme_display_git yes
set -g theme_display_git_untracked yes
set -g theme_display_ruby yes
set -g theme_display_vi yes
set -g theme_color_scheme dark
set -g theme_display_date no

abbr -a gicp 'git checkout --patch'
abbr -a gidi 'git diff'
abbr -a gidc 'git diff --cached'
abbr -a gicm 'git commit --message ""'
abbr -a giap 'git add --patch'
abbr -a gist 'git status'
abbr -a gipr 'git pull --rebase --stat'
abbr -a gico 'git checkout'
abbr -a gibr 'git branch'
abbr -a gispr 'git stash; and git pull --rebase --stat; and git stash pop'
abbr -a gihi 'git hist'

abbr -a be 'bundle exec'
abbr -a bo 'bundle open'
abbr -a bi 'bundle install -j4'

abbr -a ag 'ag --hidden'
abbr -a agi 'ag --hidden --ignore-case'
abbr -a todo_flo 'ag "TODO\sFlo"'
abbr -a todo 'ag "TODO(?! Prio [23])"'
