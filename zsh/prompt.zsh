# For more info see the readme

autoload -Uz vcs_info
precmd() { vcs_info }

# Define format for Git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' unstagedstr '*' # Add a star after the branch name if there are unstaged changes
zstyle ':vcs_info:*' stagedstr '*' # Add a star after the branch name if there are staged changes
zstyle ':vcs_info:git:*' formats '[%b%m] '
zstyle ':vcs_info:git:*' actionformats '%a > %6.6i%m '
zstyle ':vcs_info:git*+set-message:*' hooks git-changes

+vi-git-changes() {
  # Skip if not in a Git repository
  [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] || return

  hook_com[misc]=''

  # Include the commit subject in the prompt where we stopped at
  # This is useful when a rebase stops because of conflicts or because
  # the commit was picked for editing
  if [[ -f .git/rebase-merge/message ]]; then
    local -r commit_message=$(head -n 1 .git/rebase-merge/message)
    hook_com[misc]=" | $commit_message"
    return
  fi

  # Do we have any changes?
  if git status --porcelain | grep -E -q '^ ?(M|A|D|R|C|\?)' &>/dev/null; then
    hook_com[misc]='*' # Add star after the branch name if there are changes
  fi
}

PROMPT='%F{blue}%1~%f %F{red}${vcs_info_msg_0_}%f❯ '
