# ASUS ZenBook UX430UA Jack Volume Setup

In the default setup of the ASUS ZenBook UX430UA running Linux, output volume of 3.5 mm jack audio often has a low coefficient, so audio volume of 3.5 mm devices is scaled down significantly compared to what it should be. The problem occurs with some delay after plugging-in a 3.5 mm device. So even despite of adjusting sound volume level on the 3.5 mm device, if possible, after plugging this 3.5 mm device in, it's sound volume is very high for a while and then jumps down to the adjusted level, which may be very unpleasant.

The described problem can be solved with this program. The program includes a smart makefile for easier installation.

## System requirements

* **Linux** operating system
* **systemd** init system
* **APT** package manager

## Installation

To install the current stable release of this program **automatically**, open a terminal emulator and use the following commands:

```sh
cd ~/Downloads/ &&
git clone https://gitlab.com/dominiksalvet/ux430ua-jack-volume.git &&
cd ux430ua-jack-volume/ &&
git checkout 1.0.0 &&
sudo make install
```

After the installation, *~/Downloads/ux430ua-jack-volume/* directory won't be required for the program to be working and so it can be removed.

---

If it is required to **uninstall** the current stable release of this program **automatically**, open a terminal emulator and use the following commands:

```sh
cd ~/Downloads/ &&
if [ ! -d ux430ua-jack-volume/ ]; then
    git clone https://gitlab.com/dominiksalvet/ux430ua-jack-volume.git
fi &&
cd ux430ua-jack-volume/ &&
git checkout 1.0.0 &&
sudo make uninstall
```

### Choose the installation directory

The default installation directory is */usr/local/bin/*. To change it, pass your desired installation directory path in `INSTALL_DIR` variable to the `sudo make install` command. An example follows:

```sh
sudo make install INSTALL_DIR=/opt/
```

In case of uninstalling from a custom installation directory, do not forget to use this variable as well.

## License

This project is licensed under an [Open Source Initiative](https://opensource.org/) approved license, the MIT License. See the [*LICENSE.txt*](LICENSE.txt) file for details. Individual files contain the [SPDX](https://spdx.org/) license identifier instead of the full license text.