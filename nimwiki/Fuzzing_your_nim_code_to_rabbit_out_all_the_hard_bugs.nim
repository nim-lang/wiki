import nimib, nimibook

nbInit(theme = useNimibook)

nbText:"""
[afl-fuzz](http://lcamtuf.coredump.cx/afl/) is quite rabid at ferreting out issues that are hard-to-impossible to find with manual testing.

While classically, afl-fuzz attempts to detect exactly the sort of issues that nim is attempting to prevent with its runtime checks in debug mode, it is by no means of no use to the nim developer. AFL is extremely good at discovering programmer errors that cannot be caught with simple user testing, even when all the safety nets are turned on.

Please note that AFL will catch errors by checking for the segfault signal; nim is designed to never do that and exception instead, so we have to simulate this behaviour for all error types we consider to be a unintended "crash" issue.  This is why the example transforms any exceptions into a SIGSEGV exit code.

## Work by example

The general idea behind AFL is that you shrink down your code path enough that you can just feed it some input and either have it work/do nothing, or crash.  There are other ways to inject AFL hooking into a more complex program (google: afl-fuzz persistent mode), but for this example, we'll stick with that.  AFL can feed data either over stdin (recommended! speed!) or over a temporary file.

Let's start with a simple example program everyone can get behind:

```nim
import os, streams, strutils, posix

try:
  let s = newFileStream(stdin)

  var texts: seq[string] = newSeq[string]()
  var picks: seq[int] = newSeq[int]()

  let textCount = s.readInt8()
  for i in 0..<textCount:
    let elemSz = s.readInt8()
    let text = s.readStr(elemSz)
    texts.add(text)

  echo "Read ", texts.len, " texts"

  let pickCount = s.readInt8()
  for i in 0..<pickCount:
    picks.add(s.readInt8())

  echo "Read ", picks.len, " picks"

  for p in picks:
    echo p, "=", texts[p]

except:
  echo repr(getCurrentException())
  discard kill(getpid(), SIGSEGV)

```

This is a pretty contrived thing, but just imagine this being somewhere in a file reader or network parser, or anything like that.  Now, nim in debug mode will catch some of the issues you can probably spot immediately, but let's assume the code is complex enough to confound you into missing them all.

The general idea is to boil down your testcase to just the code path you want to test; like part file handling library.  The smaller, the faster; and the faster, the less time you have to wait for it to find all those eye-opening bugs you never thought of.

## Make it work with AFL

Save that example in a file called **afltestcase.nim**.  Because AFL needs to instrument the generated binary code, you need to tell nim to use the compiler frontend AFL comes with, instead of whatever your distro defaults to.  Create a file called **afltestcase.nim.cfg** in the same directory and put this in:

```ini
# nim.cfg for afl-clang
-d:noSignalHandler

# for OSX/homebrew
cc = clang
clang.exe = "afl-clang"
clang.linkerexe = "afl-clang"
clang.path = "/usr/local/Cellar/afl-fuzz/2.36b/bin"

# OR for linux/debian (apt install afl)
cc = gcc
gcc.exe = "afl-gcc"
gcc.linkerexe = "afl-gcc"
```

This will tell nim to use AFL to compile afltestcase.nim (and only that file, not any others!), instead of whatever your distro defaults to. Now, compile it:

```
$ nim c afltestcase
```

You should see some output from afl confirming that it instrumented your binary properly, like:

```
Hint:  [Link]
afl-cc 2.36b by <lcamtuf@google.com>
```

## Testcases

AFL best works when given a bunch of valid test data. It *can* make up random data, but if you have some idea of what working input looks like, it'll help speed things up:

```
$ mkdir afl-in/
$ echo -e "\x03\02hi\05there\x03nim\x03\x02\x01\x00" > afl-in/testdata
$ ./afltestcase < afl-in/testdata
Read 3 texts
Read 3 picks
2=nim
1=there
0=hi
  
$ # yay, works!
```


## Running AFL

Finally, we can run AFL. As AFL feeds it's mutating input on stdin by default, we're already all set.

```
$ mkdir afl-out/
$ afl-fuzz -i afl-in/ -o afl-out/ -- ./afltestcase
```

Let it run for a while, but it should start finding issues pretty much immediately.  While crash triage is way out of scope of this document, it should give you something to start - as soon as it starts finding crashes or hangs, look into afl-out/crashes|hangs for the input data that made your code throw an exception or hang:
```
$ ./afltestcase < afl-out/crashes/id:000000,sig:11,src:000000,op:flip1,pos:0
Read 0 texts
Read 2 picks
ref 0x10f911050 --> [parent = nil,
name = 0x10f918260"IndexError",
msg = 0x10f911088"index out of bounds",
trace = 0x10f913050"Traceback (most recent call last)\10"
"afl.nim(25)              afl\10"
"system.nim(2581)         sysFatal\10"
""]
```

You can limit the exceptions that are considered crashes by adjusting the except: clause in the example.

Then I'd strongly suggest to start reading up on afl if you want to employ it with confidence.

## Testing for bugs in your code

Please keep in mind that fuzzing is supposed to find the **unknown/unexpected** errors, not just the ones you are anticipating. Thus, whereever possible, err on the side of caution and consider all exceptions to be a failure state that will bite you in the butt once you ship.  That said, you can use this nice template to trigger a AFL "crash" condition:

```nim
when defined(macosx) or defined(linux) or defined(freebsd) or
    defined(openbsd) or defined(netbsd) or defined(solaris):
  import posix

template AFLAssert*(cond: bool) =
  when defined(afl):
    if not cond:
      echo "Failed AFL assertion: " & astToStr(cond)
      let pid = posix.getpid()
      discard posix.kill(pid, posix.SIGABRT)
```

Then add `-d:afl` to your nim.cfg to enable this."""
nbSave()
