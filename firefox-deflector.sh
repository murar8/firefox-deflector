#!/usr/bin/env bash
#
# Description:  Proxy for the firefox executable that uses
#               the currently running profile.
#
# Usage:        firefox-deflector.sh [URI]

set -Eeu

FIREFOX_EXE="/usr/lib/firefox/firefox"

PROFILE_FLAGS=(-P -profile)

RUNNING_INSTANCES="$(
    ps -F -u $UID |
        tr -s " " |
        cut -d " " -f 11- |
        grep -P "^$FIREFOX_EXE" |
        grep -Pv '\-childID \d+|\-contentproc' ||
        :
)"

echo "$RUNNING_INSTANCES" | while IFS= read -r instance; do
    for flag in "${PROFILE_FLAGS[@]}"; do
        if [[ $instance =~ ${FIREFOX_EXE}[[:space:]]+${flag}[[:space:]]+([^[:space:]]+) ]]; then
            $FIREFOX_EXE "$flag" "${BASH_REMATCH[1]}" $@
            exit 0
        fi
    done
done

$FIREFOX_EXE $@
