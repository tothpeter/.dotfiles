autoload -Uz vcs_info
precmd() { vcs_info }

# Define format for Git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '*'
zstyle ':vcs_info:git:*' formats '%b%u%c%m '
zstyle ':vcs_info:git:*' actionformats '%12.12i|%a%u%c%m '
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
     git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]='*'
  fi
}

PROMPT='%F{blue}%1~%f ${vcs_info_msg_0_}❯ '
