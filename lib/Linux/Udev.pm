use v6.c;

use NativeCall;

class Linux::Udev {
    constant LIB = [ 'udev', v1 ];

    class Context is Any is repr('CPointer') {
        ...
    }

    class Enumerate is repr('CPointer') {

    }

    class ListEntry is repr('CPointer') {
    
    }

    class Device is repr('CPointer') {

    }

    class Context  {
        sub udev_new() returns Context is native(LIB) { * }

        method new() {
            udev_new();
        }
    }

    has Context $.context;

    submethod BUILD() {
        $!context = Context.new;
    }


}
# vim: expandtab shiftwidth=4 ft=perl6
