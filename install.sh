#!/usr/bin/env bash
#
# Description: Install the firefox-deflector utility in the current system.

set -Eeu

FIREFOX_EXE="/usr/lib/firefox/firefox"
INSTALL_LOCATION="$HOME/.local/bin"
SHORTCUT_LOCATION="$HOME/.local/share/applications"
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

if ! [ -x "$(command -v firefox)" ]; then
    echo 'Error: firefox should be installed and in path.' >&2
    exit 1
fi

if ! [ -x "$FIREFOX_EXE" ]; then
    echo "Error: this tool expects firefox to be installed at $FIREFOX_EXE" >&2
    echo "Please file an issue at https://github.com/murar8/firefox-deflector/issues to receive support."
    exit 1
fi

mkdir -p "$INSTALL_LOCATION" "$SHORTCUT_LOCATION"

ln -sf "$SCRIPT_DIR/firefox-deflector.sh" "$INSTALL_LOCATION/firefox-deflector"
ln -sf "$SCRIPT_DIR/firefox-deflector.desktop" "$SHORTCUT_LOCATION/firefox-deflector.desktop"
