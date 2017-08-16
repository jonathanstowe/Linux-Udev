#!perl6

use v6.c;

use Test;

use Linux::Udev;

my $obj = Linux::Udev.new;

my $list;

my $enumerate = $obj.enumerate;
lives-ok { $enumerate.scan-devices }, "scan-devices";

lives-ok { $list = $enumerate.get-list-entry }, "get-list-entry";

isa-ok $list, Linux::Udev::ListEntry;

while  $list.defined {
    say $list.name, "\t", $list.value;
    $list = $list.next;

}

done-testing;
