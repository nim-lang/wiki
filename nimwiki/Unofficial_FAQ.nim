import strformat, strutils
import nimib
import nimoji

nbInit

nbText:"""
If you are looking for the official FAQ then you can find it [here](https://nim-lang.org/question.html).

# How can I help?

For beginners I suggest to implement missing parts of the standard library or some other more specialized libraries:

* locale support
* a lean GUI library
* libraries for scientific computing
* libraries that deal with multi-media
* etc.

# How does the Nim compiler's versioning scheme work?

Versions with a trailing odd number are considered to be "in-development", these are unstable "bleeding-edge" versions of the compiler which you can get from Github. Versions with an even number are releases. E.g. 0.9.0 is a release version, 0.9.1 is an in-development version.

# Why is it case/underscore insensitive?

*  Identifiers which only differ in case are bad style. If the programming language treats them the same the programmer needs to come up with different names for different things.
* Case insensitivity is widely considered to be more user friendly. This holds for file systems, configuration files, and programming languages.
* It allows for using a consistent style in your own codebase, regardless of whether upstream libraries use camelCase, snake_case, or a mix.
* Note that most people confuse case sensitivity with case consistency (which is indeed good style). However, case consistency is easier to achieve with case insensitivity and a properly configured IDE than with case sensitivity.
* Many programming languages are case insensitive: Lisp, Basic, Pascal, Ada, Eiffel, Fortran. Since software for aircrafts and power plants has been written in Ada, it seems reasonable to assume that case insensitivity will not destroy civilization.
* It prevents bugs: in large applications in other languages it's not uncommon to see bugs introduced by an incorrect completion, e.g. updatePlayerstatus / updatePlayerStatus / update_player_status. With case/underscore insensitivity you know in advance that there can be only one "updateplayerstatus" in your code (and write it in a consistent manner, e.g. always update_player_status)

# Where can I find code examples?

You can find examples in the [examples/](https://github.com/Araq/Nim/tree/master/examples) directory. There are also many other examples available on [Rosetta Code](http://rosettacode.org/wiki/Nim) and [Nim by Example](http://nim-by-example.github.io).

# Why are unsigned types discouraged?

* https://critical.eschertech.com/2010/04/07/danger-unsigned-types-used-here/
* https://forum.nim-lang.org/t/313#1631
* https://forum.nim-lang.org/t/892#5303

# Why are tabs forbidden?

Tabs are treated differently by different tools and editors. Because indentation is so important in Nim it is much simpler to outright forbid tabs in source code than to risk the mixing of tabs and spaces. Guido van Rossum of Python himself has said that if he were to design Python again he would forbid tabs.

Nim is certainly not unique in forbidding tabs. [YAML](http://www.yaml.org/faq.html) does the same.

However, if you insist on using tabs in your code, putting this at the top of your code will change the tabs into spaces when compiling `#? replace(sub = "\t", by = "  ")`

# I get an error trying to compile Nim on Windows.

If this error looks something like the following:

```
c_code/nimbase.h:382:13: error: size of array 'assert_numbits' is negative
typedef int assert_numbits[sizeof(NI) == sizeof(void*) && NIM_INTBITS == sizeof
(NI)*8 ? 1 : -1];
```

Then you are likely trying to compile the C sources with a 64bit version of GCC. If you are trying to do this then you should note that there is a ``build64.bat`` file which you should execute instead of the ``build.bat`` file.

If the error does not resemble the above then the problem is likely with the C sources. Ask for help on IRC or submit an issue on github!

# Is Nim unsafe?

Usually this comes from Nim's ability to dereference null pointers and it's deal with compiling to C IR. Nim strives to generate C IR that won't cause undefined behavior as easy as how it can be caused by hand written C code. But when there is hand-written Nim code that contains errors like dereferencing a null pointer, there are ways to avoid this:

- `not nil` Annotation:
  - You can use this annotation on any nilable type in your code and the compiler statically checks at compile time that your code can't possibly have a null pointer for that var
- Compiler flags:
  - you can pass flags like `-fsanitize`, or `-fsanitize=null` for nil checks, which provide minimal overhead.
  - In the near future, `-nilChecks:On|Off` will be available for explicit nil checking and instead of Segmentation Faults, when a null pointer is dereferenced, it will be a NilError Exception
- `-d:release` config
  - `-d:release` has safety checks enabled by default, but if you want to disable some checks you can edit `config/nim.cfg` or disable all of them with ``-d:danger`` (specifying ``-d:release`` in this case is optional)
- Thread Safety
  - ``--gc:arc|orc`` both have a shared heap and they'll become the preferred memory management choice in the future.

You should also keep in mind these 5 points:
  1. It's not a problem in practice in the real world, where people have access to a very good debug mode that catches all sorts of things at compile-time and at run-time.
  2. It's not a problem with the right C compiler configurations.
  3. It's not hard to "fix" this issue anyway. Where "fixing" means "pretending Nim created Ansi C code in the first place" (which it doesn't).
  4. It's furthermore entirely deterministic in debug mode. It's nothing like a data race which you can never effectively test against.
  5. Nim already encourages you to give the type a name and then 'not nil' can be part of the type definition easily

# What is the Zen of Nim?

* https://nim-lang.org/blog/2021/11/15/zen-of-nim.html
* https://forum.nim-lang.org/t/8630

# Why does Nim generate C/C++ code?

- C language is supported in many platforms
- A lot of effort has been spent to C compilers for long time to generate optimized executable file. Nim can use that optimizer to generate fast code.
- There are a lot of mature C/C++ libraries. Nim can easily use them.

# Is Nim a Transpiler?

No. If you say Nim is a transpiler, is GCC a transpiler from C to assembler?

- https://peterme.net/is-nim-a-transpiler.html
- https://forum.nim-lang.org/t/8520

# Where is Nim Community Survey Results?

- [2021](https://nim-lang.org/blog/2022/01/14/community-survey-results-2021.html)
- [2020](https://nim-lang.org/blog/2021/01/20/community-survey-results-2020.html)
- [2019](https://nim-lang.org/blog/2020/02/18/community-survey-results-2019.html)
- [2018](https://nim-lang.org/blog/2018/10/27/community-survey-results-2018.html)
- [2017](https://nim-lang.org/blog/2017/10/01/community-survey-results-2017.html)
- [2016](https://nim-lang.org/blog/2016/09/03/community-survey-results-2016.html)

# Is Nim/nimble virus or malware?

Nim and tools distributed with Nim are neither viruses nor malware. They are safe to use.
Many people reported Nim was detected by antivirus softwares but they are false positive.

- https://forum.nim-lang.org/t/7885
- https://github.com/nim-lang/Nim/issues/17820

It seems Nim was used to write malware and it might related to false detections by antivirus software:
https://thehackernews.com/2021/03/researchers-spotted-malware-written-in.html

And it seems some antivirus software doesn't analyze the program carefully, but just alarms when they spot a bit pattern that has been seen in other malware.

Please do not write malware in Nim."""
nbSave()
