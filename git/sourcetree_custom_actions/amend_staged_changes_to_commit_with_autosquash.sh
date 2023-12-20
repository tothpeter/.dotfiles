#!/bin/bash

# This script is used as a SourceTree custom action to amend staged changes to the selected commit with autosquash.

# !!!IMPORTANT!!!: This will squash all the existing fixup commits respectively.

# SourceTree custom action settings:
# Script to run: ~/.dotfiles/git/sourcetree_custom_actions/amend_staged_changes_to_commit_with_autosquash.sh
# Menu caption: Amend staged (autosquash)
# Parameters: $SHA

git_main_branch () {
	command git rev-parse --git-dir &> /dev/null || return
	local ref
	for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk,mainline,default,master}
	do
		if command git show-ref -q --verify $ref
		then
			echo ${ref:t}
			return 0
		fi
	done
	echo master
	return 1
}

git commit --fixup $1

# Check if there are any changes to stash
if [ -n "$(git status --porcelain)" ]; then
  git stash push --include-untracked
  changes_stashed=true
fi

# Rebase with autosquash without opening the editor
GIT_SEQUENCE_EDITOR=: git rebase -i --autosquash $(git_main_branch)

# Pop the last stash if we stashed changes previously
if [ "$changes_stashed" = true ]; then
  git stash pop
fi
