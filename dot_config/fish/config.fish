if status is-interactive
    # Commands to run in interactive sessions can go here
end

/opt/homebrew/bin/brew shellenv | source
mise activate fish | source

abbr -a gic 'git checkout'
abbr -a gicp 'git checkout --patch'
abbr -a gid 'git diff'
abbr -a gidc 'git diff --cached'
abbr -a giap 'git add --patch'
abbr -a gis 'git status'
abbr -a gip 'git pull --stat'
abbr -a gips 'git push'
abbr -a gib 'git branch'
abbr -a gidob 'git push origin --delete'
abbr -a gihi 'git hist'
abbr -a girc 'git rebase --continue'

# Alternative: https://gist.github.com/svenwin/218621544eedb9db03b7f66f64848351
# abbr -a gicm 'git commit --message ""'
function gicm
  set branch (git symbolic-ref --short HEAD | cut -d '-' -f 1)
  set statement "git commit --message \"#$branch: \""
  set cpos (math (string length $statement) - 1)
  commandline $statement
  commandline -C $cpos
end

abbr -a be 'bundle exec'
abbr -a bo 'bundle open'
abbr -a bi 'bundle install -j4'

abbr -a todo_flo 'rg "TODO\sFlo"'
abbr -a todo 'rg --pcre2 "TODO(?! Prio [23])"'

abbr -a txn 'tmux new-session'
abbr -a http_dir 'ruby -run -e httpd . --port=8080'

abbr -a tf 'terraform'

abbr -a cmd 'chezmoi diff'
abbr -a cma 'chezmoi apply'

# abbr_add "reload=source ~/.config/fish/config.fish"

source ~/.config/fish/adigi_functions_and_aliases.fish

[ -f ~/.openai_api_key ]; and set --export OPENAI_API_KEY (cat ~/.openai_api_key)

set --export EDITOR zed --wait --new
set --export VISUAL zed --wait --new

########################################################################################################################
# TODO: Old configuration - needed?

# [ -f ~/soft/miniconda3/etc/fish/conf.d/conda.fish ]; and source ~/soft/miniconda3/etc/fish/conf.d/conda.fish
# fish_vi_key_bindings
# set --export RIPGREP_CONFIG_PATH $HOME/.ripgreprc

# # TODO: fine? See `TODO.md`
# # set PATH ~/bin $PATH
# # https://github.com/fish-shell/fish-shell/issues/527#issuecomment-432508378
# set -g fish_user_paths ~/bin $fish_user_paths
# set -g fish_user_paths /Applications/MacVim.app/Contents/bin $fish_user_paths
# set -g fish_user_paths /usr/local/opt/mysql-client/bin $fish_user_paths
# set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# set -g fish_user_paths ~/.cabal/bin ~/.ghcup/bin $fish_user_paths
# set -g fish_user_paths ~/.cargo/bin $fish_user_paths
