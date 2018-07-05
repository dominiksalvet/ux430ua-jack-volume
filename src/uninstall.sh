#!/bin/bash

#-------------------------------------------------------------------------------
# Copyright (C) 2018 Dominik Salvet
# SPDX-License-Identifier: MIT
# <https://gitlab.com/dominiksalvet/ux430ua-jack-volume>
#-------------------------------------------------------------------------------
# PARAMETERS:
#   $1 - installation directory path
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
        echo "$0: Required software \"$i\" is missing, uninstallation canceled." >&2
        exit 1
    fi
done

#-------------------------------------------------------------------------------
# ENVIRONMENT CHECK
#-------------------------------------------------------------------------------

# check if running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "$0: Please run as root, uninstallation canceled." >&2
    exit 1
fi

# check if installed
if [ ! -f "$1/ux430ua-jack-volume" ]; then
    echo "The program is not installed in \"$1\", uninstallation canceled."
    exit 0
fi

#-------------------------------------------------------------------------------
# UNINSTALLATION
#-------------------------------------------------------------------------------

# revert 3.5 mm jack output volume setup
rm -f /lib/systemd/system-sleep/ux430ua-jack-volume
sed -i -e '\!^[^#]*'"$1"'/ux430ua-jack-volume\(\|\s.*\)$!d' /etc/rc.local
rm -f -- "$1/ux430ua-jack-volume"

# finished
echo
echo 'Uninstallation finished! In order to apply the changes, reboot your device.'
