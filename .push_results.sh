#!/bin/bash


rm -rf .git/
git init

GH_REPO="@github.com/the-Hull/02_task_automation.git"

FULL_REPO="https://$GH_TOKEN$GH_REPO"

git config user.name "rmflight-travis"
git config user.email "travis"

git add .


git commit -m "deployed from travis"
git push --force --quiet $FULL_REPO
