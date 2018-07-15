# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html). Individual releases can be obtained using the [tags](https://gitlab.com/dominiksalvet/ux430ua-jack-volume/tags).

## Unreleased

The changes not yet present in any release are listed in this section.

### Fixed

* If passed a custom installation directory path, it must be absolute.

### Changed

* Installation has been split into dependency installation and the program installation.
* All restrictions of the installation directory path format have been removed. So now it can also contain '|'.

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
