# == Class: tinkerforge::install::base
#
# This class handles tinkerforges brickd daemon only.
#
# === Examples
#
#  include tinkerforge::install::base
#
# === Authors
#
# Martin Seener <martin@seener.de>
#
# === Copyright
#
# Copyright 2013 Martin Seener
#
class tinkerforge::install::base {
  package { 'brickd':
    ensure  => present,
    require => [ Package['libusb-1.0-0'], Exec['get-brickd'] ],
  }
  
  package { 'libusb-1.0-0':
    ensure  => present,
    require => Package['libudev0'],
  }

  package { 'libudev0':
    ensure  => present,
    notify  => Exec['get-brickd'],
  }
  
  exec { 'get-brickd':
    command     => 'wget http://download.tinkerforge.com/tools/brickd/linux/brickd_linux_latest_amd64.deb -O /tmp/brickd.deb && dpkg -i /tmp/brickd.deb',
    onlyif      => 'test ! -f /tmp/brickd.deb',
    refreshonly => true,
    timeout     => 0,
  }
}