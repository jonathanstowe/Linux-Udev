# Linux::Udev

Access to devices managed by ```udev``` on Linux

## Synopsis

```perl6

use Linux::Udev;

my $udev = Linux::Udev.new;

for $udev.devices -> $device {
	say $device;
}

```

## Description

This provides access to the devices managed by [udev](https://en.wikipedia.org/wiki/Udev) on Linux.

The facility is provided by a binding to ```libudev``` which is often packaged
as part of ```systemd```. 



## Installation

Assuming you have a working installation of Rakudo Perl 6 the you should be
able to install this with either ```panda``` or ```zef``` :

	panda install Linux::Udev

	# or from a local clone

	panda install .

Other installers may become available later, please see their documentation
for the details.

## Licence & Copyright

This is free software, please see the [LICENCE](LICENCE) file in the
distribution directory.

© Jonathan Stowe, 2016
