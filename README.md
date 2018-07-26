# ASUS ZenBook UX430UA Jack Volume Setup

In the default setup of the ASUS ZenBook UX430UA running Linux, output volume of 3.5 mm jack audio often has a low coefficient, so **audio volume of 3.5 mm devices is scaled down significantly** compared to what it should be. The problem occurs with some delay after plugging-in a 3.5 mm device. So even despite of adjusting sound volume level on the 3.5 mm device, if possible, after plugging this 3.5 mm device in, it's sound volume is very high for a while and then jumps down to the adjusted level, which may be very unpleasant.

The described problem can be solved with this program. The program includes an intelligently designed makefile for easier installation.

## System requirements

* **Linux** operating system
* **systemd** init system
* **Debian** packaging system

### Tested operating systems

* Ubuntu 16.04
* Linux Mint 18.2
* Linux Mint 18.3
* Ubuntu 18.04

## Installation

To **automatically install** the latest stable release of this program, open a terminal emulator and use the following commands:

```sh
cd ~/Downloads/ && # change directory to the 'Downloads' directory
if [ ! -d ux430ua-jack-volume/ ]; then # check if local repository exists
    git clone -q https://gitlab.com/dominiksalvet/ux430ua-jack-volume.git # if not, clone it
fi &&
cd ux430ua-jack-volume/ && # change directory to it
git checkout -q "$(git describe --abbrev=0)" && # checkout the latest release repository
sudo make install-deps && # install dependencies
sudo make install # install the program
```

After the installation, the *~/Downloads/ux430ua-jack-volume* directory won't be required for the program to be working and so it can be removed.

---

If it is required to **automatically uninstall** your current release of this program installed in the default installation directory ([steps](#installation) stated above do so), open a terminal emulator and use the following commands:

```sh
cd ~/Downloads/ && # change directory to the 'Downloads' directory
if [ ! -d ux430ua-jack-volume/ ]; then # check if local repository exists
    git clone -q https://gitlab.com/dominiksalvet/ux430ua-jack-volume.git # if not, clone it
fi &&
cd ux430ua-jack-volume/ && # change directory to it
git checkout -q "$(ux430ua-jack-volume -version)" && # checkout to your program's version release repository
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

This project is licensed under an [Open Source Initiative](https://opensource.org/) approved license, the MIT License. See the [*LICENSE.md*](LICENSE.md) file for details. Individual files contain the [SPDX](https://spdx.org/) license identifier instead of the full license text, and they are always licensed under the license defined by that license identifier even if it differs from the project license.
