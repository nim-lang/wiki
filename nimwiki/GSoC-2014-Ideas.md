# Introduction
Below is a list of project ideas for [GSoC](https://www.google-melange.com/gsoc/homepage/google/gsoc2014) 2014. These projects require familiarity with the Nimrod programming language so it is absolutely essential that you become familiar with Nimrod ahead of time.

[Nimrod](http://nimrod-lang.org) is a statically typed programming language which compiles primarily to C. Areas of the project you may wish to work on include the [Nimrod compiler](#wiki-nimrod-compiler) which is itself written in Nimrod, Nimrod's [standard library](#wiki-standard-library) and/or the [tools and infrastructure](#wiki-tools--infrastructure) of Nimrod which includes the Nimrod build farm (Nimbuild) and the Nimrod package manager (babel).

To get started you will need to clone the Nimrod repository and then subsequently bootstrap the compiler, instructions for doing this are located [here](https://github.com/Araq/Nimrod#compiling). You can then move onto the [tutorial](http://nimrod-lang.org/tut1.html) and read through the [other documentation](http://nimrod-lang.org/documentation.html) as well.

We encourage you to join the #nimrod IRC channel on Freenode to discuss these projects with the community and our mentors. The Nimrod [Forum](http://forum.nimrod-lang.org) is also available. Because communication is a big part of open source development you are expected to get in touch with us before making your application, failure to do so will put your application at a great disadvantage.

The following list of projects are just some ideas that the community and the developers have come up with. You will be contributing to a programming language so there is a lot of flexibility when it comes to the projects that you can work on, this list is certainly not comprehensive so we are happy to hear any suggestions that you may have.

# Projects

## Nimrod Compiler
#### Add support for full coroutines

**Desirable skills:** Knowledge of coroutines, C and Assembly language.

**Description:**

Implement proper coroutines that provide light-weight collaborative multi-tasking. The coroutines must be cooperative - this means a coroutine is suspended only when it explicitly yields. The coroutines must never be migrated across threads - this means that of all the coroutines started from a thread, exactly one is running at any point in time while the others are suspended. Other semantic details are to be nailed down as part of the project, see http://www.inf.puc-rio.br/~roberto/docs/corosblp.pdf for a good overview of coroutines.

Nimrod already supports "closure iterators" which are comparable to Python's generators. However closure iterators are much less powerful than proper coroutines because they don't allow capturing the full call stack. This means, for instance, that closure iterators cannot be recursive.

Here is a sketch of a possible implementation, but there are lots of other possibilities to implement full coroutines for Nimrod:

  * Implement the necessary stack switching via inline assembler.
  * The GC needs to support conservative marking of multiple stacks.
  * In particular the write barrier in the GC which does the 'isOnStack' check needs to be changed.
  * Using a bloom filter for quick testing whether an address belongs to some stack is likely to pay off.
  * Creating a coroutine needs to register a new stack to the GC.
  * Deleting a coroutine needs to unregister the stack to the GC.
  * Builtin 'yld' must save the current stack pointer so that the GC knows which part of the stack is really in use.

**Expected Result:** A working coroutine implementation in Nimrod that plays well with the GC.

**Difficulty:** Hard

**Mentor:** Araq ([@Araq](http://github.com/Araq))

___
#### Add a code generator for OpenCL
  **Desirable skills:** Good OpenCL knowledge, knowledge of the compiler internals, basics of type theory.

**Description:**

Nimrod currently supports C, C++, Objective C and JavaScript code generation. However to run efficiently on GPUs an OpenCL backend is required. The easy way to do this is to copy OpenCL's low level mode of operation with its different ``private``, ``local``, ``global`` storage and simply provide a nimrodic syntax for OpenCL. So apart from syntactic sugar users get all of Nimrod's meta programming advantages plus good integration into Nimrod's infrastructure.  

The vision is a ``gpu`` pragma that means a proc and all of its dependencies are translated into OpenCL instead of C but can be invoked from ordinary Nimrod code that is translated to C. The ``gpu`` code generator is allowed to only translate a subset of Nimrod, in particular things like function pointers that are not supported by OpenCL do not have to be supported. The compiler should produce a clean error message for unsupported features.

**Expected Result:** The GPU code generator works on a selected set of examples/test cases.

**Tasks:**
  * Add support for new pointer types in the compiler like ``global``, ``private``.
  * Add support for work groupss.
  * Add support for the ``gpu`` pragma that translates to the OpenCL, version 2: https://www.khronos.org/registry/cl/sdk/2.0/docs/man/xhtml/

**Bonus points:** Support version 1.2 of the OpenCL specification: https://www.khronos.org/registry/cl/sdk/1.2/docs/man/xhtml/. This should be significantly harder as version 1.2 doesn't support a shared address space with the host environment.


**Difficulty:** Hard

**Mentor:** Araq ([@Araq](http://github.com/Araq))

___
#### Make Nimrod a viable research platform for Garbage Collection algorithms
  **Desirable skills:** Familiarity with the various GC approaches and algorithms, knowledge of the compiler codegen modules.

**Description:**

Most of the popular garbage collected languages of today require a separately distributed run-time environment, providing only a predetermined set of garbage collection algorithms. This leaves little room for experimentation with various approaches and condemns GC researchers to develop and test their algorithms on specialized platforms such as the [Jikes RVM](http://jikesrvm.org/) that have limited practical significance. 

In contrast, in Nimrod, the garbage collection algorithm is chosen at compile-time and embedded in the resulting stand-alone native executable. This enables the users to pick a GC algorithm that's most suitable to their project and allows for a proliferation of GC algorithms, developed by independent groups and individuals, without requiring any modifications to be made to the standard Nimrod distribution.

The Nimrod code generator and type system can provide various GC roots marking strategies, various kinds of write/read barriers and all necessary static type information (e.g. static cycle analysis) and a GC implementation will consist only of a single Nimrod module (supplied as a command-line parameter) that
provides configuration for the code generator and implements the logic of the garbage collection algorithm. This module will be compiled as C code with the rest of the program and it could be easily debugged using standard C/C++ debugging and profiling tools.

**Tasks:**
  * Add support for precise stack marking
  * Add support for read barriers and polish the support for Levanoni/Petrank style of write barriers
  * Implement the infrastructure for picking a user-supplied GC module

**Bonus points:** Implement simple forms of variety of GC algorithms as a proof-of-concept

**Difficulty:** Medium to Hard

**Mentor:** zahary ([@zah](http://github.com/zah))


___
#### Fix/Expand Nimrod's "Compiler as a Service" and idetools features
**Desirable skills:** Command line argument parsing, good knowledge of compiler internals and theory.

**Description:**

Nimrod's Compiler as a Service feature allows IDEs to query the compiler for things like code suggestions, definition lookups and more. The current implementation works but has some issues.

**Tasks:**
  * Review and resolve related issues.
  * Provide commands to execute macros. Allow IDEs to quickly get the code macros generate with different inputs.
  * Provide a mechanism to track a dirty file without saving it to disk.
  * Provide better diagnostic messages for invalid commands.
  * Implement queries enabling IDEs to provide rich semantic highlighting instead of the simple syntax highlighting currently available (e.g. variables, constants, types, procs and macros could all be styled differently).
  * Add support for quick evaluation of snippets of code in the context of the current project.
  * Add commands to retrieve information about project layout and compilation settings.

**Related issues**: [#804](https://github.com/Araq/Nimrod/issues/804), [#274](https://github.com/Araq/Nimrod/issues/274), [#325](https://github.com/Araq/Nimrod/issues/325), [#452](https://github.com/Araq/Nimrod/issues/452), [#484](https://github.com/Araq/Nimrod/issues/484), [#474](https://github.com/Araq/Nimrod/issues/474), [#477](https://github.com/Araq/Nimrod/issues/477), [#450](https://github.com/Araq/Nimrod/issues/450), [#449](https://github.com/Araq/Nimrod/issues/449), [#415](https://github.com/Araq/Nimrod/issues/415), [#471](https://github.com/Araq/Nimrod/issues/471), [#344](https://github.com/Araq/Nimrod/issues/344)

**Bonus points:** Implement "Compiler as a Service" support to major IDEs/text editors such as Light Table, Sublime Text, or Visual Studio.

**Difficulty:** Medium to Hard

**Mentor:** zahary ([@zah](http://github.com/zah))

## Standard Library

#### Implement a YAML parser library
**Desirable skills:** Ability to write efficient parsers.

**Description**:

The Nimrod standard library currently lacks a YAML parsing module. YAML is a popular "human-readable data serialization format", its popularity is especially evident in the Ruby community. As such it would be a great addition to Nimrod's standard library. This task requires you to read the [YAML specification](http://yaml.org/spec/) and to create a module which will be able to parse YAML data into an AST. Subsequently the parser can be used to create a high-level API to access the data similar to the current design of the [json](http://nimrod-lang.org/json.html) module which provides a low-level parser and a higher-level interface which builds on top of the parser.

**Tasks**:
* Write an efficient parser which will turn YAML data into an AST.
* Design and implement an API on top of the AST to query the data contained in the AST easily.

**Expected Result**: A working YAML module with the ability to read all YAML compliant data.

**Bonus points**: Thorough testing of the YAML module to ensure that the parser works as expected.

**Difficulty:** Medium

**Mentor:** Araq ([@Araq](http://github.com/Araq)), dom96 ([@dom96](http://github.com/dom96))

___
#### Enhance the filesystem monitoring module ``fsmonitor``
**Desirable skills:** Knowledge of the Microsoft Windows API.

**Description**:
Nimrod's standard library currently has a [``fsmonitor``](http://build.nimrod-lang.org/docs/fsmonitor.html) ([source code](https://github.com/Araq/Nimrod/blob/devel/lib/pure/fsmonitor.nim)) module which allows the programmer to monitor the filesystem for directory and file changes. The problem is that this module currently only supports Linux.

**Tasks**:

  * Allow the ``fsmonitor`` module to work on Microsoft Windows by using native APIs to gather information about changes in monitored files and directories.
  * Revise the ``fsmonitor`` module API to decouple Unix/Linux file handle paradigms from the API, allowing easier implementations of multiple native backends.
  * Integrate the ``fsmonitor`` module's polling mechanism into the new [asynchronous IO modules](https://github.com/Araq/Nimrod/blob/newasync/lib/pure/asyncio2.nim).

**Difficulty:** Easy

**Mentor:** dom96 ([@dom96](http://github.com/dom96))

___
#### Enhance and expand standard library documentation
**Desirable skills:** Basic writing and documentation skills, web design and infrastructure setup.

**Description**:
The [Nimrod documentation](http://nimrod-lang.org/lib.html) is generally good but it lacks helpful code examples. It is also using a rather old design which is not on par with some of the documentation of other software projects out there. [Read the docs](https://readthedocs.org/) is a good example of attractive as well as readable documentation, it is something we would be after in this project.

**Tasks:**

  * Ensure that documentation exists for all public methods and modules.
  * Create and design new CSS and HTML layouts for the documentation, the design should put readability above eyecandy. That said, the new design should be attractive to developers.
  * Add search capabilities to the online documentation.
  * Add code examples to all modules and to all procedures (where appropriate).

**Difficulty:** Medium

**Mentor:** zahary ([@zah](http://github.com/zah))

___
#### Add documentation to the Nimrod compiler internals
**Desirable skills:** Basic writing and documentation skills, knowledge of how compilers function.

**Description:**

There is currently very little documentation about the way the Nimrod compiler functions. This means that it is difficult for newcomers to contribute to the compiler. This is not helped by the fact that the compiler source code is seldom commented.

This project aims to improve this situation. You will be tasked with describing how the compiler is structured, the stages of the compilation process etc. You will also be expected to read the source of the compiler and try to explain what the code does using comments where appropriate. Guides on how to debug the compiler would also be welcome.

**Tasks**:
  * Add comments to the compiler internals, documenting the various mechanisms and mechanics the compiler uses to analyze and transform nimrod code to the code of the specified backend.
  * Write documentation describing the architecture of the compiler.

**Difficulty:** Medium

**Mentor:** Araq ([@Araq](http://github.com/Araq)), zahary ([@zah](http://github.com/zah))

___
#### Improve times module
**Desirable skills:** Knowledge of date time representations, native time APIs.

**Description**:

The current times module lacks some useful features. The ability to tell how long ago a certain time occurred is for example missing. This should be implemented using the existing ``TTimeInterval`` type which provides a ``-`` operator for subtracting two ``TTimeInfo`` values. A bug exists in this implementation however which prevents this operation from working in the Julian calendar, this should be 
fixed.

Some research is also required in this task. Other languages should be looked at to see what their standard library provides in terms of time handling. Features from those languages should be ideally ported over to Nimrod.

**Tasks**:

  * Fix limitations to do with time intervals, specifically subtracting a TTimeInterval from a TTimeInfo.
  * Provide a ``$`` for TTimeInterval. Goal is to be able to get timing info like "5 minutes ago".
  * Look at time handling in other languages and implement missing features.

**Bonus Points**: Ensure that the times module works with the JavaScript backend.

**Difficulty:** Easy

**Mentor:** dom96 ([@dom96](http://github.com/dom96))

___
#### Add an implementation of the ISAAC psuedorandom number generator
**Desirable skills:** Pseudo-Random number generation theory, C programming.

**Description:**

The Nimrod standard library currently lacks a native pseudorandom number generator and relies on the C ``rand`` function. This project requires you to write an implementation of the [[ISAAC Pseudorandom Number Generator|http://burtleburtle.net/bob/rand/isaacafa.html]] purely in Nimrod.

**Tasks**:
  * Create a pure-nimrod implementation of the [[ISAAC Random Number Generator|http://burtleburtle.net/bob/rand/isaacafa.html]] .

**Difficulty:** Medium

**Mentor:** Araq ([@Araq](http://github.com/Araq))

___
#### Wrap and test the Qt framework
**Desirable skills:** Knowledge of C++. Experience with the Qt framework is desirable.

**Description**:

Qt is a widely used GUI framework. Nimrod currently lacks a wrapper for this framework and this task requires you to create this wrapper and to test it. The ``c2nim`` tool can be used to mostly automate this process.

**Tasks:**

* Wrap the [Qt framework](http://qt-project.org/) with the help of the c2nim tool, or otherwise.
* Write tests which use the wrapper.

**Bonus points:** Write high-level bindings which provide an idiomatic Nimrod API on top of the wrapper.

**Difficulty:** Medium

**Mentor:** Araq ([@Araq](http://github.com/Araq)), zahary ([@zah](http://github.com/zah))
___
#### Wrap and test GTK3
**Desirable skills:** Knowledge of C. Experience with GTK+ is desirable.

**Description**:

GTK is a fairly popular GUI framework. Nimrod currently has a [GTK2 wrapper](https://github.com/nimrod-code/gtk2/tree/master/src) which is outdated. This task will have you wrapping GTK3 with the help of the c2nim tool.

**Tasks**:
* Wrap GTK3 with the help of the c2nim tool, or otherwise.
* Write tests which use the wrapper.

**Bonus Points:** Write high-level bindings which provide an idiomatic Nimrod API on top of the wrapper.

**Difficulty:** Medium

**Mentor:** dom96 ([@dom96](http://github.com/dom96)), Araq ([@Araq](http://github.com/Araq))

## Tools & Infrastructure
#### Nimbuild
**Desirable skills**: JSON parsing, modular program construction, inter-process communication.

**Description**:

Nimbuild is Nimrod's [build farm](http://en.wikipedia.org/wiki/Build_farm). It consists of a [website](http://build.nimrod-lang.org), a builder which bootstraps Nimrod and runs the tester on a wide range of platforms, and an IRC bot which announces commits on the #nimrod IRC channel.

Nimbuild is currently fairly feature complete but there are some things that can be fixed and implemented. In particular the bootstrap times are not recorded, this piece of information might be useful for us to see how the speed of Nimrod changes as we make modifications to the compiler.

**Tasks:**

  * Reduce the number of assumptions the Nimrod builder makes about its host system, in order to reduce configuration restrictions. Assumptions include location and usage of external tools, such as git.
  * Implement benchmark tests in the builder and generate graphs showing the time taken to perform those benchmarks on the Nimbuild site. This can include bootstrap times, and test times too.
  * Generate images showing the status of the build to be shown in Nimrod's Github repo and/or Nimrod's website.
  * Improve the download tables on Nimbuild's homepage and generate embeddable download tables for the Nimrod website.

**Difficulty:** Medium

**Mentor:** dom96 ([@dom96](http://github.com/dom96))

___
#### Babel
**Desirable skills**: Knowledge of Git and other version control systems.

**Description**:

Babel is the Nimrod package manager. It is currently very basic and some important features are still missing. Babel packages are stored in user-controlled Git or Mercurial repositories. Because Babel is still very immature greater testing of it is required, especially its dependency resolution. This is already partly tested using the [tester](https://github.com/nimrod-code/babel/blob/master/tests/tester.nim) present in the babel repository but the test suite should be expanded.

Submitting packages is currently a very cumbersome task involving the editing of a JSON file which is present [here](https://github.com/nimrod-code/packages/blob/master/packages.json). This process should be simplified as it is error-prone, babel could be extended to contain a ``submit`` command.

We also currently lack a website which tracks packages similar to Hackage or npm. It would be a welcome addition to our current infrastructure.

**Possible tasks:**
  * Add support for other VCS' alongside Git and Mercurial.
  * Create a website which tracks packages similar to hackage, npm, the [DUB registry](http://code.dlang.org/) etc.
  * Add support for the removal of packages.
  * Automate the package submission process.
  * Expand the babel tester to test more dependency scenarios.

**Difficulty:** Medium

**Mentor:** dom96 ([@dom96](http://github.com/dom96))

___
#### Improve the automation of low-level C bindings

**Desirable skills:** Knowledge of C

**Description**:
Nimrod's c2nim tool helps create nimrod bindings for C libraries. However, c2nim does not parse the whole C language, and is not currently supposed to import whole APIs into nimrod mechanically, but rather to serve as a starting point for manual definition of interfaces to C libraries. c2nim is particularly effective in dealing with C's preprocessor macros, but is
not currently capable of parsing many C header files.

Make c2nim accept more C declarations than it currently does, and produce corresponding Nimrod declarations. This can be done either by directly filling-in the missing capabilities, or by interfacing it with a mature tool for parsing C code, such as LLVM's CLang or the GCC-XML tool. If one of these tools is used, then it is expected that it would not suffice by itself, but rather augment the current c2nim parser, since these tools have their own limitations. A possible implementation might pass 
the header file once through gcc-xml to parse C declarations, and would use the current c2nim parser on lines that start with '#' to parse preprocessor definitions. c2nim would then process the parsed headers and produce constants, types, macros and proc declarations similar to those that it produces now.

Although c2nim currently converts function implementations (and not only declarations), this functionality is outside the scope of this task.

**Tasks**:
Depending on the chosen implementation technique, the tasks would be either:
  * detect individual deficiencies in c2nim support for .h files and fix them
or:
  * interface with a feature-complete parser for C, such as that of GCC or CLANG.
  * refactor c2nim so that it can generate declarations from the parsed output of the above parser, rather than directly from .h files as it currently does.
  * combine the output from the previous task with the declarations that c2nim produces for preprocessor macros.

**Difficulty:** Medium

**Bonus Points:** support, in addition, a few common c++ constructs that c2nim does not currently support.

**Mentor:** Araq ([@Araq](http://github.com/Araq))

___
#### Implement re2nim, a lexer generator for nimrod

**Description:**

Lexer generators are useful tools for writing all sorts of parsers. Currently Nimrod lacks a native Lexer generators. This project involves the implementation of a lexer generator. It should be modelled after [re2c](http://re2c.org/) or alternatively it can be based on the wide number of existing lexer generators such as Flex.

Here is a sketch of a possible implementation:
 
  * Parse regular expressions into an NFA and ensure the attached Nimrod actions are kept around through the next different passes.
  * Translate the NFA to an DFA: http://web.cecs.pdx.edu/~harry/compilers/slides/LexicalPart3.pdf
  * Minimize the DFA with Hopcroft's algorithm: http://en.wikipedia.org/wiki/DFA_minimization
  * Translate the DFA into Nimrod code and attach the actions.

**Desirable skills**: Knowledge of lexer generators. How to translate regexes into DFAs and how to optimize the resulting automatons. 

**Difficulty:** Medium to Hard

**Mentor:** zahary ([@zah](http://github.com/zah))
___
#### Implement a Nimrod backend for the Ragel state machine generator

**Description:**

[Ragel](http://www.complang.org/ragel/) is a "finite-state machine compiler with output support for C, C++, C#, Objective-C, D, Java, OCaml, Go, and Ruby source code." This project involves the implementation of a Nimrod backend for Ragel. This can be based on the large number of pre-existing backends listed previously.

**Desirable skills**: Knowledge of Ragel's internals.

**Difficulty:** Medium

**Mentor:** zahary ([@zah](http://github.com/zah))

# Template

The following is a rough template that each proposal shall use.

#### Short description

**Desirable skills:** list of desirable skills

**Description:**

Description of the tasks involved.

**Difficulty:** Easy/Medium/Hard

**Mentor:** Potential mentor(s)

___