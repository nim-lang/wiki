import strformat, strutils
import nimib
import nimoji

nbInit

nbText:"""
# Introduction
Below is a list of project ideas for [GSoC 2015](https://www.google-melange.com/gsoc/homepage/google/gsoc2015). These projects require familiarity with the Nim programming language so it is absolutely essential that you become familiar with Nim ahead of time.

[Nim](http://nim-lang.org) is a statically typed programming language which compiles primarily to C and has an excellent performance/productivity ratio. Nim's design focuses on efficiency, expressiveness, elegance.

Areas of the project you may wish to work on include the [Nim compiler](#wiki-nim-compiler) which is itself written in Nim, Nim's [standard library](#wiki-standard-library) and/or the [tools and infrastructure](#wiki-tools--infrastructure) of Nim which includes the Nim package manager (nimble).

To get started you will need to clone the Nim repository and then subsequently bootstrap the compiler, instructions for doing this are located [here](https://github.com/Araq/Nim#compiling). You can then move onto the [tutorial](http://nim-lang.org/tut1.html) and read through the [other documentation](http://nim-lang.org/documentation.html) as well.

We encourage you to join the #nim IRC channel on Freenode to discuss these projects with the community and our mentors. The Nim [Forum](http://forum.nim-lang.org) and [mailing list](http://www.freelists.org/list/nim-dev) are also available. Because communication is a big part of open source development you are expected to get in touch with us before making your application, failure to do so will put your application at a great disadvantage.

The following list of projects are just some ideas that the community and the developers have come up with. You will be contributing to a programming language so there is a lot of flexibility when it comes to the projects that you can work on, this list is certainly not comprehensive so we are happy to hear any suggestions that you may have.

# Projects

## Table of Contents
  * [Nim Compiler](#nim-compiler)
      * [Create a new REPL for Nim using TinyCC](#create-a-new-repl-for-nim-using-tinycc)
      * [Make Nim a viable research platform for Garbage Collection algorithms](#make-nim-a-viable-research-platform-for-garbage-collection-algorithms)
      * [Add a code generator for OpenCL](#add-a-code-generator-for-opencl)
      * [Improve the JavaScript backend](#improve-the-javascript-backend)
      * [A strong theoretical foundation for Nim's parallel statement](#a-strong-theoretical-foundation-for-nims-parallel-statement)
  * [Standard Library](#standard-library)
      * [Enhance and expand the standard library documentation](#enhance-and-expand-the-standard-library-documentation)
      * [High level game library](#high-level-game-library)
      * [Benchmarking library](#benchmarking-library)
      * [MPI support](#mpi-support)
  * [Tools &amp; Infrastructure](#tools--infrastructure)
      * [nimfmt: Automatically format Nim code](#nimfmt-automatically-format-nim-code)
      * [c2nim: Improve the automation of low-level C bindings](#c2nim-improve-the-automation-of-low-level-c-bindings)
      * [Implement re2nim, a lexer generator for Nim](#implement-re2nim-a-lexer-generator-for-nim)
      * [Implement a Nim backend for the Ragel state machine compiler](#implement-a-nim-backend-for-the-ragel-state-machine-compiler)


## Nim Compiler

#### Create a new REPL for Nim using TinyCC

**Desirable Skills:** Experience with C and with REPLs in other languages (Python, GHCi, etc.)

**Description:**

A REPL (read-eval-print loop) can be a valuable tool while exploring a
language, new libraries and during regular development, as it allows faster
feedback. Nim provides a simple REPL (`nim i`) based on its compile-time
virtual machine, but it has some drawbacks, such as the C FFI not working.

An alternative approach is the development of a new REPL that actually compiles
the entered code to C and then uses the [TinyCC
compiler](http://bellard.org/tcc/) to immediately execute this code. TinyCC is
well suited for this as it can execute C code very quickly and can be used as a
library.

**Tasks:**
  * Add a simple TinyCC based REPL for Nim. Recompile all declarations (procedures, global variables) that were entered before for simplicity.
  * Ensure that global state (that is: state stored in global variables) is kept during recompilations of the generated C code. This means the C codegen needs to emit some kind of getters and setters for global variable access.
  * Make sure common Nim code works as well as importing C based libraries.
  * Investigate how to reduce overhead to improve performance.

**Expected Result:** A working Nim REPL that makes development easier.

**Difficulty:** Medium to Hard

**Mentor:** def- ([@def-](http://github.com/def-)), Araq ([@Araq](https://github.com/Araq))

___
#### Make Nim a viable research platform for Garbage Collection algorithms

**Desirable Skills:** Familiarity with the various GC approaches and algorithms, knowledge of the compiler codegen modules.

**Description:**

Most of the popular garbage collected languages of today require a separately distributed run-time environment, providing only a predetermined set of garbage collection algorithms. This leaves little room for experimentation with various approaches and condemns GC researchers to develop and test their algorithms on specialized platforms such as the [Jikes RVM](http://jikesrvm.org/) that have limited practical significance. 

In contrast, in Nim, the garbage collection algorithm is chosen at compile-time and embedded in the resulting stand-alone native executable. This enables the users to pick a GC algorithm that's most suitable to their project and allows for a proliferation of GC algorithms, developed by independent groups and individuals, without requiring any modifications to be made to the standard Nim distribution.

The Nim code generator and type system can provide various GC roots marking strategies, various kinds of write/read barriers and all necessary static type information (e.g. static cycle analysis) and a GC implementation will consist only of a single Nim module (supplied as a command-line parameter) that
provides configuration for the code generator and implements the logic of the garbage collection algorithm. This module will be compiled as C code with the rest of the program and it could be easily debugged using standard C/C++ debugging and profiling tools.

**Tasks:**
  * Add support for precise stack marking.
  * Add support for read barriers and polish the support for Levanoni/Petrank style of write barriers.
  * Implement the infrastructure for picking a user-supplied GC module.

**Bonus points:** Implement simple forms of variety of GC algorithms as a proof-of-concept.

**Expected Result:** It becomes easy to implement a custom Garbage Collector for experiments in Nim.

**Difficulty:** Medium to Hard

**Mentor:** zahary ([@zah](http://github.com/zah))

___
#### Add a code generator for OpenCL

**Desirable Skills:** Good OpenCL knowledge, knowledge of the compiler internals, basics of type theory.

**Description:**

Nim currently supports C, C++, Objective C and JavaScript code generation. However to run efficiently on GPUs an OpenCL backend is required. The easy way to do this is to copy OpenCL's low level mode of operation with its different ``private``, ``local``, ``global`` storage types and to simply provide an idiomatic syntax for OpenCL. So apart from syntactic sugar users get all of Nim's meta programming advantages plus good integration into Nim's infrastructure.

The vision is a ``gpu`` pragma that means a proc and all of its dependencies are translated into OpenCL instead of C but can be invoked from ordinary Nim code that is translated to C. The ``gpu`` code generator is allowed to only translate a subset of Nim, in particular things like function pointers that are not supported by OpenCL do not have to be supported. The compiler should produce a clean error message for unsupported features.

**Tasks:**
  * Add support for new pointer types in the compiler like ``global``, ``private``.
  * Add support for work groups.
  * Add support for the ``gpu`` pragma that translates to the OpenCL, version 2: https://www.khronos.org/registry/cl/sdk/2.0/docs/man/xhtml/

**Bonus points:** Support version 1.2 of the OpenCL specification: https://www.khronos.org/registry/cl/sdk/1.2/docs/man/xhtml/. This should be significantly harder as version 1.2 doesn't support a shared address space with the host environment.

**Expected Result:** The GPU code generator works on a selected set of examples/test cases.

**Difficulty:** Hard

**Mentor:** Araq ([@Araq](http://github.com/Araq))

___
#### Improve the JavaScript backend

**Desirable Skills:** Familiarity with JavaScript.

**Description:**

Nim has a JavaScript backend, which allows one to write the backend as well as
frontend in Nim. The JS backend is simple, so this is a good way to get started
with learning about Nim compiler internals. Some JavaScript bugs have been
[reported](https://github.com/Araq/Nim/labels/JS) already, other bugs and
missing features can be found by running [many small
examples](https://github.com/def-/nim-unsorted) with the JS backend.

**Tasks:**
  * Fix JavaScript backend bugs.
  * Port relevant parts of the standard library to JS.
  * Make the code generator emit "source maps" for better debugging support. The current debugging support is done by emitting stack tracing instructions which slow things down and are not standard.
  * Make JS test cases.

**Bonus points:**
  * Speed up the JavaScript backend by targeting `asm.js`.
  * Write a library for communication between client-side Nim (compiled to JavaScript) and server-side Nim (compiled to C).

**Expected Result:** Nim becomes more usable for client-side website development.

**Difficulty:** Medium

**Mentor:** Araq ([@Araq](https://github.com/Araq)), def- ([@def-](http://github.com/def-))

___
#### A strong theoretical foundation for Nim's parallel statement

**Desirable Skills**: Knowledge of optimizers.

**Description:**

Nim uses a fresh idea to model fork&join parallelism via its ``parallel``
builtin that performs a range of additional checks at compile-time
like array bounds checking or the so called "disjoint check". The disjoint
check ensures the data sets are disjoint; that means every processed element is
only accessed by one worker. This way no locking is required and yet (memory)
safety is guaranteed.

Unfortunately, how exactly this checking is performed is not
yet documented: It's done in a pretty ad hoc fashion that mostly uses
the transitivity of inequality relations and some simple control flow analysis.

However, in the context of *optimization* and code generation there has been
lots of progress in commercial compilers in the form of auto vectorization.
One such framework that enables auto vectorization is the polyhedral model.
The polyhedral model deals with iteration spaces and serves to parallelize loop
programs automatically by applying algebraic transformations. As it is a
traditional optimization pass in a compiler it has to prove these
transformations are correct. This is remarkably similar to the task of proving
the code written down by a human being is correct. So the idea of this task is to
leverage the polyhedral model for program verification as opposed to program
optimization.

See these papers for an introduction of the polyhedral model:

http://www.cs.ucla.edu/~pouchet/doc/cc-article.10.pdf

http://icps.u-strasbg.fr/~bastoul/research/papers/Bas04-PACT.pdf


Here is a sketch of a possible implementation:

* Implement an AST to polyhedral model transformation.
* Implement a semantic checking pass that works on the polyhedral model and
  proves array bounds correct as well as that the data sets are disjoint.
* In addition to that it needs to be proven that the code is free
  of "write after write" or "write after read" etc. conflicts.

**Expected Result:** An implementation of the polyhedral model for the parallel statement.

**Difficulty:** Hard

**Mentor:** Araq ([@Araq](https://github.com/Araq))

## Standard Library

#### Enhance and expand the standard library documentation

**Desirable Skills:** Basic writing and documentation skills, web design and infrastructure setup.

**Description**:
The [Nim documentation](http://nim-lang.org/lib.html) is generally good but it
needs to be made more accessible and lacks helpful code examples. Writing
documentation is also a great way to get a better understanding of Nim. [Read
the docs](https://readthedocs.org/) is a good example of attractive as well as
readable documentation, it is something we would be after in this project.

Additionally the documentation should be generated more automatically. The
documentation of each [nimble](https://github.com/nim-lang/nimble) package
should automatically be available online, similar to Hackage. Upon installation
of a library with nimble, its documentation should be installed on the system
as well.

**Tasks:**

  * Ensure that documentation exists for all public methods and modules.
  * Add code examples to all modules and to all procedures (where appropriate).
  * Add search capabilities to the online documentation.
  * Improve the website design and usability.
  * Add cross-linking capabilities in nim doc.
  * Make nimble build and install the documentation locally so you have
    docs of all your installed libraries.
  * Automatically create online documentation of each nimble package.

**Bonus Points:**
  * Implement testing of the examples in the documentation into the ``testament`` test suite.

**Expected Result:** Documentation of Nim is improved, can be used more easily.

**Difficulty:** Easy to Medium (depending on the scope)

**Mentor:** def- ([@def-](http://github.com/def-))

___
#### Benchmarking library

**Desirable Skills:** Experience with benchmarking, ability to create modern websites.

A high quality benchmarking library is a must for a high performance language.
Time, memory usage, and utilization of each CPU core can be interesting metrics
to measure. It should be possible to compare different implementations with a
variety of inputs semi-automatically. The output of such a benchmarking library
should be visually appealing and easy to share, similar to the one of
[criterion](http://www.serpentine.com/criterion/fibber.html), a Haskell
benchmarking library. Since Nim code can seamlessly be compiled with different
C compilers and garbage collectors, make it possible to run benchmarks with
combinations of these.

**Tasks:**
  * Implement ways to reliably measure time, memory usage and other metrics on multiple platforms. See [bench.nim](https://github.com/def-/nim-benchmarksgame/blob/master/bench.nim) for a start of doing this on Linux.
  * Implement a way to specify inputs of different sizes for the code to be tested.
  * Create Output reports in a nice HTML with Graphs and JavaScript.

**Bonus Points:**
  * Make it possible to run benchmark code from other languages as well.
  * Use this library as the basis of a modern benchmarking game where participants submit algorithm implementations in many languages for comparisons, similar to [The Benchmarks Game](http://benchmarksgame.alioth.debian.org/).

**Expected Result:** A high quality benchmarking library for Nim.

**Difficulty:** Easy to Medium (depending on the scope)

**Mentor:** def- ([@def-](http://github.com/def-))

___
#### High level game library

**Desirable Skills:** Experience with writing games and using other game libraries.

The Nim language is a good fit for writing games because of its high
performance, script-like programming style and [controllable garbage
collector](http://nim-lang.org/gc.html). There are many wrappers for existing
game libraries available in Nim, such as
[CSFML](https://github.com/blaxpirit/nim-csfml),
[SDL2](https://github.com/nim-lang/sdl2),
[GLFW](https://github.com/rafaelvasco/nimrod-glfw) and
[Urho3D](https://github.com/3dicc/Urhonimo). 

In this idea a friendly, high level game library should be written directly in Nim with an SDL2 and possibly
GLFW backend. This will allow games to be created more idiomatically and with
less overhead involved. Other new languages like Rust have similar projects
like [Piston](https://github.com/PistonDevelopers/piston).

This requires the idiomatic and platform independent implementation of 2D
graphics and 3D graphics, window management as well as audio output. By using
SDL2 we also ensure that porting to mobile platforms will be easier.

**Tasks:**
  * Start implementing a high level game library on top of SDL2 and OpenGL, inspired by other game libraries like Piston and Pyglet.
  * Prove the usability to write a simple Minecraft clone in the spirit of the 500 line Python/Pyglet [Minecraft](https://github.com/fogleman/Minecraft).

**Expected Result:**
  * Games can be written more easily in Nim.
  * A simple Minecraft clone can be played.

**Difficulty:** Medium

**Mentor:** def- ([@def-](http://github.com/def-))

___
#### MPI support

**Desirable Skills:** Knowledge of MPI.

Message Passing Interface (MPI) is a portable system for writing highly
parallel programs. These programs can run on a single computer as well as on a
whole cluster, where messages are sent over the network. Nim, with its
excellent performance/productivity ratio, would make a great language for this
use. What's missing is a Nim library to make use of the existing MPI libraries
for C. An existing C library like [OpenMPI](http://www.open-mpi.org/) can be
wrapped using `c2nim` to get a non-idiomatic low level wrapper for MPI. Since
the MPI interface is very verbose, and to make its use feel more Nim-like, a
high level library should then be written.

A possible source of problems is that MPI libraries often differ slightly. For
the start it will be good enough to just support one of the popular MPI
libraries like OpenMPI or MPICH. Afterwards it will be interesting how to deal
with the C preprocessor macros specifying the differences between MPI
implementations. You will need to investigate whether a solution such as [in
Julia](https://github.com/lcw/MPI.jl/blob/master/deps/make_f_const.f) will be
necessary to create a custom wrapper for each MPI implementation. Preferably
this would be solved directly with Nim's capabilities, and the close relation
to C could come in handy here.

**Tasks**:
  * Create a low level wrapper of a C library for the MPI standard using `c2nim`.
  * Write a high level abstraction library for comfortable MPI in Nim.
  * Implement simple programs/benchmarks using this MPI library, demonstrating its usability and performance.
  * Test the created libraries and publish them.

**Expected Result:** Nim programs can be make use of MPI parallelization.

**Difficulty:** Easy

**Mentor:** def- ([@def-](http://github.com/def-))

## Tools & Infrastructure

#### nimfmt: Automatically format Nim code

**Desirable Skills:** Some compiler internals knowledge.

Gofmt is often cited as one of the major points for the Go programming
language. It completely eliminates the need to manually adhere to style
formatting, by automatically converting Go code into a consistent style. This
makes the code easier to read, write and maintain as well as removes any debate
about which code style to adhere to.

Something similar would be nice to have in Nim, where we have additional
freedoms, like case insensitivity, that should be handled in a consistent way
for big projects. Such a project could be closely tied to the Nim compiler,
that already brings the tools to parse Nim code and represent it in AST form.

There is already a converter from AST to Nim code as well, in
[renderer.nim](https://github.com/Araq/Nim/blob/devel/compiler/renderer.nim),
that is used for `repr` as well as `c2nim`. It would make sense to use and
extend this or at least use it as inspiration.

**Bonus points:** Make it possible to specify the coding style in some way, so that a project can choose a common style to use.

**Expected Result:** A `nimfmt` tool that can be used to convert Nim code

**Difficulty:** Medium

**Mentor:** Araq ([@Araq](https://github.com/Araq)), def- ([@def-](http://github.com/def-))

___
#### c2nim: Improve the automation of low-level C bindings

**Desirable Skills:** Knowledge of C.

**Description**:
Nim's [c2nim tool](https://github.com/nim-lang/c2nim/) helps create Nim bindings for C libraries. However, c2nim does not parse the whole C language, and is not currently supposed to import whole APIs into Nim mechanically, but rather to serve as a starting point for manual definition of interfaces to C libraries. c2nim is particularly effective in dealing with C's preprocessor macros, but is
not currently capable of parsing many C header files.

Make c2nim accept more C declarations than it currently does, and produce corresponding Nim declarations. This can be done either by directly filling in the missing capabilities, or by interfacing it with a mature tool for parsing C code, such as LLVM's Clang or the GCC-XML tool. If one of these tools is used, then it is expected that it would not suffice by itself, but rather augment the current c2nim parser, since these tools have their own limitations. A possible implementation might pass 
the header file once through GCC-XML to parse C declarations, and would use the current c2nim parser on lines that start with '#' to parse preprocessor definitions. c2nim would then process the parsed headers and produce constants, types, macros and proc declarations similar to those that it produces now.

C comments should be converted into Nim documentation where appropriate.

Although c2nim currently converts function implementations (and not only declarations), this functionality is outside the scope of this task.

**Tasks**:
Depending on the chosen implementation technique, the tasks would be either:
  * detect individual deficiencies in c2nim support for .h files and fix them
or:
  * interface with a feature-complete parser for C, such as that of GCC or Clang.
  * refactor c2nim so that it can generate declarations from the parsed output of the above parser, rather than directly from .h files as it currently does.
  * combine the output from the previous task with the declarations that c2nim produces for preprocessor macros.

**Expected Result:** A selection of .h files that can be translated more automatically into Nim wrappers

**Difficulty:** Easy to Medium (depending on scope)

**Mentor:** Araq ([@Araq](https://github.com/Araq)), def- ([@def-](http://github.com/def-))

___
#### Implement re2nim, a lexer generator for Nim

**Desirable Skills**: Knowledge of lexer generators. How to translate regexes into DFAs and how to optimize the resulting automatons.

**Description:**

Lexer generators are useful tools for writing all sorts of parsers. Currently Nim lacks native lexer generators. This project involves the implementation of a lexer generator. It should be modeled after [re2c](http://re2c.org/) or alternatively it can be based on the wide number of existing lexer generators such as Flex.

Here is a sketch of a possible implementation:

  * Parse regular expressions into an NFA and ensure the attached Nim actions are kept around through the next different passes.
  * Translate the NFA to an DFA: http://web.cecs.pdx.edu/~harry/compilers/slides/LexicalPart3.pdf .
  * Minimize the DFA with Hopcroft's algorithm: http://en.wikipedia.org/wiki/DFA_minimization .
  * Translate the DFA into Nim code and attach the actions.

**Expected Result:** A library that can be used to easily create a lexer.

**Difficulty:** Medium to Hard

**Mentor:** zahary ([@zah](http://github.com/zah))

___
#### Implement a Nim backend for the Ragel state machine compiler

**Desirable Skills**: Knowledge of Ragel's internals, C programming.

**Description:**

[Ragel](http://www.complang.org/ragel/) is a "finite-state machine compiler with output support for C, C++, C#, Objective-C, D, Java, OCaml, Go, and Ruby source code." This project involves the implementation of a Nim backend for Ragel. This can be based on the large number of preexisting backends listed previously. Ragel itself is written in C++, so C++ programming should be familiar to you. Ragel embeds code in the backend language directly and then generates a regular source code file from this. Ideally the new Nim backend would end upstream in Ragel, but alternatively we can maintain it ourselves.

**Tasks:**
  * Become familiar with the template format used by Ragel and Ragel internals by studying how it works with other language backends.
  * Implement a Nim backend for Ragel.
  * Create interesting test cases to show how to use Ragel for protocol implementations, data format parsing, lexical analysis, ...

**Expected Result:** Easy to use finite state machines in Nim.

**Difficulty:** Easy

**Mentor:** def- ([@def-](http://github.com/def-))


# Project spec

Please add your project ideas in the following format.

## Sub-project

#### Title

**Desirable Skills:**

**Description:**

**Expected Result:**

**Difficulty:** ...

**Mentor:** Mentor name ([@MentorName](http://github.com/MentorName))"""
nbSave()
