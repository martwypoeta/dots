#!/usr/bin/env bash

# vcs.sh
#
# adds all files to version control and checks if the last commit
# is older than a day, if so commits and pushes the changes
#
# created: 01-06-2025
# author: feenko <szymonpel@proton.me>
#
# usage: ./vcs.sh

set -euo pipefail

cd ~/projects/dotfiles
[ -d .git ] || { notify-send "vcs.sh" "Not a Git repository"; exit 1; }

git add --all

if git rev-parse --is-inside-work-tree &>/dev/null && git remote show origin &>/dev/null; then
  last_commit_date=$(git log -1 --format=%ct)
  current_date=$(date +%s)

  if (( current_date - last_commit_date >= 86400 )); then
    git commit -m "configuration sync [auto]" -m "This is a automated commit made to keep repo in sync with local changes."
    git push origin $(git rev-parse --abbrev-ref HEAD)

    notify-send "vcs.sh" "Successfully committed and pushed changes."
  else
    notify-send "vcs.sh" "No new changes to commit (last commit was less than 24 hours ago)."
  fi
else
  notify-send "vcs.sh" "No commits or remote found. Skipping commit."
fi
