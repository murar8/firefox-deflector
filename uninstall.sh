#!/usr/bin/env bash
#
# Description: Remove the firefox-deflector utility from the current system.

set -Eeu

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

rm -rf $HOME/.local/bin/firefox-deflector $HOME/.local/share/applications/firefox-deflector.desktop $SCRIPT_DIR
