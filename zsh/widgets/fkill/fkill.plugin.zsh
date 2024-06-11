# Use fzf to kill proccesses

fkill_widget() {
  sh $DOTFILES/zsh/widgets/fkill/script
  zle reset-prompt
}

zle -N fzf-redraw-prompt # give me my $PS1 back
zle -N fkill_widget

bindkey '^k'  fkill_widget # ctrl+k
