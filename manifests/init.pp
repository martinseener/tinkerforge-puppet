# == Class: tinkerforge
#
# This class handles installs the basic brickd daemon.
# It can install the node with or without additionals like the Brick Viewer or bindings.
#
# === Examples
#
#  include tinkerforge (to install the brickd only)
#  class { 'tinkerforge': $additionals = [ 'brickv', 'shellbindings' ], } (to install brickd and those 2 additionals)
#
# === Authors
#
# Martin Seener <martin@seener.de>
#
# === Copyright
#
# Copyright 2013 Martin Seener
#
class tinkerforge ($additionals = undef) {
  include tinkerforge::install::base
  
  service { 'brickd':
    ensure      => running,
    enable      => true,
    hasstatus   => true,
    hasrestart  => true,
    provider    => debian,
  }
  
  if ($additionals != undef) {
    class { "tinkerforge::install::$additionals":
      require => Class['tinkerforge::install::base'],
    }
  }
}