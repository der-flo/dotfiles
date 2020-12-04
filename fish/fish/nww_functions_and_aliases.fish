# https://github.com/Nix-wie-weg/zsh-functions-and-aliases
# https://github.com/hoffi/dotfiles/blob/fish/fish/nww_functions.fish

function browse
  open (eval $argv)
end

alias branch_current='git rev-parse --abbrev-ref HEAD'
alias branch_oldest_ancestor='/usr/bin/diff -u (git rev-list --first-parent master | psub) (git rev-list --first-parent HEAD | psub) | sed -ne "s/^ //p" | head -1'
alias branch_log='git log (branch_oldest_ancestor)..HEAD'
alias branch_diff='git diff (branch_oldest_ancestor)..HEAD'
alias branch_files='git diff (branch_oldest_ancestor)..HEAD --diff-filter=ACMR --name-only --oneline'
alias bitbucket_repo_url='echo https://(git remote -v | grep -oh "bitbucket.org[:/][^ ]\+.git" | head -1 | sed "s/:/\//" | sed "s/\.git\$//")'
alias bitbucket_review_url='echo (bitbucket_repo_url)/branch/(branch_current)'
alias bitbucket_oldest_ancestor_review_url='echo (bitbucket_repo_url)/branches/compare/(branch_current)..(branch_oldest_ancestor)'
alias planio_url='echo https://adigi.planio.de/issues/(branch_current | grep -oh "^[0-9]\+")'
alias branch_rubocop='branch_files | grep "\.\(rb\|gemspec\)\$" | xargs rubocop --force-exclusion'

abbr -a bb browse bitbucket_repo_url
abbr -a bbr browse bitbucket_review_url
abbr -a bpl browse planio_url
