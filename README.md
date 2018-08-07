# ASUS ZenBook UX430UA Jack Volume Setup

In the default setup of the ASUS ZenBook UX430UA running Linux, output volume of 3.5 mm jack audio often has a low coefficient, so **audio volume of 3.5 mm devices is scaled down significantly** compared to what it should be. The problem occurs with some delay after plugging-in a 3.5 mm device. So even despite of adjusting sound volume level on the 3.5 mm device, if possible, after plugging this 3.5 mm device in, it's sound volume is very high for a while and then jumps down to the adjusted level, which may be very unpleasant.

The described problem can be solved with this program. The program includes an intelligently designed makefile for easier installation.

## System requirements

* **Linux** operating system
* **systemd** init system
* **Debian** packaging system
* **ALSA** framework

### Tested operating systems

* Ubuntu 18.04
* Ubuntu 16.04
* Linux Mint 18

## Installation

To **automatically install the latest stable release** of this program, open a terminal emulator and use the following commands:

```sh
cd ~/Downloads/ && # change directory to the 'Downloads' directory
if cd ux430ua-jack-volume/ 2>/dev/null; then # check if local repository exists
    git checkout master && # checkout the master for the pull command
    git pull && # get the most recent state of the repository
    git fetch --tags # in case of any release commit change
else
    git clone https://gitlab.com/dominiksalvet/ux430ua-jack-volume.git && # clone it
    cd ux430ua-jack-volume/ # and change directory to the downloaded repository
fi &&
git checkout "$(git describe --abbrev=0)" && # use the latest repository tag
sudo make install-deps && # install dependencies
sudo make install # install the program
```

After the installation, the *~/Downloads/ux430ua-jack-volume* directory won't be required for the program to be working and so it can be removed.

---

If it is required to **automatically uninstall your current release** of this program installed in the default installation directory ([steps](#installation) stated above do so), open a terminal emulator and use the following commands:

```sh
cd ~/Downloads/ && # change directory to the 'Downloads' directory
if cd ux430ua-jack-volume/ 2>/dev/null; then # check if local repository exists
    git checkout master && # checkout the master for the pull command
    git pull && # get the most recent state of the repository
    git fetch --tags # in case of any release commit change
else
    git clone https://gitlab.com/dominiksalvet/ux430ua-jack-volume.git && # clone it
    cd ux430ua-jack-volume/ # and change directory to the downloaded repository
fi &&
git checkout "$(ux430ua-jack-volume -version)" && # use the program version as a tag
sudo make uninstall # uninstall the program (it doesn't uninstall dependencies)
```

However, it will not work for release 1.0.0 where manual `git checkout 1.0.0` command must be executed before the `sudo make uninstall` command.

### Choose the installation directory

The default installation directory is */usr/local/bin* as it should be included in the `$PATH` variable. However, for the program to work, it is not required that and so to change it, pass your desired installation directory path in `INSTALL_DIR` variable to the `sudo make install` command. For example:

```sh
sudo make install INSTALL_DIR=/opt
```

In case of uninstalling from a custom installation directory, this variable is not required; the uninstaller automatically detects where the installation directory is.

## License

All files of this project are implicitly licensed under an [Open Source Initiative](https://opensource.org/) approved license, the MIT License - see the [*LICENSE.txt*](LICENSE.txt) file for details. Additionally, individual files may contain the [SPDX](https://spdx.org/) license identifier as a shortcut for the full text of a license, and in this case they are always licensed under the license defined by that license identifier even if it differs from the project license.
