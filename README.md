# ASUS ZenBook UX430UA Jack Volume Setup

In the default setup of the ASUS ZenBook UX430UA running Linux, output volume of 3.5 mm jack audio often has a low coefficient, so audio volume of 3.5 mm devices is scaled down significantly compared to what it should be. The problem occurs with some delay after plugging-in 3.5 mm device. So even despite of adjusting sound volume level on the 3.5 mm device, if possible, after plugging-in this 3.5 mm device, sound volume is very high for a while and then jumps to the expected level, which may be very unpleasant.

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
sudo make install
```

After the installation, *~/Downloads/ux430ua-jack-volume/* won't be required for the program to be working and so it can be removed. However, it will be still needed in case of uninstalling the program.

---

Provided that *~/Downloads/ux430ua-jack-volume/* still exists, it is possible to **uninstall** the program by opening a terminal emulator and using the following commands:

```sh
cd ~/Downloads/ux430ua-jack-volume/ &&
sudo make uninstall
```

### Choose the installation directory

The default installation directory is */usr/local/bin/*. To change it, pass your desired installation directory path in `INSTALL_DIR` variable to the `sudo make install` command. For example:

```sh
sudo make install INSTALL_DIR=/opt/
```

In case of uninstalling from a custom installation directory, do not forget to use this variable as well.

## License

This project is licensed under an Open Source Initiative approved license, the MIT License. See the [*LICENSE.txt*](LICENSE.txt) file for details. Individual files contain the SPDX license identifier instead of the full license text.
