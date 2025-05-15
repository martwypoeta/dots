#!/usr/bin/env bash

CYAN='\033[1;36m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
RESET='\033[0m'

PROGRAM_NAME='link.sh'

log() { echo -e "${CYAN}${PROGRAM_NAME}: ${RESET}${1}"; }
success() { echo -e "${GREEN}${PROGRAM_NAME}: ${RESET}${1}"; }
warn() { echo -e "${YELLOW}${PROGRAM_NAME}: ${RESET}${1}"; }
error() { echo -e "${RED}${PROGRAM_NAME}: ${RESET}${1}"; }

MAP_FILE=$(find . .. -name "symlinks.map" -print -quit)
if [[ -z "$MAP_FILE" || ! -f "$MAP_FILE" ]]; then
    error "symlinks.map file not found"
    exit 1
fi

mapfile -t lines < "$MAP_FILE"

for line_number in "${!lines[@]}"; do
    line="${lines[$line_number]}"

    [[ -z "$line" || "$line" =~ ^#|^[[:space:]]*$ ]] && continue

    read -r source target <<< "$line"

    source=${source//[$'\t\r\n ']/}
    target=${target//[$'\t\r\n ']/}

    if [[ -z "$source" || -z "$target" ]]; then
        error "error on line $((line_number + 1)): invalid mapping"
        exit 1
    fi

    if [[ ! -e "$source" ]]; then
        error "error on line $((line_number + 1)): invalid source"
        continue
    fi

    abs_source=$(realpath "$source")
    abs_target="${target/\~/$HOME}"
    target_parent=$(dirname "$abs_target")

    [[ ! -d "$target_parent" ]] && mkdir -p "$target_parent"

    if [[ -e "$abs_target" || -L "$abs_target" ]]; then
        if [[ -L "$abs_target" && "$(readlink "$abs_target")" == "$abs_source" ]]; then
            warn "symlink already correct: $abs_target -> $abs_source"
            continue
        fi

        warn "target exists: $abs_target"
        echo -n "==> Overwrite? [y/N]: "
        read -r answer
        [[ "${answer,,}" != "y" ]] && { warn "skipping $abs_target"; continue; }

        rm -rf "$abs_target"
    fi

    if ln -s "$abs_source" "$abs_target"; then
        success "created symlink: $abs_target -> $abs_source"
    else
        error "failed to create symlink: $abs_target -> $abs_source"
    fi
done

log "all symlinks created"

