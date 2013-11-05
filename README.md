# Tinkerforge Puppet Module

This is a puppet module which provides the tinkerforge system like brickd and can install various bindings via "additionals" - just plugin-like puppet-manifests. Open an issue if you need one which is not yet provided here or develop one by yourself using the shellbindings.pp as a sample.

It`s also tested to work great with my nagios check which you can find [here](https://github.com/martinseener/tinkerforge-nagios-checks)

# How to use?

You can easily clone this repo into your puppet/modules subfolder and then include the class into your nodes like:

* `include tinkerforge` (for the basic brickd installation only)
* `class { 'tinkerforge': additionals => 'shellbindings' }` (to install brickd and the shell bindings on your system)

You can also add this repository as a submodule in your existing one to stay up to date.

# Known issues and a bit of a roadmap

By now i only have tested the module on Debian Squeeze and Wheezy where it works great. It also should work out of the Box
in other Debian-based derivates like Ubuntu or Mint.
Later and on demand i will add support for other Linux distributions, OSX, and Windows.

Also if you need another binding or other additionals like the Brick Viewer, just open an Issue.