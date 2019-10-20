export FZF_DEFAULT_COMMAND='
rg --files              \
   --files-with-matches \
   --follow             \
   --hidden             \
   --line-number        \
   --no-ignore-vcs      \
   --smart-case
'

# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS='
--bind ctrl-f:page-down,ctrl-b:page-up
--ansi
--color fg:-1,bg:-1,hl:#81A1C1
--color fg+:-1,bg+:-1,hl+:#8FBCBB
--color info:-1,prompt:#A3BE8C,pointer:#8FBCBB,marker:#EBCB8B,spinner:#EBCB8B,header:-1
'

bindkey '^P' fzf-file-widget
bindkey '^Y' fzf-history-widget
bindkey '^D' fzf-cd-widget

# Kill a process
# Type fk to get a list of running processes
# enter will kill the selected process
fk() {
  local pid=$(ps -ef | sed 1d | fzf-tmux -m | awk '{print $2}')

  if [[ $pid ]]; then
    kill -${1:-9} $pid
  fi
}

# RVM integration
frb() {
  local rb
  rb=$((echo system; rvm list | grep ruby | cut -c 4-) |
       awk '{print $1}' |
       fzf-tmux -l 30 +m --reverse) && rvm use $rb
}

# tm - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)
# `tm` will allow you to select your tmux session via fzf.
# `tm irc` will attach to the irc session (if it exists), else it will create it.

tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

# fh - repeat history
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -r 's/ *[0-9]*\*? *//' | sed -r 's/\\/\\\\/g')
}
