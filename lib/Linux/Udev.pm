use v6.c;

use NativeCall;

class Linux::Udev {
    constant LIB = [ 'udev', v1 ];

    class Context is Any is repr('CPointer') {
        ...
    }


    class ListEntry is repr('CPointer') {
    
    }

    class Device is repr('CPointer') {

    }

    class Enumerate is repr('CPointer') {
        sub udev_enumerate_scan_devices(Enumerate $e) is native(LIB) { * }

        method scan-devices() {
            udev_enumerate_scan_devices(self);
        }

        sub udev_enumerate_get_list_entry(Enumerate $e) returns ListEntry is native(LIB) { * }

        method get-list-entry() returns ListEntry {
            udev_enumerate_get_list_entry(self);
        }

    }

    class Context  {
        sub udev_new() returns Context is native(LIB) { * }

        method new() {
            udev_new();
        }

        sub udev_enumerate_new(Context $c) returns Enumerate is native(LIB) { * }

        method enumerate() returns Enumerate {
            udev_enumerate_new(self);
        }
    }

    has Context $.context;

    submethod BUILD() {
        $!context = Context.new;
    }


}
# vim: expandtab shiftwidth=4 ft=perl6
