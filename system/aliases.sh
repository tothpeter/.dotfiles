# Edit config

alias ec='code ~/.dotfiles'
alias eca='code ~/.dotfiles/ruby/aliases.sh ~/.dotfiles/system/aliases.sh '

alias c='code .'
alias o='open .'
alias f='fuck'
alias http_server='python -m SimpleHTTPServer 8000'

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Remove folder
alias rmd="rm -rf"

# Dynamic CDs
# alias cdw='cd ~/projects'
alias cdk='cd ~/projects/mine/kickstarter-clone'
alias cd_blog='cd ~/projects/blog'
alias cd_blog_template='cd ~/projects/blog/template'
alias cd_blog_content='cd ~/projects/blog/content'

# Stable CDs
alias cdr='cd "$(git rev-parse --show-toplevel || echo .)"' # cd root
alias cdp='cd ~/projects'
alias cdpn='cd ~/projects-not-mine'

alias cdtu='cd ~/tutorials'
alias cdtj='cd ~/tutorials/js'
alias cdtr='cd ~/tutorials/ruby'

alias cdt='cd ~/tmp'
alias cdtmp='cd ~/tmp'
