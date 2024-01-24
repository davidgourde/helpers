#!/bin/bash

git remote prune origin;
if [ $# -eq 0 ]; then
	git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -d;
elif [ "$1" = "--dry-run" ] || [ "$1" = "-n" ]; then
	echo "Would delete the following branches..."; echo;
	git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}';
elif [ "$1" = "--force" ] || [ "$1" = "-f" ]; then
	git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -D;
fi
