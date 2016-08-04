#!/usr/bin/env perl6

use v6.c;

use Test;

use Linux::Udev;

my $obj;

lives-ok { $obj = Linux::Udev.new }, "create Udev object";
isa-ok $obj, Linux::Udev, "and it's the right sort of thing";

isa-ok $obj.context, Linux::Udev::Context, "and so is .context";
ok $obj.context.defined, "and it's defined";
isa-ok $obj.context.enumerate, Linux::Udev::Enumerate, "enumerate";


done-testing;
# vim: expandtab shiftwidth=4 ft=perl6
