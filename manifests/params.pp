# == Class: tinkerforge::params
#
# This class handles the environment parameters.
#
# === Examples
#
# === Authors
#
# Martin Seener <martin@seener.de>
#
# === Copyright
#
# Copyright 2013 Martin Seener
#
class tinkerforge::params {
  $env_path = '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'

  case $::operatingsystem {
    'Debian': {
      $libudev_pkg = 'libudev0'
    }
    'Ubuntu': {
      $libudev_pkg = 'libudev1'
    }
    default: {
      fail("\"${module_name}\" provides no package default value
for \"${::operatingsystem}\"")
    }
  }
}