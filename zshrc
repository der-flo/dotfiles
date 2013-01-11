. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:~/bin

# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

## TODO?
#[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

# TODO?
#export SHELL='/bin/zsh --login'

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && \
  . $HOME/.tmuxinator/scripts/tmuxinator

if [[ -d $HOME/.rvm/bin ]]; then
  export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi

# TODO: /etc/zsh/newuser.zshrc.recommended interesting?

# 256 color terminal, but do not report to TMUX
[ -z "$TMUX" ] && export TERM=xterm-256color

if [[ "$TERM" != "screen-256color" ]]
then
  tmux attach-session -t "$USER" || tmux new-session -s "$USER"
  exit
fi

# http://sourceforge.net/mailarchive/forum.php?thread_name=20121201104306.GU28794%40yelena.nicm.ath.cx&forum_name=tmux-users
alias new_tmux_session="TMUX= tmux new-session -d"

