# == Class: libpam_ssh
#
# Sets up libpam-ssh-agent/pam_ssh_agent_auth.
#
# This module does require sole management of /etc/pam.d/sudo and will add a
# line to /etc/sudoers.
#
# === Parameters
#
# [*purge_now*]
# Set this to remove footprint
#
# === Variables
#
# === Examples
#
# === Authors
#
# Codey Oxley <codey@yelp.com>
#
class libpam_ssh (
  $purge_now = false,
){
  case $::operatingsystem {
    'Ubuntu': {
      if $purge_now {
        include apt
        file { '/etc/pam.d/sudo':
          content => "auth include system-auth\naccount include system-auth\nsession include system-auth"
        }
        file_line { 'ssh_auth_sock':
          ensure  => absent,
          path    => '/etc/sudoers',
          line    => 'Defaults env_keep += SSH_AUTH_SOCK',
        }
        package { 'pam-ssh-agent-auth': ensure => purged }
        apt::ppa { 'ppa:cpick/pam-ssh-agent-auth': ensure => absent }

      } else {
        package { 'sudo': ensure => installed }

        # Declare apt, install ppa, and install pam-ssh-agent-auth
        include apt
        apt::ppa { 'ppa:cpick/pam-ssh-agent-auth' :} ->
        exec { 'apt-get update': } ->
        package { 'pam-ssh-agent-auth': }

        file { '/etc/pam.d/sudo':
          source  => 'puppet:///modules/libpam_ssh/sudo.pam',
          require => Package['pam-ssh-agent-auth'],
        }

        file_line { 'ssh_auth_sock':
          ensure  => present,
          path    => '/etc/sudoers',
          line    => 'Defaults env_keep += SSH_AUTH_SOCK',
          require => Package['sudo'],
        }
      }
    }
    default: {
      $url = 'https://github.com/coxley/puppet-libpam-ssh'
      $ubuntu_only = 'libpam_ssh Puppet module supports Ubuntu - PPA'
      $pr = "Please issue a PR at ${url} if you can add for others!"
      warning("${ubuntu_only} ${pr}")
    }
  }
}
