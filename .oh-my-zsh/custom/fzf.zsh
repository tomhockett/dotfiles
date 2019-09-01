export FZF_DEFAULT_COMMAND='
rg --files              \
   --files-with-matches \
   --follow             \
   --hidden             \
   --line-number        \
   --no-ignore-vcs      \
   --smart-case
'

bindkey '^P' fzf-file-widget
bindkey '^Y' fzf-history-widget
bindkey '^D' fzf-cd-widget
