#!/bin/bash

# This script is used as a SourceTree custom action to amend all changes to the selected commit with autosquash.

# !!!IMPORTANT!!!: This will squash all the existing fixup commits respectively.

# SourceTree custom action settings:
# Menu caption: Amend ALL (autosquash)
# Script to run: ~/.dotfiles/git/sourcetree_custom_actions/create_fixup_commit_then_rebase.sh
# Parameters: $SHA

git add .
git commit --fixup $1

# Rebase with autosquash without opening the editor
GIT_SEQUENCE_EDITOR=: git rebase -i --autosquash $1^
