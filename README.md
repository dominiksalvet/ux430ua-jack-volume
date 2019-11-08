# ux430ua-jack-volume

[![GitPack](https://img.shields.io/badge/-GitPack-571997)](https://github.com/dominiksalvet/gitpack)
[![standard-readme compliant](https://img.shields.io/badge/readme_style-standard-brightgreen.svg)](https://github.com/RichardLitt/standard-readme)

> Fix low volume of ASUS ZenBook UX430UA running Linux.

In the default setup of the ASUS ZenBook UX430UA while running some Linux distributions, output volume of 3.5 mm jack audio has a low coefficient, so **audio volume of 3.5 mm devices is scaled down significantly** compared to what it should be on the selected sound volume. The problem occurs after booting up the system with a 3.5 mm jack plugged in or in a second after plugging it in while the system is running. So even despite of adjusting sound volume level for 3.5 mm devices, if possible, after plugging a 3.5 mm device in, its sound volume would be very high for a moment and then jumps down to the prepared level, which may be very unpleasant.

The described problems can be solved with this project.

## Table of Contents

* [Install](#install)
  * [Software requirements](#software-requirements)
  * [Instructions](#instructions)
* [Usage](#usage)
* [Contributing](#contributing)
* [License](#license)

## Install

### Software requirements

* **systemd** init system
  * The rc.local service must be enabled.
* **hda-verb** command
  * If your system has `apt-get`, it will be installed automatically.

### Instructions

This project uses [GitPack](https://github.com/dominiksalvet/gitpack). Global installation/update:

```sh
sudo gitpack install github.com/dominiksalvet/ux430ua-jack-volume
```

## Usage

The program is executed after the installation for the first time. Then, **it is automatically executed whenever necessary** to keep the effect of permanent change. Nevertheless, it is possible to apply changes manually by running it as shown:

```sh
sudo ux430ua-jack-volume
```

## Contributing

See the [*CONTRIBUTING.md*](CONTRIBUTING.md) file for details.

## License

This project is licensed under the [MIT License](LICENSE).
