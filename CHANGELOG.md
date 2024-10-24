# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- This plugin is now loaded only when a PO file is opened ([#32])
- The `:Po` command is now registered only for buffers with the `po` filetype ([#34])

## [0.2.1] - 2024-10-22

### Fixed

- Fixed a bug of `:Po jump` commands not jumping between fuzzy entries with multiple lines ([#28])

## [0.2.0] - 2024-10-21

### Added

- `:Po jump next` and `:Po jump prev` commands to jump to the next or previous untranslated or fuzzy message ([#18] and [#24])

## [0.1.0] - 2024-10-11

### Added

- Component for [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) which prints the current translation status of the PO file ([#5])

[#34]: https://github.com/toku-sa-n/po.nvim/pull/34
[#32]: https://github.com/toku-sa-n/po.nvim/pull/32
[#28]: https://github.com/toku-sa-n/po.nvim/pull/28
[#24]: https://github.com/toku-sa-n/po.nvim/pull/24
[#18]: https://github.com/toku-sa-n/po.nvim/pull/18
[#5]: https://github.com/toku-sa-n/po.nvim/pull/5
[Unreleased]: https://github.com/toku-sa-n/po.nvim/compare/0.2.1...HEAD
[0.2.1]: https://github.com/toku-sa-n/po.nvim/compare/0.2.0...0.2.1
[0.2.0]: https://github.com/toku-sa-n/po.nvim/compare/0.1.0...0.2.0
[0.1.0]: https://github.com/toku-sa-n/po.nvim/releases/tag/0.1.0
