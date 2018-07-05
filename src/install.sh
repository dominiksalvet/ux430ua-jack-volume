#!/bin/bash

#-------------------------------------------------------------------------------
# Copyright (C) 2017-2018 Dominik Salvet
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
SW_REQUIRED='echo [ id cd dirname read grep cat apt chmod sed ln'

# check if some software is missing
for i in $SW_REQUIRED; do
    # software is missing if at least one piece of software is missing
    if ! command -v "$i" > /dev/null; then
        echo "$0: Required software \"$i\" is missing, installation canceled." >&2
        exit 1
    fi
done

#-------------------------------------------------------------------------------
# ENVIRONMENT CHECK
#-------------------------------------------------------------------------------

# check if running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "$0: Please run as root, installation canceled." >&2
    exit 1
fi

# change directory to the script directory
cd -- "$(dirname -- "$0")" || {
    echo "$0: The directory should have been existing, installation canceled." >&2
    exit 1
}

# check if already installed
if [ -f "$1/ux430ua-jack-volume" ]; then
    echo "The program is already installed in \"$1\", installation canceled."
    exit 0
fi

#-------------------------------------------------------------------------------
# FILE DEPENDENCIES
#-------------------------------------------------------------------------------

# regular expression of line containing a successful exit of a shell script
FIND_EXIT_0='^\s*exit\(\|\s\+0\+\)\(\s*\|\s\+#.*\)$'

# check if ux430ua-jack-volume file exists
if [ ! -f ux430ua-jack-volume ]; then
    echo "$0: The \"ux430ua-jack-volume\" file does not exist, installation canceled." >&2
    exit 1
else
    # load ux430ua-jack-volume file content into variable
    ux430ua_jack_volume_string=$(cat ux430ua-jack-volume)
fi

# create "/etc/rc.local" file if it does not exist
if [ ! -f /etc/rc.local ]; then
    echo -e '#!/bin/sh -e\n\nexit 0' > /etc/rc.local
# append a successful exit if it does not contain one
elif ! grep -q -e "$FIND_EXIT_0" /etc/rc.local; then
    echo 'exit 0' >> /etc/rc.local
fi

# set execution permission of the "/etc/rc.local" file
chmod a+x /etc/rc.local

#-------------------------------------------------------------------------------
# INSTALLATION
#-------------------------------------------------------------------------------

# install required package
apt install alsa-tools -y

# apply 3.5 mm jack output volume setup
echo "$ux430ua_jack_volume_string" > "$1/ux430ua-jack-volume"
chmod a+x "$1/ux430ua-jack-volume"
sed -i -e '0,/'"$FIND_EXIT_0"'/s||'"$1"'/ux430ua-jack-volume\n&|' /etc/rc.local
ln -s -- "$1/ux430ua-jack-volume" /lib/systemd/system-sleep/ux430ua-jack-volume

# finished
echo
echo 'Installation finished! In order to apply the changes, reboot your device.'
