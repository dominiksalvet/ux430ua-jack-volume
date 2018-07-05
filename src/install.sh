#!/bin/sh

#-------------------------------------------------------------------------------
# Copyright (C) 2017-2018 Dominik Salvet
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
SW_REQUIRED='echo [ id cd dirname grep cat apt chmod sed ln'

# check if some software is missing
for i in $SW_REQUIRED; do
    # software is missing if at least one piece of software is missing
    if ! command -v "$i" > /dev/null; then
        echo "$0: Required software '$i' is missing, installation canceled." >&2
        exit 1
    fi
done

#-------------------------------------------------------------------------------
# DEFINITIONS
#-------------------------------------------------------------------------------

# script's parent directory path
SCRIPT_DIR="$(dirname -- "$0")"

# normalize a path and remove the last slash
NORMALIZE_PATH='s|/\+|/|g;s|\([^/]*\)/*$|\1|'

# normalize the '$1' argument
INSTALL_DIR=$(echo "$1" | sed -e "$NORMALIZE_PATH")

# regular expression of line containing a successful exit of a shell script
FIND_EXIT_0='^\s*exit\(\|\s\+0\+\)\(\s*\|\s\+#.*\)$'

#-------------------------------------------------------------------------------
# CHECK ENVIRONMENT
#-------------------------------------------------------------------------------

# check if running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "$0: Please run as root, installation canceled." >&2
    exit 1
fi

# check if given installation directory exists
if [ ! -d "$INSTALL_DIR/" ]; then
    echo "$0: '$INSTALL_DIR/' doesn't exist, installation canceled." >&2
    exit 1
fi

# check if already installed
if [ -f "$INSTALL_DIR/ux430ua-jack-volume" ]; then
    echo "The program is already installed in '$INSTALL_DIR/', installation canceled."
    exit 0
fi

# change directory to the script directory
cd -- "$SCRIPT_DIR/" || {
    echo "$0: '$SCRIPT_DIR/' should have been existing, installation canceled." >&2
    exit 1
}

#-------------------------------------------------------------------------------
# FILE DEPENDENCIES
#-------------------------------------------------------------------------------

# check if ux430ua-jack-volume file exists
if [ ! -f ux430ua-jack-volume ]; then
    echo "$0: '$SCRIPT_DIR/ux430ua-jack-volume' does not exist, installation canceled." >&2
    exit 1
else
    # load ux430ua-jack-volume file content into variable
    ux430ua_jack_volume_string=$(cat ux430ua-jack-volume)
fi

# create '/etc/rc.local' if it does not exist
if [ ! -f /etc/rc.local ]; then
    echo '#!/bin/sh -e

exit 0' > /etc/rc.local
# append a successful exit if it does not contain one
elif ! grep -q -e "$FIND_EXIT_0" /etc/rc.local; then
    echo 'exit 0' >> /etc/rc.local
fi

# set the execution permission of '/etc/rc.local'
chmod a+x /etc/rc.local

#-------------------------------------------------------------------------------
# INSTALLATION
#-------------------------------------------------------------------------------

# install required package to control the sound volume
apt install alsa-tools -y || exit 1

# apply 3.5 mm jack output volume setup
echo "$ux430ua_jack_volume_string" > "$INSTALL_DIR/ux430ua-jack-volume"
chmod a+x "$INSTALL_DIR/ux430ua-jack-volume"
sed -i -e '0,/'"$FIND_EXIT_0"'/s||'"$INSTALL_DIR"'/ux430ua-jack-volume\n&|' /etc/rc.local
ln -s -- "$INSTALL_DIR/ux430ua-jack-volume" /lib/systemd/system-sleep/ux430ua-jack-volume

# final message
echo
echo 'Installation finished! In order to apply the changes, reboot your device.'
