autoload -Uz vcs_info
precmd() { vcs_info }

# Define format for Git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '*'
zstyle ':vcs_info:git:*' formats '%b%m '
zstyle ':vcs_info:git:*' actionformats '%12.12i|%a%m '
zstyle ':vcs_info:git*+set-message:*' hooks git-changes

+vi-git-changes() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
     git status --porcelain | grep -E -q '^ ?(M|A|D|R|C|\?)' &>/dev/null
  then
    hook_com[misc]='*'
  else
    hook_com[misc]=''
  fi
}

PROMPT='%F{blue}%1~%f ${vcs_info_msg_0_}❯ '
