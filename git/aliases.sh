alias grbi2='grbi HEAD~2'
alias grbi3='grbi HEAD~3'
alias grbi4='grbi HEAD~4'
alias grbi5='grbi HEAD~5'
alias grbi6='grbi HEAD~6'
alias grbi7='grbi HEAD~7'
alias grbi8='grbi HEAD~8'
alias grbi9='grbi HEAD~9'

# Git rebase master
alias grbm='git_rebase_to_main_with_changes'

# Git rebase master iterative
alias grbmi='EDITOR="code --wait" grbi main'

# Git update
alias gupd='gplm ; grbm'
# Git update iterative
alias gupdi='gplm && grbmi'
# Git update remote
alias gupdr='gplm ; grbm ; gpf'

alias gc='git commit -m'
alias gam='git add . ; git commit --amend --no-edit'

alias gl='git log --oneline --graph --all --decorate'
alias gr='git remote -v'
alias gs='git status'
alias gpf='git push -f'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gplm='git fetch origin $(git_main_branch):$(git_main_branch)' # pulls the main branch without checking it out
alias nah='git reset --hard && git clean -df' # discard all changes
alias gu="git reset --soft 'HEAD^'" # undo last commit and keep its changes

alias gitx='open -a SourceTree $(git rev-parse --show-toplevel || echo .)'
