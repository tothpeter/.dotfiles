alias ec='code ~/.dotfiles' # Edit config

alias c='code .'
alias o='open .' # Open current directory in finder
alias f='fuck' # It was not me
alias http_server='python -m SimpleHTTPServer 8000'

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Remove directory
alias rmd="rm -rf"

# Temp CDs
alias cdw='cd ~/projects/silverfin/silverfin'
alias cdk='cd ~/projects/mine/kickstarter-clone'
alias cd_blog='cd ~/projects/blog'
alias cd_blog_template='cd ~/projects/blog/template'
alias cd_blog_content='cd ~/projects/blog/content'

# Final CDs
alias cdc='cd ~/.dotfiles'
alias cdr='cd "$(git rev-parse --show-toplevel || echo .)"' # cd root
alias cdp='cd ~/projects'
alias cdpn='cd ~/projects-not-mine'

alias cdtu='cd ~/tutorials'
alias cdtj='cd ~/tutorials/js'
alias cdtr='cd ~/tutorials/ruby'

alias cdt='cd ~/tmp'
alias cdtmp='cd ~/tmp'

alias cde='cd ~/.dotfiles'
