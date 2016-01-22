# Class: bareos::config::user
#
# This module manages bareos backup user
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage: include bareos::config::user
#
class bareos::config::user {
  @group { 'bareos':
    ensure => present;
  }

  @user { 'bareos':
    ensure     => present,
    gid        => 'bareos',
    comment    => 'bareos Backup System',
    home       => '/var/spool/bareos',
    shell      => '/sbin/nologin',
    managehome => false,
    password   => '!!',
    require    => Group['bareos'];
  }

  realize Group['bareos']
  realize User['bareos']
}
