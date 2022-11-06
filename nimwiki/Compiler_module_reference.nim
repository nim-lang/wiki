import nimib, nimibook

nbInit(theme = useNimibook)

nbText:"""
**This wiki page was written quickly and may contain information which is out of date or needs to be worded better.**

### Module
### aliases.nim - Alias Analysis
  Used for term-rewriting macros. Buggy for this purpose because it has been rewritten with something completely different in mind. Analysis is both value and type based. Looks for areas

### ast.nim
  Tree structure

### astalgo
  contains helpers and debug procedures, which work on symbols, types, and node.

### babel.cmd 
  helper for compilers babel support

### bitsets
  Helpers for code generator. Set representation as an array of bits

### nimsets.nim -
  The complement to bitsets. Set representation as an AST

### Canonicalizer 
  Will be the future. Used to make the C code generator generate code in a much more deterministic fashion.

### ccgcalls
  C code generator calls. Generates a call expression in C, objective c, and C++ syntax. What needs to be done is that we often need to translate the result type into a hidden parameter.

### cggexpr  
  C code generation for expressions. Divide between stmts and expr mostly historical

### ccgmerge  
  A merger for C files which is used for the symbol files feature. 

### ccgstmts
  Code generation for statements. See ccgexprs. NOt for for loops, b/c they are eliminated.

### ccthreadvars
  Thread variable emulation. 

### ccgtypes
  complex, b/c deals with types. The PNode's are not cyclic. You can recurse them without any recursion checks. Type generation for the c backend, as well as run time type generation. 

### ccgutils
  Misc. utilities for C generation code. Contains hash string. Has to be same as system hash string, generate hashes at compile time. Also contains getUniqueType, to be deprecated in place of the canonicalization module.

### cgen.nim
  Main file for the C code generation. Includes things like DLL generation, foreign function interface, dispatches to. Cgendata is the main structure.

### cgmeth.nim
  code generation for methods. Performs AST to AST transformations. Analysis away method look up.

### commands.nim
  Command line argument processing.

### condsyms 
conditional symbols

### crc.nim 
cyclic redundancy check algorithm. Used by symbol files, recom

### depends.nim 
Pass which computes dependancies between modules. Able to generate a dot file which can be used.

### docgen.nim 
Old documentation generator, which doesn't use the semantic pass. Doesn't know about symbols and identifiers.

### docgen2.nim 
New documenation generator

### effects.nim - 
### evalffi.nim - 

### evals.nim 
old evaluation engine, not used anymore

### exccomp 
external compiler, describes how the c compiler is invoked.

### filter_template 
hashbang filter

### filters 
helper for common stuff which source code filter.

### syntaxes.nim - 

### guards -
Growing module. Flow sensitive analysis, mainly for values. Used for not nil checking

### hlo -
High level optimizer. Part of the term-rewriting macro engine.

### idents.nim -
PIdents. Hash identifiers into a single global hash table

### idgen -
ID generator. Used to create persistant IDs for the symbol files mechanism

### imports.nim -
The module which has the helpers which deal with the module import mechanism.

### jsgen -
Javascript code generator

### lambdalifting -
Pass which changes closures into pairs of function pointers and environments

### lexer -
the lexer

### lists -
Linked list implementation

### llstream -
low level stream which contains some features which the compiler needs.

### lookups.nim -
helpers for symbol lookup. Quite involved due to templates, overloading, etc.

### lowerings - 
Quite new module which implements common AST to AST helpers. 

### magicsyms -
compilerproc symbol is used by code generator whic inse

### modules.nim - 
Module handling

### message.nim -
Messages, warnings, hints.

### nimconf - 
configuration file handling

### nimeval -
the upcoming virtual machine to evaluate code.

### nimlexbase - 
Old lexbase. Buffer handling fo rthe lexer.

### nimrod.nim -
Main nimrod file which produces the nimrod executable.

### options -
Contains commandline options and checks.

### parampatterns - 
Related to overloading based on AST

### parseaux -
auxileries for the parser. Contains verbosity handling.

### sempass2 -
additional semantic checking.

### patterns - 
related to term rewriting macros

### pbraces - 
start of braces parser

### platform.nim - 
contains information for cross compiling (data type information)

### pragmas.nim - 
Contains all the pragmas that the compiler support. Use a set approach. Contains one big procedure which parses all the possible pragmas.

### pretty.nim -
Prettifier. Used for case consistancy

### procfind - 
used to find the header of a procedure. Used to determine if 

### renderer - 
able to give a string representation in the AST. 

### rodread - 
Reader of rod files, the symbol file mechanism. It also does module dependency tracking to decide whether a rod file can be used or whether the module needs to be recompiled

### rodutils - 
utilities for above

### ropes - 
Used throughout the code generator

### seterate.nim - 
Implements saturated arithmatic for integers.

### sem.nim -
Main file for the semantic checker

### semcall - 
semantic checking for calls

### semdata - 
contains the main data structures for semantic checking.

### semdestruct - 
semantic checking for destructors. 

### semexprs - 
semantic checking for expressions. 

### semfold - 
semantic checking for constant folding. Needed in the semantic pass, since things like bounds checking etc rely on such data.

### semgnrc - 
pass which implements symbol lookups for generics.

### seminst - 
instantiation of generics

### macrosanity - 
generates semantic ast checking for macros

### semmagic - 
magics that need special treatment after overloading resolution.

### semparallel -
semantic checking for the upcoming parallel statement

### sempass2 -
Effect tracking

### service.nim -
IDE Tool stuff

### sigmatch - 
very important module. Overloading resolution procedures. 

### suggest.nim - 
helper for IDE tools

### syntaxes - 
dispatching for what parser or sourcecodefilter to invoke.

### transf - 
old transformation pass. Prepass before the code generator. Mostly deals with for loops into while loops

### trees.nim - 
Helper for ast (should get rid of)

### treetab - 
hashtable which works with trees

### types - 
helper for types

### typesrenderer - 
new. Used for the documentation generator so we get names

### vm.nim - 
new virtual machine for compile time evaluation
"""
nbSave()
