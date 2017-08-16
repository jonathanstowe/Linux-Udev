#!perl6

use v6.c;

use Test;

use Linux::Udev;

my $udev = Linux::Udev.new;

lives-ok {
    for $udev.devices -> $dev {
        if $dev.subsystem eq 'block' {
            isa-ok $dev, Linux::Udev::Device;
            ok $dev.sysname, "got a name for { $dev.sysname } ";
        }
    }
}, "devices";


# vim: ft=perl6
