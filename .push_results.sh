#!/bin/sh


GH_REPO="@github.com/the-hull/02_task_automation.git"

FULL_REPO="https://$GH_TOKEN$GH_REPO"


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


  git push --force --quiet $FULL_REPO master

}

setup_git
commit_report_files
upload_files
echo "after push"
