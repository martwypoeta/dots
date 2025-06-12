#!/usr/bin/bash
set -euo pipefail

cd ~/projects/dotfiles || exit 1
[ -d .git ] || { notify-send "vcs.sh" "Not a Git repository"; exit 1; }

git add --all

if git rev-parse --is-inside-work-tree &>/dev/null && git remote show origin &>/dev/null; then
  last=$(git log -1 --format=%ct)
  now=$(date +%s)

  if (( now - last >= 86400 )); then
    git commit -m "configuration sync [auto]" -m "This is a automated commit made to keep repo in sync with local changes."
    git push origin "$(git rev-parse --abbrev-ref HEAD)"
    notify-send "Chezmoi" "Successfully committed and pushed changes."
  else
    notify-send "Chezmoi" "No new changes to commit (last commit was < 24h ago)."
  fi
else
  notify-send "Chezmoi" "No commits or remote found. Skipping commit."
fi
