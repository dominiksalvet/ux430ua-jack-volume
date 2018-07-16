# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html). Individual releases can be obtained using the [tags](https://gitlab.com/dominiksalvet/ux430ua-jack-volume/tags).

## Unreleased

The changes not yet present in any release are listed in this section.

## 1.2.1 (2018-07-17)

### Fixed

* There is no more error message when '/etc/rc.local' doesn't exist before the installation.
* The `post` parameter from the systemd after waking up from sleep no longer prevents the program from it's execution.

## 1.2.0 (2018-07-16)

### Fixed

* If passed a custom installation directory path, it must be absolute.
* Previous installation of the program can be detected during installation even if the program is installed in a different directory than the one defined by `INSTALL_DIR`.

### Changed

* Installation has been split into dependency installation and the program installation.
* All restrictions of the installation directory path format have been removed. So now it can also contain '|'.
* Check if running as root is done at the last minute, so more information is accessible without root permissions.
* The uninstallation detects the installation directory from the */etc/rc.local* file, so no more `INSTALL_DIR` parameter is required even with a custom installation directory.

## 1.1.0 (2018-07-10)

### Changed

* No need of restart device after the installation, changes are applied immediately.

### Added

* The program prints only version using the `-version` option.

## 1.0.0 (2018-07-08)

### Fixed

* The installation directory path can contain spaces.

### Changed

* All scrips use SH environment instead of previously used BASH.
