
function branch_current
  # TODO: split('-').first
  git rev-parse --abbrev-ref HEAD
end
# abbr -a gci "git commit -m '"(branch_current)":"

# function abbr_add; set -U fish_user_abbreviations $fish_user_abbreviations $argv; end
# abbr_add "gci git commit -m '(branch_current):"


# abbr_add "reload=source ~/.config/fish/config.fish"

# function gci_abbr
#   echo -n "git commit -m '"
#   branch_current
# end

# abbr -a gci "(gci_abbr)"

set -g theme_nerd_fonts yes
set -g theme_display_git yes
set -g theme_display_git_untracked yes
set -g theme_display_ruby yes
set -g theme_display_vi yes
set -g theme_color_scheme dark
set -g theme_display_date no

abbr -a gcp 'git checkout --patch'
abbr -a gdi 'git diff'
abbr -a gdc 'git diff --cached'
abbr -a gcm 'git commit --message ""'
abbr -a gap 'git add --patch'
abbr -a gst 'git status'

