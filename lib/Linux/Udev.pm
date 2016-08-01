use v6.c;

use NativeCall;

class Linux::Udev {
    constant LIB = [ 'udev', v1 ];

    class Context is repr('CPointer') {
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
