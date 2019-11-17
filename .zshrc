# Enable Powerlevel10k instant prompt. Should stay at the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set base terminal, with specific terminal for tmux
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

ZSH_DISABLE_COMPFIX=true

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git iterm2 macports man composer zsh-syntax-highlighting zsh-autosuggestions bundler osx rake rvm ruby tmux)

# Tmux plugin settings.
# ZSH_TMUX_AUTOSTART=true

# === Sourse files ===
# for file in $HOME/.oh-my-zsh/custom/*.zsh; do
#   source $file
# done
# source $HOME/.oh-my-zsh/custom/fzf.zsh
source $ZSH/oh-my-zsh.sh
source $HOME/.most.sh
source $HOME/.bin/tmuxinator.zsh
source $ZSH_CUSTOM/themes/.zsh-theme-gruvbox-material-dark

# Path for z integration.
. /usr/local/etc/profile.d/z.sh

# Path for nvm && bash completion.
[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion

# Colorls tab completion.
#source $(dirname $(gem which colorls))/tab_complete.sh

# You may need to manually set your language environment.
# export LANG=en_US.UTF-8

# editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Run Ruby servers by typing 'serve 3000' or 'serveSSL 9001.'
serve () {
  ruby -run -ehttpd -- --port $1
}

serveSSL () {
  ruby -r webrick/https -e "
    WEBrick::HTTPServer.new(
      Port: $1, DocumentRoot: '.', SSLEnable: true, SSLCertName: [%w[CN localhost]]
    ).start
  "
}

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Set dotfiles alias here cause it gets wonky if it's in custom folder.
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Path for mysql
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# Path for yarn.
export PATH="$PATH:/usr/local/Cellar/yarn/1.15.2/bin"
export PATH="$PATH:`yarn global bin`"

#  Path for nvm.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# path for alacrity completions
fpath+=${ZDOTDIR:-~}/.zsh_functions

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Finalize Powerlevel10k instant prompt. Should stay at the bottom of ~/.zshrc.
(( ! ${+functions[p10k-instant-prompt-finalize]} )) || p10k-instant-prompt-finalize
