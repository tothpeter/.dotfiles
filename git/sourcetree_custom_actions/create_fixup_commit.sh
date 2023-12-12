#!/bin/bash

# This script is used in SourceTree as a custom action to create a fixup commit
# to the selected commit.

# SourceTree passes the $SHA as a parameter to this script

git commit --fixup $1
