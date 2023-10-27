# It rebases the current branch to the main branch even if there are uncommitted changes
unalias grbm
grbm() {
  # Check if there are any changes to stash
  if [ -n "$(git status --porcelain)" ]; then
    git stash push --include-untracked
    changes_stashed=true
  fi

  # Rebasing the current branch to the main branch
  git rebase $(git_main_branch)

  # Pop the stash if it was previously stashed
  if [ "$changes_stashed" = true ]; then
    git stash pop
  fi
}
