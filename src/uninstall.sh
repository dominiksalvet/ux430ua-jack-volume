#!/bin/sh

#-------------------------------------------------------------------------------
# Copyright (C) 2018 Dominik Salvet
# SPDX-License-Identifier: MIT
# <https://gitlab.com/dominiksalvet/ux430ua-jack-volume>
#-------------------------------------------------------------------------------
# PARAMETERS:
#   $1 - unnormalized installation directory path
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# SOFTWARE DEPENDENCIES
#-------------------------------------------------------------------------------

# list of required software
SW_REQUIRED='echo [ rm sed'

# check if some software is missing
for i in $SW_REQUIRED; do
    # software is missing if at least one piece of software is missing
    if ! command -v "$i" > /dev/null; then
        echo "$0: Required software '$i' is missing, uninstallation canceled." >&2
        exit 1
    fi
done

#-------------------------------------------------------------------------------
# DEFINITIONS
#-------------------------------------------------------------------------------

# normalize a path and remove the last slash
NORMALIZE_PATH='s|/\+|/|g;s|\([^/]*\)/*$|\1|'

# normalize the '$1' argument
INSTALL_DIR=$(echo "$1" | sed -e "$NORMALIZE_PATH")

#-------------------------------------------------------------------------------
# CHECK ENVIRONMENT
#-------------------------------------------------------------------------------

# check if running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "$0: Please run as root, uninstallation canceled." >&2
    exit 1
fi

# check if given installation directory path doesn't contain illegal characters
case "$INSTALL_DIR" in
    *\|*)
        echo "$0: '$INSTALL_DIR/' contains '|', uninstallation canceled." >&2
        exit 1
        ;;
esac

# check if installed
if [ ! -f "$INSTALL_DIR/ux430ua-jack-volume" ]; then
    echo "The program is not installed in '$INSTALL_DIR/', uninstallation canceled."
    exit 0
fi

#-------------------------------------------------------------------------------
# UNINSTALLATION
#-------------------------------------------------------------------------------

# revert 3.5 mm jack output volume setup
rm -f /lib/systemd/system-sleep/ux430ua-jack-volume
sed -i -e '\|^[^#]*'"'$INSTALL_DIR"'/ux430ua-jack-volume'"'"'|d' /etc/rc.local
rm -f -- "$INSTALL_DIR/ux430ua-jack-volume"

# final message
echo
echo 'Uninstallation finished! In order to apply the changes, reboot your device.'
