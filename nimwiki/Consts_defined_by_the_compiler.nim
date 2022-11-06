import nimib, nimibook

nbInit(theme = useNimibook)

nbText:"""
# Defined
The following three lists are compiled from:
[Nim/compiler/platform.nim](https://github.com/nim-lang/Nim/blob/devel/compiler/platform.nim) and
[Nim/compiler/extccomp.nim](https://github.com/nim-lang/Nim/blob/devel/compiler/extccomp.nim)

One can use some name from them like:
```nim
when defined(Windows):
  doSomething()
```

### Operating Systems:
* ``DOS``
* ``Windows``
* ``OS2``
* ``Linux``
* ``MorphOS``
* ``SkyOS``
* ``Solaris``
* ``Irix``
* ``NetBSD``
* ``FreeBSD``
* ``OpenBSD``
* ``AIX``
* ``PalmOS``
* ``QNX``
* ``Amiga``
* ``Atari``
* ``Netware``
* ``MacOS``
* ``MacOSX``
* ``Haiku``
* ``VxWorks``
* ``JS``
* ``NimrodVM`` (also see ``nimvm`` [here](https://nim-lang.org/docs/manual.html#statements-and-expressions-when-nimvm-statement))
* ``Standalone``

### CPU Architectures:
* ``i386``
* ``m68k``
* ``alpha``
* ``powerpc``
* ``powerpc64``
* ``sparc``
* ``vm``
* ``ia64``
* ``amd64``
* ``mips``
* ``arm``
* ``js``
* ``nimrodvm`` (also see ``nimvm`` [here](https://nim-lang.org/docs/manual.html#statements-and-expressions-when-nimvm-statement))
* ``avr``


### Compilers:


* ``vcc``           Microsoft's Visual C++
* ``gcc``           Gnu C
* ``llvm_gcc``      LLVM-GCC compiler
* ``icc``           Intel C++ compiler
* ``clang``         Clang compiler
* ``bcc``           Borland C Compiler
* ``dmc``           Digital Mars C Compiler
* ``wcc``           Watcom C Compiler
* ``tcc``           Tiny C Compiler
* ``pcc``           Pelles C Compiler
* ``ucc``           Generic UNIX C compiler


# compileOption

Also remember about how to access the [compiler options](http://nim-lang.org/docs/nimc.html):
```nim
  when compileOption("boundChecks"):  # d:release should disable this.
    if i > q.high:  # x < q.low is taken care by the Natural parameter
      raise newException(IndexError, "Bla has less than " & $(i+1) & " elements.")
  discard
```

TODO: List them here and how to correctly access the more complex ones."""
nbSave()
