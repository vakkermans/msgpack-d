// Written in the D programming language.

/**
 * User-defined class sample
 */

import std.stdio;

import msgpack.msgpack;
import msgpack.util;


enum Attr : ubyte
{
    A, B
}

struct User
{
    string name;
    uint   age;
    Attr   attr;

    // mixin point is here.
    // http://d.puremagic.com/issues/show_bug.cgi?id=1099
    mixin MessagePackable;
}


void main()
{
    User user = User("Foo", 20, Attr.B), other;

    other.mp_unpack(unpack(pack(user)));

    writeln("name: ", other.name, "(", other.age, ", ", other.attr, ")");
}
