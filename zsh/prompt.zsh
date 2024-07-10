# This generates the following prompt:
# - When in a Git repository:
#   - Normal mode: "{top-level-directory} [{git-branch}] ❯ "
#     - For example: "dotfiles [main] ❯ "
#     - It also adds a star after the branch name if there is any change
#   - Interactive rebase mode: "{top-level-directory} rebase-i > {target-sha} | {picked-commit-name} ❯ "
#     - For example: "dotfiles rebase-i > 1234567890 | Fix typo in README ❯ "
# - When not in a Git repository:
#   - "{top-level-directory} ❯ "
#     - For example: "awesome-project ❯ "

autoload -Uz vcs_info
precmd() { vcs_info }

# Define format for Git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' unstagedstr '*' # Add star after the branch name if there are unstaged changes
zstyle ':vcs_info:*' stagedstr '*' # Add star after the branch name if there are staged changes
zstyle ':vcs_info:git:*' formats '[%b%m] '
zstyle ':vcs_info:git:*' actionformats '%a > %10.10i | %m '
zstyle ':vcs_info:git*+set-message:*' hooks git-changes

+vi-git-changes() {
  # Skip if not in a Git repository
  [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] || return

  hook_com[misc]=''

  # Include the commit subject in the prompt where we paused during the interactive rebase
  commit_line=$(git status | sed -n '3p')
  pattern='^[[:space:]]*(edit|pick)[[:space:]][[:alnum:]]*[[:space:]]'
  if [[ $commit_line =~ $pattern ]]; then
    commit_message=$(echo "$commit_line" | sed -E "s/$pattern//")
    hook_com[misc]="$commit_message"
    return
  fi

  # Do we have any changes?
  if git status --porcelain | grep -E -q '^ ?(M|A|D|R|C|\?)' &>/dev/null; then
    hook_com[misc]='*' # Add star after the branch name if there are changes
  fi
}

PROMPT='%F{blue}%1~%f %F{red}${vcs_info_msg_0_}%f❯ '
