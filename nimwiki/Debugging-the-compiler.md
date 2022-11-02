This page will provide some guidelines to those interested to work on the Nim compiler.

### How do I get started?

The ongoing development of Nim happens primarily in our "devel" branch. To get started, follow the standard [compilation instructions](https://github.com/nim-lang/Nim#compiling), but make sure to check out the devel branch.

Most of the compiler code is stored in the [compiler](https://github.com/nim-lang/Nim/tree/devel/compiler) directory and the individual modules are briefly described [here](https://github.com/nim-lang/Nim/wiki/Compiler-module-reference). After making any modifications, you can execute `koch boot -d:release` again to execute a full bootstrap cycle with your new code.

The build outputs will be stored in the "bin" directory of the repo. If you are using a Unix-like system, you can just create links to the executables stored there in a system folder such as `/usr/local/bin`. On Windows, you may want to add the bin directory to your PATH.

### Building a debug version of the compiler

Executing `koch boot` after every change is unnecessarily slow and sometimes it's useful to keep a stable and fast version of the nim compiler while working on a debug build that may feature changes preventing the compiler from bootstrapping properly. That's why it's preferable to build a separate "nimd" executable and use it while testing your newly developed code.

To help you with this, we recommend that you add the following helper commands to your shell's profile file:

``` bash
NIM_REPO_DIR="$(dirname "$(realpath "$(which nim)")")/.."

impl-nim-build () {
  local PREVDIR=`pwd`
  cd $NIM_REPO_DIR
  $NIM_BIN c $NIM_FLAGS $* compiler/nim.nim && cp compiler/nim ./bin/$NIM_OUT
  local RES=$?
  cd $PREVDIR
  return $RES
}

nimd-build () {
  NIM_BIN=nim NIM_FLAGS="-d:debug" NIM_OUT=nimd impl-nim-build $*
  return $?
}

nimd-boot () {
  NIM_BIN=nimd NIM_FLAGS="-d:debug" NIM_OUT=nimd impl-nim-build $*
  return $?
}

nimd-linedir-build () {
  nimd-build --lineDir:on $*
}

nim-boot () {
  local PREVDIR=`pwd`
  cd $NIM_REPO_DIR
  ./koch boot -d:release $*
  local RES=$?
  cd $PREVDIR
  return $RES
}
```

Once having those, the typical workflow for testing a new change would be to execute:

```
$ nimd-build && nimd c my_test_module.nim
```

Obviously, the above assumes that "nimd" was also linked in "/usr/local/bin" or added to your PATH.

### Printf debugging

"Printf debugging" is still the most appropriate way to debug many problems arising in compiler development. The typical usage of break points to debug the code is often less practical, because almost all of the code paths in the compiler will be executed hundreds of times before a particular section of the tested program is reached where the newly developed code must be activated.

To work-around this problem, you'll typically introduce an if statement in the compiler code detecting more precisely the conditions where the tested feature is being used. One very common way to achieve this is to use the `mdbg` condition, which will be true only in contexts, processing expressions and statements from the currently compiled main module.

``` nimrod
if mdbg:
  debug someAstNode
```

The above example also makes use of the `debug` proc, which is able to print a human-readable form of an arbitrary AST tree. Other common ways to print information about the internal compiler types include:

```nimrod
echo renderTree(someNode)  # pretty prints the nimrod ast
debug(someNode)  # outputs some JSON representation
echo typeToString(someType) # pretty prints some type
debug(someType)
echo symbol.name.s
debug(symbol)
echo renderTree(someNode, {renderIds})  # pretty prints the nimrod ast, but annotates symbol IDs
if n.info ?? "temp.nim":  echo renderTree(n)  # only output when it comes from "temp.nim"
if n.info ?? "temp.nim":  writeStackTrace()  # why does it process temp.nim here?
```

### Using a C debugger

The "nimd" executable is compiled with debugging information available and you can launch it under any command-line debugger as a normal C program. With a little bit of additional work, you can also setup projects in many graphical debuggers and IDEs.

The author of this guide mostly uses QtCreator for this, but if you use a different environment and you have certain tricks to share, please expand this section.

### Using a C debugger with line directives

If you use the `nimd-linedir-build` command to build "nimd", your debugger will be able to map the debugged code to the original Nim source files for a more natural debugging experience. At the moment, this capability is still quite rough on the edges.

### Using Mozilla rr

Mozilla's rr is a powerful debugger that allows you to freely move backwards and forwards in a pre-recorded execution of nimd to more easily investigate problems. This section will be expanded in the future.

### Using the embedded debugger

Using the Nim's [embedded debugger](https://nim-lang.org/docs/endb.html) is not supported at the moment for debugging nimd, but this may be improved in the future.

### Running the test suite

After your code starts working for simple examples in nimd, you'll want to test if it's also safe for bootstrapping. You can execute `nimd-boot` which will try to bootstrap the compiler using `nimd` itself. If this works without problems, you can execute `nim-boot` to bootstrap a new release version of the compiler incorporating your new changes.

At this point, you may also want to run the test suite in order to catch other possible regressions in more complicated snippets of code (in general, the compiler is conservative with regard to the Nim features it puts to use). You can do this by executing

```bash
cd $NIM_REPO_DIR
./koch test
```

Running the full test suite is likely to take up to an hour on a modern computer, so sometimes you'll want to test only particular "category" of tests (categories are represented as sub-directories under tests/ in repo). You can do this by executing:

``` bash
./koch test c objects
```

### Creating a pull request

Once you are sufficiently happy with your test results, please commit your changes to a feature branch and create a pull request on GitHub. This will subject your code to a more comprehensive test procedures on multiple operating systems and if new problems are discovered, you'll see a detailed log in your pull request.
