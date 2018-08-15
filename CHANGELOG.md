# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html). Individual releases can be obtained using the [tags](https://gitlab.com/dominiksalvet/ux430ua-jack-volume/tags). Changes between their files can be viewed using the [compare](https://gitlab.com/dominiksalvet/ux430ua-jack-volume/compare).

## Unreleased

The changes not yet present in any release are listed in this section.

## 1.3.0 (2018-08-15)

### Added

* Check for character device file */dev/snd/hwC0D0* existence.
* Support relative paths across all delivered software with the program and within the program itself.

### Changed

* The installation manager now creates a configuration file */etc/ux430ua-jack-volume/install-dir* where the installation directory path is stored rather than parsing the */etc/rc.local* file.
* The program is quiet when no error.
* This project licensing policy is compliant with [REUSE Practices](https://reuse.software/practices/2.0/).
* The [*README.md*](README.md) file is [Standard-Readme](https://github.com/RichardLitt/standard-readme) compliant.

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
