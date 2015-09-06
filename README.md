# `libpam_ssh`

[![Build Status](https://travis-ci.org/coxley/puppet-libpam-ssh.png)](https://travis-ci.org/coxley/puppet-libpam-ssh)

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
* APT via configuring ppa:cpick/pam-ssh-agent-auth

## Usage

Class only takes one argument `$purge_now` which will, on run, ensure all the
resources it normally creates are purged/absent.

## Limitations

Only supports Ubuntu due to using apt::ppa. Pull requests are welcome to add
support.

## Development

Feel free to submit PRs. Just ask that code is puppet-lint compliant.
