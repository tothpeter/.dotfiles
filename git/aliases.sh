alias grbi2='grbi HEAD~2'
alias grbi3='grbi HEAD~3'
alias grbi4='grbi HEAD~4'
alias grbi5='grbi HEAD~5'
alias grbi6='grbi HEAD~6'
alias grbi7='grbi HEAD~7'
alias grbi8='grbi HEAD~8'
alias grbi9='grbi HEAD~9'

# Git rebase master (It stashes the changes if there were any)
alias grbm='git_rebase_to_main_with_changes'

# Git rebase master iterative
alias grbmi='EDITOR="code --wait" grbi main'

# Git update = sync down changes from the remote master to the current branch
alias gupd='gplm ; grbm ; gfa'
# Git update iterative
alias gupdi='gplm && grbmi'
# Git update remote
alias gupdr='gplm ; grbm ; gpf ; gfa'

alias gc='git commit -m' # git commit for lazy devs like myself
alias gam='git add . ; git commit --amend --no-edit' # ammend all changes to the last commit

alias gl='git log --oneline --graph --all --decorate'
alias gr='git remote -v' # lists the remotes
alias gs='git status'
alias gpf='git push -f'
alias gpl='git pull'
alias gplr='git pull --rebase'
# Git pull master = update the local main branch, without the need to switch to it
alias gplm='git fetch origin $(git_main_branch):$(git_main_branch)'
alias nah='git reset --hard && git clean -df' # discard all changes
alias gu="git reset --soft 'HEAD^'" # Git undo = removes the last commit while keeping its changes

alias gcf="!git log -n 10 --pretty=format:'%h %s' --no-merges | fzf | cut -c -7 | xargs -o git commit --fixup" # Git commit fixup | creates a fixup commit | brew install fzf
alias gsf='git rebase -i --autosquash $(git_main_branch)' # Git squash fixup commits

alias gitx='open -a SourceTree $(git rev-parse --show-toplevel || echo .)'
alias gx='gitx'
