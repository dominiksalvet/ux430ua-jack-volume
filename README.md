# ASUS ZenBook UX430UA Jack Volume Setup *(ux430ua-jack-volume)*

> Fix low 3.5 mm jack output audio volume of ASUS ZenBook UX430UA on Linux.

In the default setup of the ASUS ZenBook UX430UA running some Linux distributions, output volume of 3.5 mm jack audio has a low coefficient, so **audio volume of 3.5 mm devices is scaled down significantly** compared to what it should be. The problem occurs with some delay after plugging-in a 3.5 mm device. So even despite of adjusting sound volume level on the 3.5 mm device, if possible, after plugging this 3.5 mm device in, it's sound volume is very high for a while and then jumps down to the adjusted level, which may be very unpleasant.

The described problem can be solved with this project. The project uses an intelligent installation manager.

## Table of Contents

* [Install](#install)
  * [System requirements](#system-requirements)
  * [Tested operating systems](#tested-operating-systems)
  * [Instructions](#instructions)
* [Usage](#usage)
* [Contribute](#contribute)
* [License](#license)

## Install

### System requirements

* **Linux** operating system
* **systemd** init system
* **Debian** packaging system
* **ALSA** framework

### Tested operating systems

* Ubuntu 16.04
* Linux Mint 18.3
* Linux Mint 18.2

### Instructions

This project is [gim](https://gitlab.com/dominiksalvet/gim) compliant since version 2.0.0. And so to **automatically install it's latest stable release**, open a terminal emulator and use the following command:

```sh
sudo gim install https://gitlab.com/dominiksalvet/ux430ua-jack-volume.git
```

If it is required to **automatically uninstall your current release** with version 2.0.0 and higher, use the following command:

```sh
sudo gim uninstall https://gitlab.com/dominiksalvet/ux430ua-jack-volume.git
```

To **automatically update the project** from version 2.0.0 and higher to **it's latest version**, use the following command:

```sh
sudo gim update https://gitlab.com/dominiksalvet/ux430ua-jack-volume.git
```

---

If it is required to **update or uninstall project, whose version is lower than 2.0.0**, see the [README.md](https://gitlab.com/dominiksalvet/ux430ua-jack-volume/blob/1.3.0/README.md) file of the 1.3.0 version, last version with previously used installation management system.

## Usage

The program is executed after the installation for the first time. Then, **it is automatically executed whenever necessary** to keep the effect of permanent change. Nevertheless, it is possible to apply changes manually by running it as shown:

```sh
sudo ux430ua-jack-volume
```

## Contribute

See the [*CONTRIBUTING.md*](CONTRIBUTING.md) file for details.

## License

Licensing policy of this project is compliant with [REUSE Practices](https://reuse.software/practices/2.0/). Therefore, the license of a file of this project is determined by a [SPDX](https://spdx.org/) License Identifier or by the [*debian/copyright*](debian/copyright) file content.
