# `libpam_ssh`

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What libpam-ssh affects](#what-libpam_ssh-affects)
4. [Usage](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Installs and configures libpam-ssh for authenticating sudo via forwarded SSH
agent on Debian-like systems.

## Module Description

Installs libpam-ssh, manages /etc/pam.d/sudo and adds line to /etc/sudoers.

## Setup

### What `libpam_ssh` affects

* `/etc/pam.d/sudo`
* `/etc/sudoers` (appending a line with stdlib `file_line` resource

## Usage

Class currently takes no arguments, so declaring with include will work fine

## Limitations

Don't have support (no reference installs) for EL platforms.

## Development

Feel free to submit PRs. Just ask that code is puppet-lint compliant.
