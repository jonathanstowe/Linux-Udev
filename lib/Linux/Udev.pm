use v6.c;

use NativeCall;

class Linux::Udev {
    constant LIB = [ 'udev', v1 ];

    class Context is Any is repr('CPointer') {
        ...
    }


    class ListEntry is repr('CPointer') {
        sub udev_list_entry_get_next(ListEntry $list_entry --> ListEntry) is native(LIB) { * }

        method next(--> ListEntry) {
            udev_list_entry_get_next(self);
        }

        sub udev_list_entry_get_by_name(ListEntry $list_entry, Str $name --> ListEntry) is native(LIB) { * }

        method get_by_name(Str $name --> ListEntry) {
            udev_list_entry_get_by_name(self, $name);
        }

        sub udev_list_entry_get_name(ListEntry $list_entry --> Str) is native(LIB) { * }

        method name(--> Str) {
            udev_list_entry_get_name(self);
        }

        sub udev_list_entry_get_value(ListEntry $list_entry --> Str) is native(LIB) { * }

        method value(--> Str) {
            udev_list_entry_get_value(self);
        }

    }

    class Device is repr('CPointer') {

        sub udev_device_get_devpath(Device $udev_device )   is native(LIB) returns Str { * }

        method devpath(--> Str ) {
            udev_device_get_devpath(self);
        }

        sub udev_device_get_subsystem(Device $udev_device ) is native(LIB) returns Str { * }

        method subsystem(--> Str) {
           udev_device_get_subsystem(self);
        }

        sub udev_device_get_devtype(Device $udev_device )   is native(LIB) returns Str { * }

        method devtype(--> Str) {
            udev_device_get_devtype(self);
        }

        sub udev_device_get_syspath(Device $udev_device )   is native(LIB) returns Str { * }

        method syspath(--> Str) {
            udev_device_get_syspath(self);
        }

        sub udev_device_get_sysname(Device $udev_device )   is native(LIB) returns Str { * }

        method sysname(--> Str) {
            udev_device_get_sysname(self);
        }

        sub udev_device_get_sysnum(Device $udev_device )    is native(LIB) returns Str { * }

        method sysnum(--> Str) {
            udev_device_get_sysnum(self);
        }

        sub udev_device_get_devnode(Device $udev_device)    is native(LIB) returns Str { * }

        method devnode(--> Str) {
            udev_device_get_devnode(self);
        }


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

        sub udev_device_new_from_syspath(Context $udev, Str $syspath) is native(LIB) returns Device { * }

        method device-from-path(Str $syspath --> Device) {
            udev_device_new_from_syspath(self, $syspath);
        }

        method devices() {
            my Enumerate $enumerate = self.enumerate;
            $enumerate.scan-devices;
            gather {
                my ListEntry $list = $enumerate.get-list-entry;
                while $list {
                    take self.device-from-path($list.name);
                    $list = $list.next;
                }
            }
        }
    }

    has Context $.context handles <enumerate devices>;

    submethod BUILD() {
        $!context = Context.new;
    }


}
# vim: expandtab shiftwidth=4 ft=perl6
