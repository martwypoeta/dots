# Installs missing VS Code extensions and uninstalls unlisted ones. brew bundle
# would reinstall every listed one on each switch, since code can't tell it
# which are outdated.
# Usage: vscode-extensions <id>...

# the code wrapper needs dirname and readlink from macOS
PATH=$PATH:/usr/bin
code="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"

[ -x "$code" ] || exit 0

declare -A wanted
for id in "$@"; do
  wanted[${id,,}]=1
done

declare -A installed
while read -r id; do
  [ -n "$id" ] && installed[${id,,}]=1
done < <("$code" --list-extensions)

missing=()
for id in "${!wanted[@]}"; do
  [ -n "${installed[$id]:-}" ] || missing+=(--install-extension "$id")
done
if [ ${#missing[@]} -gt 0 ]; then
  "$code" "${missing[@]}"
fi

for id in "${!installed[@]}"; do
  if [ -z "${wanted[$id]:-}" ]; then
    # fails for a dependency of a listed extension, which is fine to keep
    "$code" --uninstall-extension "$id" || echo "vscode-extensions: kept $id" >&2
  fi
done
