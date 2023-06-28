alias be='bundle exec'

alias rs='rspec'

# Rails
alias r4='rails _4.2.8_'
alias r5='rails _5.0.2_'

alias r='rails'
alias rc='r console'
alias routes='r routes'

alias logd='tail -f log/development.log'
alias logt='tail -f log/test.log'

alias mig='r db:migrate'
alias migt='RAILS_ENV=test r db:migrate'

alias rollb='r db:rollback'
alias rollbt='RAILS_ENV=test r db:rollback'

alias seed='r db:seed'

alias rg='r generate'
alias rgc='r generate controller'
alias rgmig='r generate migration'
alias rgmod='r generate model'
alias rgs='r generate scaffold'
