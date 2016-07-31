#!/usr/bin/env perl6

use v6.c;

use Test;

use Linux::Udev;

my $obj;

lives-ok { $obj = Linux::Udev.new }, "create Udev object";
isa-ok $obj, Linux::Udev, "and it's the right sort of thing";


done-testing;
# vim: expandtab shiftwidth=4 ft=perl6
