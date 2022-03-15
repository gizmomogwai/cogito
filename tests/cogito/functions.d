module cogito.tests.functions;

import cogito;
import std.algorithm;
import std.sumtype;

@("2 functions")
unittest
{
    auto meter = runOnCode(q{
void f()
{
}
void g()
{
}
    });

    assert(meter.tryMatch!((Source source) => count(source.inner[])) == 2);
}

@("class function")
unittest
{
    auto meter = runOnCode(q{
class C
{
    void f()
    {
        if (true)
        {
        }
    }
}
    });

    assert(meter.tryMatch!((Source source) => source.score) == 1);
}

@("struct function")
unittest
{
    auto meter = runOnCode(q{
struct C
{
    void f()
    {
        if (true)
        {
        }
    }
}
    });

    assert(meter.tryMatch!((Source source) => source.score) == 1);
}

@("class function")
unittest
{
    auto meter = runOnCode(q{
class C
{
    void f()
    {
        if (true)
        {
        }
    }
}
    });

    assert(meter.tryMatch!((Source source) => source.score) == 1);
}

@("Interface function")
unittest
{
    auto meter = runOnCode(q{
interface C
{
    void f();
}
    });

    assert(meter.tryMatch!((Source source) => source.inner[].front.name.toString) == "C");
}

@("Union")
unittest
{
    auto meter = runOnCode(q{
union U
{
}
    });

    assert(meter.tryMatch!((Source source) => source.inner[].front.name.toString) == "U");
}

@("Constructor")
unittest
{
    auto meter = runOnCode(q{
class C
{
    this()
    {
        if (true)
        {
        }
    }
}
    });

    assert(meter.tryMatch!((Source source) => source.score) == 1);
}

@("Class destructor")
unittest
{
    auto meter = runOnCode(q{
class C
{
    ~this()
    {
        if (true)
        {
        }
    }
}
    });

    assert(meter.tryMatch!((Source source) => source.score) == 1);
}

@("Struct destructor")
unittest
{
    auto meter = runOnCode(q{
struct C
{
    ~this()
    {
        if (true)
        {
        }
    }
}
    });

    assert(meter.tryMatch!((Source source) => source.score) == 1);
}

@("Postblit constructor")
unittest
{
    auto meter = runOnCode(q{
struct C
{
    this(this)
    {
        if (true)
        {
        }
    }
}
    });

    assert(meter.tryMatch!((Source source) => source.score) == 1);
}

@("Module static constructor")
unittest
{
    auto meter = runOnCode(q{
shared static this()
{
    if (true)
    {
    }
}
    });

    assert(meter.tryMatch!((Source source) => source.score) == 1);
}

@("Module static destructor")
unittest
{
    auto meter = runOnCode(q{
shared static ~this()
{
    if (true)
    {
    }
}
    });

    assert(meter.tryMatch!((Source source) => source.score) == 1);
}
