The [nimscript docs](https://nim-lang.org/docs/nimscript.html) describe the nimscript API, but I needed some help on how to use it. (Note: [these docs](https://nim-lang.org/docs/nims.html) are better.)

(Most of the following applies to nimble too, but let's concentrate on nimscript for now.)

### Example
Suppose you have a scrDir like this:
```
src/
    foo.nim
    foo.nim.cfg
    foo.nims
    nim.cfg
    zzz.nims
```

Suppose `foo.nims` looks like this:
```nim
echo "In foo.nims"

include "zzz.nims"

task mybuild, "My build task":
  echo "In mybuild"
  switch("verbosity", "2")
  setCommand "c"

task newtask, "My new task":
  echo "In newtask"
  setCommand "dump"
```
And `zzz.nims` looks like this:
```nim
echo "In zzz.nims"
echo gorge("git rev-parse HEAD")
```
You *could* run your nimscript like this: `nim e foo.nims`, but that will not make your tasks available.

Instead, run **nim** on `foo.nim` like this:

    nim newtask foo
    nim mybuild -d:debug foo
    nim tasks foo # to see a list of available tasks

All the [standard `.cfg` files](https://nim-lang.org/docs/nimc.html#compiler-usage-configuration-files) are read *before* your nimscript. You can use `include` to avoid repeating code for each tool-specific `.nims` file. You can also use a directory-global `config.nims` nimscript, similar to `nim.cfg`.