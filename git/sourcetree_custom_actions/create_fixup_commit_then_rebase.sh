#!/bin/bash

# This script is used in SourceTree as a custom action to create a fixup commit
# then immediately rebase with autosquash.
# I use this to add changes to an existing commit without having to manually
# rebase and squash.

# SourceTree passes the $SHA as a parameter to this script

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

# Rebase with autosquash
GIT_SEQUENCE_EDITOR=: git rebase -i --autosquash $(git_main_branch)

# Pop the stash if it was previously stashed
if [ "$changes_stashed" = true ]; then
  git stash pop
fi
