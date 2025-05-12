#!/usr/bin/env bash

GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
RESET='\033[0m'

log() { echo -e "${1}arch-link: ${RESET}${2}"; }

if [[ ! -f symlinks.map ]]; then
    log "${RED}" "symlinks file not found (symlinks.map)"
    exit 1
fi

while IFS= read -r line || [[ -n "$line" ]]; do
    # check if line is empty
    [[ -z "$line" || "$line" =~ ^[[:space:]]*$ ]] && continue

    # parse current line
    IFS=',' read -r source target <<< "$line"

    # get rid of whitespaces
    source=${source## }
    source=${source%% }
    target=${target## }
    target=${target%% }

    # handle invalid lines
    if [[ -z "$source" || -z "$target" ]]; then
        log "${RED}" "invalid line: '$line'"
        continue
    fi

    if [[ ! -e "$source" ]]; then
        log "${RED}" "source path does not exist: $source"
        continue
    fi

    # convert to absolute paths
    abs_source=$(readlink -f "$source")
    abs_target="${target/\~/$HOME}"
    target_parent=$(dirname "$abs_target")

    # create parent directory if needed
    [[ ! -d "$target_parent" ]] && mkdir -p "$target_parent"

    # check if target exists
    if [[ -e "$abs_target" || -L "$abs_target" ]]; then
        if [[ -L "$abs_target" ]]; then
            current_target=$(readlink "$abs_target")
            if [[ "$current_target" == "$abs_source" ]]; then
                log "${YELLOW}" "symlink already correct: $abs_target -> $abs_source"
                continue
            fi
        fi

        log "${YELLOW}" "target already exists: $abs_target"
        echo -n "==> overwrite? [y/N]: "
        read -r answer < /dev/tty

        [[ "${answer,,}" != "y" ]] && { log "${YELLOW}" "skipping $abs_target"; continue; }

        rm -rf "$abs_target"
    fi

    ln -s "$abs_source" "$abs_target"

    if [[ $? -eq 0 ]]; then
        log "${GREEN}" "created symlink: $abs_target -> $abs_source"
    else
        log "${RED}" "failed to create symlink: $abs_target -> $abs_source"
    fi
done < symlinks.map

log "${CYAN}" "all symlinks created"

