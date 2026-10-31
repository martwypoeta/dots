# Hides metrics in OpenUsage. The layout is a json array stored as a <data>
# value, which targets.darwin.defaults can't write.
# Usage: openusage-hide-metrics '["claude.extra", ...]'

# defaults, plutil and xxd come with macOS
PATH=$PATH:/usr/bin
domain=com.robinebers.openusage
hidden=$1

# plutil splits key paths on dots, so the ones in the key name are escaped
layout=$(defaults export "$domain" - | plutil -extract 'openusage\.layout\.v1' raw -o - - 2> /dev/null) || exit 0
layout=$(base64 -d <<< "$layout")

# nothing to do once they are gone, so a switch doesn't rewrite the layout every time
if jq -e --argjson hidden "$hidden" 'any(.[]; .descriptorID | IN($hidden[]))' <<< "$layout" > /dev/null; then
  data=$(jq -c --argjson hidden "$hidden" 'map(select(.descriptorID | IN($hidden[]) | not))' <<< "$layout" | xxd -p -c 0)
  defaults write "$domain" openusage.layout.v1 -data "$data"
fi
