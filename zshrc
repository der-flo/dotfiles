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


android_path=$HOME/soft/android-sdk-macosx
if [[ -d $android_path ]]; then
  export PATH=$PATH:$android_path/tools:$android_path/platform-tools
fi

