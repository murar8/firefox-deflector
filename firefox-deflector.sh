#!/usr/bin/env bash
#
# Description:  Proxy for the firefox executable that uses
#               the currently running profile.
#
# Usage:        firefox-deflector.sh [URI]

set -Eeu

FIREFOX_EXE="/usr/lib/firefox/firefox"

RUNNING_INSTANCES="$(
    ps -F -u $UID |
        tr -s " " |
        cut -d " " -f 11- |
        grep -P "^$FIREFOX_EXE" |
        grep -Pv '\-childID \d+|\-contentproc' ||
        :
)"

RUNNING_PROFILE_NAME="$(
    echo "$RUNNING_INSTANCES" |
        grep -Po '(?<=\-P)\s+\w+\s+' |
        head -n 1 |
        awk '{$1=$1};1' ||
        :
)"

RUNNING_PROFILE_PATH="$(
    echo "$RUNNING_INSTANCES" |
        grep -Po '(?<=\-profile) (\/[^\/|\s]+)+' |
        head -n 1 |
        awk '{$1=$1};1' ||
        :
)"

if [ -n "$RUNNING_PROFILE_NAME" ]; then
    $FIREFOX_EXE -P "$RUNNING_PROFILE_NAME" $@
elif [ -n "$RUNNING_PROFILE_PATH" ]; then
    $FIREFOX_EXE -profile "$RUNNING_PROFILE_PATH" $@
else
    $FIREFOX_EXE $@
fi
