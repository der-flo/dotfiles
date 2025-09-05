# TODO: Vs. git-trim? https://github.com/foriequal0/git-trim
function remove_old_git_branches
    git checkout master
    git branch --merged | ruby -ne 'puts $_ if ~ /\s+\d+-.+/' | xargs -L1 git branch -d
end
