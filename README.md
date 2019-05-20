# ux430ua-jack-volume

[![gim ready](https://img.shields.io/badge/gim-ready-571997.svg)](https://github.com/dominiksalvet/gim)
[![reuse compliant](https://reuse.software/badge/reuse-compliant.svg)](https://reuse.software/)
[![standard-readme compliant](https://img.shields.io/badge/readme_style-standard-brightgreen.svg)](https://github.com/RichardLitt/standard-readme)

> Fix low volume of ASUS ZenBook UX430UA running Linux.

In the default setup of the ASUS ZenBook UX430UA while running some Linux distributions, output volume of 3.5 mm jack audio has a low coefficient, so **audio volume of 3.5 mm devices is scaled down significantly** compared to what it should be on the selected sound volume. The problem occurs after booting up the system with a 3.5 mm jack plugged in or in a second after plugging it in while the system is running. So even despite of adjusting sound volume level for 3.5 mm devices, if possible, after plugging a 3.5 mm device in, its sound volume would be very high for a moment and then jumps down to the prepared level, which may be very unpleasant.

The described problems can be solved with this project. The project is easy to install.

## Table of Contents

* [Install](#install)
  * [Software requirements](#software-requirements)
  * [Tested operating systems](#tested-operating-systems)
  * [Instructions](#instructions)
* [Usage](#usage)
* [Contribute](#contribute)
* [License](#license)

## Install

### Software requirements

* **Linux** operating system
* **systemd** init system
* **Debian** packaging system
* **ALSA** framework

### Tested operating systems

* Ubuntu 18.04
* Ubuntu 16.04
* Linux Mint 18.3
* Linux Mint 18.2

### Instructions

This project is [gim](https://github.com/dominiksalvet/gim) ready **since version 2.0.0**. Install it by:

```sh
sudo gim install github.com/dominiksalvet/ux430ua-jack-volume
```

---

If it is required to work with project, whose **version is lower than 2.0.0**, see the [README.md](https://github.com/dominiksalvet/ux430ua-jack-volume/blob/1.3.0/README.md) file of the 1.3.0 version, the latest version with previously used installation system.

## Usage

The program is executed after the installation for the first time. Then, **it is automatically executed whenever necessary** to keep the effect of permanent change. Nevertheless, it is possible to apply changes manually by running it as shown:

```sh
sudo ux430ua-jack-volume
```

## Contributing

See the [*CONTRIBUTING.md*](CONTRIBUTING.md) file for details.

## License

Licensing policy of this project is compliant with [REUSE Practices](https://reuse.software/practices/2.0/).

The preferred license is the **MIT License** as stated in the [*LICENSE.txt*](LICENSE.txt) file.
