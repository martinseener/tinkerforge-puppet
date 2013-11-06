# == Class: tinkerforge::install::shellbindings
#
# This class serves the tinkerforge shell bindings.
#
# === Examples
#
#  include tinkerforge::install::shellbindings
#
# === Authors
#
# Martin Seener <martin@seener.de>
#
# === Copyright
#
# Copyright 2013 Martin Seener
#
class tinkerforge::install::shellbindings {
  package { 'python':
    ensure  => present,
  } ->
  
  package { 'python-argparse':
    ensure  => present,
  } ->

  package { 'unzip':
    ensure  => present,
  } ->

  exec { 'get-shellbindings':
    command     => 'wget http://download.tinkerforge.com/bindings/shell/tinkerforge_shell_bindings_latest.zip -O /tmp/shellbindings.zip',
    onlyif      => 'test ! -f /tmp/shellbindings.zip',
    cwd         => '/tmp',
    timeout     => 0,
  } ->

  exec { 'unpack-shellbindings':
    command     => 'unzip -o /tmp/shellbindings.zip tinkerforge',
    onlyif      => 'test ! -f /usr/local/bin/tinkerforge',
    cwd         => '/tmp',
    timeout     => 0,
  } ->

  exec { 'install-shellbindings':
    command     => 'cp /tmp/tinkerforge /usr/local/bin/',
    onlyif      => 'test ! -f /usr/local/bin/tinkerforge',
    cwd         => '/tmp',
    timeout     => 0,
  }
}