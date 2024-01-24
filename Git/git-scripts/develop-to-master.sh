#!/bin/bash

git checkout develop
git pull
git checkout master
git pull
git branch -D merge-develop-to-master
git checkout -b merge-develop-to-master
git merge develop -m 'Merge branch develop into master'
git diff develop --quiet
if [[ $? -ne 0 ]]; then
  echo "ERROR: merge-develop-to-master is different than develop"
else
  echo "Merge Successful"
fi