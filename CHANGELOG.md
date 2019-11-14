# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

The changes not yet present in any release are listed in this section.

### Added

* The support for GitHub Actions CI has been added.

## 2.5.0 (2019-11-09)

### Added

* Support for GitPack's offline mode has been added.

### Changed

* Error messages have been simplified and do not provide possible solutions anymore.

### Fixed

* Tab completion no longer includes `lolek` as a hint.

## 2.4.2 (2019-11-08)

### Changed

* Stop following REUSE Specification - Version 3.0.

## 2.4.1 (2019-10-15)

### Fixed

* Tab completion is no longer able to prevent from launching a terminal emulator.

## 2.4.0 (2019-07-04)

### Added

* Support for [GitPack](https://github.com/dominiksalvet/gitpack).

### Removed

* Support for gim has been removed.
* *Makefile* has been removed.

## 2.3.1 (2019-05-20)

### Changed

* Move from GitLab to GitHub.

## 2.3.0 (2019-04-17)

### Added

* The native support for gim 7.0.0 has been added.

### Changed

* Make default target does not have any effect.

## 2.2.1 (2019-01-12)

### Changed

* No output is generated if the installation is successful.

## 2.2.0 (2018-11-27)

### Added

* Add support for TAB completion for bash shell of all possible arguments.

## 2.1.0 (2018-10-09)

### Added

* The changes are again applied immediately after the installation due to recent gim changes in the installation process.

### Changed

* Installation/uninstallation process no longer prints make recipes before executing them.

## 2.0.3 (2018-09-19)

### Fixed

* Stop applying audio volume scaling immediately after the installation using makefile because gim hasn't copied the configuration files yet.

## 2.0.2 (2018-09-17)

### Fixed

* When uninstalling, only lines calling the program from supplied installation directory are removed from the */etc/rc.local* file.

## 2.0.1 (2018-09-06)

### Fixed

* The installation directory path is defined in one place, in the *makefile* file.

## 2.0.0 (2018-09-04)

### Changed

* The project is [gim](https://github.com/dominiksalvet/gim) complaint and so it uses a new installation manager.

### Removed

* Support for custom installation directory due to gim compliance. The used installation directory is `/usr/local/bin`.

## 1.3.0 (2018-08-15)

### Added

* Check for character device file */dev/snd/hwC0D0* existence.
* Support relative paths across all delivered software with the program and within the program itself.

### Changed

* The installation manager now creates a configuration file */etc/ux430ua-jack-volume/install-dir* where the installation directory path is stored rather than parsing the */etc/rc.local* file.
* The program is quiet when no error.
* This project licensing policy is compliant with [REUSE Practices](https://reuse.software/practices/2.0/).
* The *README.md* file is [Standard-Readme](https://github.com/RichardLitt/standard-readme) compliant.

## 1.2.3 (2018-07-24)

### Fixed

* Path with spaces in systemd caller is allowed.

## 1.2.2 (2018-07-20)

### Added

* Check dependencies in the `ux430ua-jack-volume` program.

### Fixed

* The uninstaller no longer uninstalls all programs with the following pattern `'$INSTALL_DIR/ux430ua-jack-volume'*` in the */etc/rc.local* file.
* Installation manager no longer detects the installation directory from the */etc/rc.local* based on searching first match to `ux430ua-jack-volume`.

## 1.2.1 (2018-07-17)

### Fixed

* There is no more error message when the */etc/rc.local* file doesn't exist before the installation.
* The `post` parameter from the systemd after waking up from sleep no longer prevents the program from it's execution.

## 1.2.0 (2018-07-16)

### Changed

* Installation has been split into dependency installation and the program installation.
* All restrictions of the installation directory path format have been removed. So now it can also contain '|'.
* Check if running as root is done at the last minute, so more information is accessible without root permissions.
* The uninstallation detects the installation directory from the */etc/rc.local* file, so no more `INSTALL_DIR` parameter is required even with a custom installation directory.

### Fixed

* If passed a custom installation directory path, it must be absolute.
* Previous installation of the program can be detected during installation even if the program is installed in a different directory than the one defined by `INSTALL_DIR`.

## 1.1.0 (2018-07-10)

### Added

* The program prints only version using the `-version` option.

### Changed

* No need of restart device after the installation, changes are applied immediately.

## 1.0.0 (2018-07-08)

### Changed

* All scrips use SH environment instead of previously used BASH.

### Fixed

* The installation directory path can contain spaces.
