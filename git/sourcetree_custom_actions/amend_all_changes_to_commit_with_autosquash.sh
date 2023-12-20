#!/bin/bash

# This script is used as a SourceTree custom action to amend all changes to the selected commit with autosquash.

# !!!IMPORTANT!!!: This will squash all the existing fixup commits respectively.

# SourceTree custom action settings:
# Script to run: ~/.dotfiles/git/sourcetree_custom_actions/create_fixup_commit_then_rebase.sh
# Menu caption: Amend ALL (autosquash)
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

git add .
git commit --fixup $1

# Rebase with autosquash without opening the editor
GIT_SEQUENCE_EDITOR=: git rebase -i --autosquash $(git_main_branch)
