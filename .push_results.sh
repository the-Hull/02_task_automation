#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_report_files() {
  git checkout master
  git add .
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin-rhydro https://${GH_TOKEN}@github.com/the-Hull/02_task_automation.git
  git push origin-rhydro
}

setup_git
commit_report_files
upload_files
echo "after push"
