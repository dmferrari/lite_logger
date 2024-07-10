# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2024-05-24

- Initial release

## [0.1.1] - 2024-05-24

- Added Version Badge to README.md
- Updated .gitignore file to avoid pushing .gem files

## [0.1.2] - 2024-05-29

- Updated README.md with installation instructions and usage example.
- Updated .gitignore file to avoid pushing development support files.

## [0.1.3] - 2024-06-12

- Added missing log/ directory that was causing the specs to fail.

## [0.1.4] - 2024-07-09

- Remove duplicated call to `Time.now`

## [0.1.5] - 2024-07-10

- Bug fix: Remove uninitialized constant LiteLogger::Logger::StringIO
- Readme updated with example on how to log to a file.
