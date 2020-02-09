# system
alias cat='bat --paging=never'
alias top='vtop'
alias oldtop="/usr/bin/top"
alias help='tldr'
alias vim='nvim'

# Command to run git under .dotfiles repository
alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dot='dotfiles'

# git
alias g="git"
alias ga="g add"
alias gc="git commit -m"
alias gco="g checkout"
alias gdt="g difftool"
alias gp="g push"
alias gpll="g pull"
alias gpo="gp -u origin"
alias gs="git status"
alias gst="g stash"
alias gl="g log"

# ctags
alias ctags="`brew --prefix`/bin/ctags"

# bundler
alias be="bundle exec"
alias ber="be rake"

# rails
alias rc="rails c"
alias rr="rails routes"
alias rs="rails s"
alias rgm="rails generate migration"

# database
alias dbd="rails db:drop"
alias dbc="rails db:create"
alias dbm="rails db:migrate"
alias dbmt="dbm RAILS_ENV=test"
alias dbr="rails db:rollback"
alias dbrt="dbr RAILS_ENV=test"
alias dbs="rails db:seed"
alias dbrb="dbd && dbc && dbm"

# shpotify
alias sp="spotify"

# tmux
alias mux="tmuxinator"

# arux
alias sc="script/console"
alias scpro="script/console production"
alias scl="script/console ledger"
