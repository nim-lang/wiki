import nimib, nimibook

nbInit(theme = useNimibook)

nbText:"""
# Table Of Contents

|                                           |                                                         |                                  |                                               |
|:-----------------------------------------:|:-------------------------------------------------------:|:--------------------------------:|:---------------------------------------------:|
| [Comparison](#Comparison)                 | [Objects](#Objects)                                     | [Do I have to know C?](#do-i-have-to-know-c)                | [Named Tuples](#named-tuple-1)                |
| [Variables](#Variables)                   | [`self.__init__()`](#self__init__)                      | [Strings, F-Strings](#Strings)              | [Lists](#Lists)                               |
| [Variable Naming](#variable-naming) | [Consistent Spacing](#consistent-spacing) | [Scoping](#scoping) | [Mutable arguments](#mutable-arguments) |
| [Imports](#Imports)                       | [Ranges](#Ranges)                                       | [String Operations](#string-ops) | [List Comprehensions](#List-Comprehensions)   |
| [try/import/except](#tryimportexcept) | [Static Bounds Checks](#static-bounds-check) | [Null Coalescing](#null-coalescing) |  [`with` Context Manager](#with-context-manager) |
| [Arrays](#Arrays)                         | [Slices](#Slices)                                       | [Tuples](#Tuples)                | [Dict Comprehensions](#Dict-Comprehensions)   |
| [Set Comprehensions](#Set-Comprehensions) | [Reading and writing files](#Reading-and-writing-files) | [Decorators](#Decorators)        | [Lambdas](#Lambdas)                           |
| [Sets](#Sets)                             | [JSON](#JSON)                                           | [Map & Filter](#map--filter)     | [Optional Indentation](#Optional-Indentation) |
| [Dictionaries](#Dictionaries)             | [CamelCase](#CamelCase)                                 | [DocStrings](#Docstrings)        | [Import Nim files in Python](#Import-Nim-files-on-Python) |
| [Ternary operators](#Ternary-operators)   | [Unittests](#Unittests)                                 | [def Vs proc / func](#def-vs-procfunc)    | [Self-Execution of Main Module](#Self-Execution-of-Main-Module) |
| [Python Syntax for Nim](#Python-Syntax-for-Nim) | [Publish to PYPI](#Publish-to-PYPI)               | [Silent Compilation](#Silent-Compilation) | [Compiler Help](#Compiler-Help)      |
| [Build Modes](#Build-Modes)               | [Abstract Base Classes](#ABC)                           | [Decorators](#Decorators)        | [WebAssembly](https://github.com/nim-lang/Nim/wiki/Nim-for-TypeScript-Programmers#WebAssembly)                     |
| [Templates](#Templates) | [Nim running Interpreted](https://nim-lang.org/docs/nims.html) | [Nim on the browser](https://github.com/nim-lang/Nim/wiki/Nim-for-TypeScript-Programmers#table-of-contents) | [Standard Library Equivalents](#Standard-Library-Equivalents) |
| [Async](#Async) | [Install Nim from PIP](https://github.com/juancarlospaco/choosenim_install#use) | [Cheatsheet PDF](https://www.overleaf.com/read/svnxffsjvscy) | [Arrow Functions](https://github.com/nim-lang/Nim/wiki/Nim-for-TypeScript-Programmers#Arrow-Functions) |
| [How to share variables between functions?](#How-to-share-variables-between-functions) | [Change File Permissions](#Change-File-Permissions) | [Temporarily Change Folder](#Temporarily-Change-Folder) | [Pattern Matching](https://github.com/nim-lang/fusion/blob/master/src/fusion/matching.rst) |
| [Best Practices](https://github.com/nim-lang/Nim/wiki/best-practices#best-practices) | [In-Place Vs Out-Place](#in-Place-vs-out-place) | [Run in NodeJS](https://github.com/nim-lang/Nim/wiki/Nim-for-TypeScript-Programmers#nodejs-compatibility) | [Code Expansion](#run-time-code-expansion) |
| [Arduino, MicroPython, ESP32, FreeRTOS](#MicroPython) | [LiveCoding, FoxDot, SuperCollider](#SuperCollider) | [PIP-installable Nim embedded inside Python](https://github.com/juancarlospaco/nim4py#nim4python) | [Install Nim packages from PIP](https://github.com/juancarlospaco/nimble_install#use) |

* [English Version](https://github.com/nim-lang/Nim/wiki/Nim-for-Python-Programmers#table-of-contents)
* [Spanish Version](https://github.com/nim-lang/Nim/wiki/Nim-for-Python-Programmers-ES#tabla-de-contenidos)


## Comparison

Feature              | :snake: Python                       | :crown: Nim
---------------------|--------------------------------------|-----------------------------------------
Execution model      | Virtual Machine (Interpreter)        | Machine code via C/C++ (Compiler)
Written using        | C (CPython)                          | Nim
License              | Python Software Foundation License   | [MIT](https://tldrlegal.com/license/mit-license)
Version (Major)      | `3.x`                                | `1.x`
Metaprogramming      | :heavy_check_mark: metaclass, exec, eval, [ast](https://docs.python.org/3/library/ast.html) (Run-time code expansion) | :heavy_check_mark: [template, macros](https://nim-lang.github.io/Nim/manual.html#macros) (Compile-time code expansion)
Memory management    | Garbage collector                    | [Multi-paradigm memory management](https://nim-lang.github.io/Nim/gc.html) (garbage collectors, [ARC/ORC](https://www.youtube.com/watch?v=aUJcYTnPWCg), manual)
Typing               | Dynamic, Duck Typing                 | Static
Dependent types      | :negative_squared_cross_mark:        | :heavy_check_mark: Partial support
Generics             | Duck Typing                          | :heavy_check_mark:
int8/16/32/64 types  | :negative_squared_cross_mark:        | :heavy_check_mark:
uint8/16/32/64 types | :negative_squared_cross_mark:        | :heavy_check_mark:
float32/float64 types | :negative_squared_cross_mark:       | :heavy_check_mark:
Char types           | :negative_squared_cross_mark:        | :heavy_check_mark:
Subrange types       | :heavy_check_mark:        	    | :heavy_check_mark:
Enum types           | :heavy_check_mark:                   | :heavy_check_mark:
Bigints (arbitrary size) | :heavy_check_mark:               | :heavy_check_mark: [jsbigints](https://nim-lang.github.io/Nim/jsbigints.html), [#14696](https://github.com/nim-lang/Nim/issues/14696#issue-640117621)
Biggest built-in integer | Unknown, limited by free memory  | `18_446_744_073_709_551_615` for `uint64` type
Arrays               | :heavy_check_mark:                   | :heavy_check_mark:
Type inference       | Duck typing                          | :heavy_check_mark: 
Closures             | :heavy_check_mark:                   | :heavy_check_mark:
Operator overloading | :heavy_check_mark:                   | :heavy_check_mark: on any type
Custom operators     | :negative_squared_cross_mark:        | :heavy_check_mark:
Object-Oriented      | :heavy_check_mark:                   | :heavy_check_mark:
Methods              | :heavy_check_mark:                   | :heavy_check_mark:
Exceptions           | :heavy_check_mark:                   | :heavy_check_mark:
Anonymous functions  | :heavy_check_mark: multi-line, single-expression | :heavy_check_mark: multi-line, multi-expression
List comprehensions  | :heavy_check_mark:                   | :heavy_check_mark:
Dict comprehensions  | :heavy_check_mark:                   | :heavy_check_mark:
Set comprehensions   | :heavy_check_mark:                   | :heavy_check_mark:
Custom object comprehensions | :heavy_check_mark: generator expression | :heavy_check_mark:
Pattern Matching builtin | :heavy_check_mark: As of Python 3.10    | :heavy_check_mark:
Immutability of types | Basic types (number, string, bool), tuple, frozenset | :heavy_check_mark:
Immutability of variables | :negative_squared_cross_mark:   | :heavy_check_mark:
Function arguments immutability | Depending on type         | Immutable
Formatted string literals | :heavy_check_mark: f-strings    | :heavy_check_mark: [strformat](https://nim-lang.github.io/Nim/strformat.html)
FFI                  | :heavy_check_mark: ctypes, C extension API (Cython via pip) | :heavy_check_mark: C, C++, Objective C, JS (depending on used backend)
Async                | :heavy_check_mark:                   | :heavy_check_mark:
Threads              | :heavy_check_mark: Global Interpreter Lock | :heavy_check_mark:
Regex                | :heavy_check_mark: Perl-compatible | :heavy_check_mark: Perl-compatible
Documentation comments | :heavy_check_mark: plain-text multi-line strings (reStructuredText via Sphinx) | :heavy_check_mark: [ReStructuredText/Markdown](https://nim-lang.github.io/Nim/rst.html)
Package publishing   | :heavy_check_mark: not built-in, requires `twine` | :heavy_check_mark: built-in, `nimble`
Package manager      | :heavy_check_mark: `pip`             | :heavy_check_mark: `nimble`
Code autoformatter   | :heavy_check_mark: `black` and others via pip   | :heavy_check_mark: `nimpretty` built-in, [nimlint](https://github.com/nim-dev/nimlint)
File extensions      | .py, .pyw, .pyc, .pyd, .so | .nim, .nims
Temporary intermediate representation (IR) format | .pyc (CPython VM bytecode) | C, C++, Objective C (LLVM IR via nlvm)
Uses #!shebang on files | :heavy_check_mark:                  | :heavy_check_mark:  `nimr`, `nimcr`
REPL                 | :heavy_check_mark:                   | [inim](https://github.com/inim-repl/INim#inim-interactive-nim-shell--), [Nim4Colab](https://github.com/demotomohiro/nim4colab)
Indentation          | Tabs and spaces, uniform per code block, 4 spaces by convention | Spaces only, uniform per code block, 2 spaces by convention

Notes:
- Python anonymous function (lambdas) are known to be slow compared to normal functions.
- Python Regex claims to be PCRE compatible, but in practice PCRE Regexes may not work.
- Python "multi-line" anonymous functions may require using `;` and Linters/IDE may complain about it.


## Variables

Creating a new variable uses `var` or `let` or `const`.
Nim has immutability and compile-time function execution.
You can assign functions to variables.

| Feature             | `const`                | `let`                  | `var`                  |
|---------------------|------------------------|------------------------|------------------------|
| Run-Time            | NO                     | :heavy_check_mark: YES | :heavy_check_mark: YES |
| Compile-Time        | :heavy_check_mark: YES | NO                     | NO                     |
| Immutable           | :heavy_check_mark: YES | :heavy_check_mark: YES | NO                     |
| AutoInitialized     | :heavy_check_mark: YES | :heavy_check_mark: YES | :heavy_check_mark: YES |
| Reassignable        | NO                     | NO                     | :heavy_check_mark: YES |
| Requires Assignment | :heavy_check_mark: YES | :heavy_check_mark: YES | NO                     |
| Can be Global       | :heavy_check_mark: YES | :heavy_check_mark: YES | :heavy_check_mark: YES |

[For advanced users, it is possible to skip variable Auto-Initialization.](https://nim-lang.github.io/Nim/manual.html#statements-and-expressions-var-statement)


### Variable Naming

Variables can be multi-line without "escaping" them or using parentheses. This is useful for long lines and long ternary operators. Minimal example:

```python
variable = 666 +  \
  420 *  \
  42 -   \
  9           

assert variable == 18297
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
var variable = 666 +
  420 *
  42 -
  9

assert variable == 18297
```

This works with function calls too:
```nim
import std/strutils

var variable = "  12345  "
  .strip
  .parseInt

assert variable == 12345
```

You can use underscores, new lines, and whitespace in variable names:

```nim
let `this must  be  
     positive`: Positive = 42

assert this_must_be_positive == 42

const `this is my nice named variable` = 42
```

[You can use reserved keywords as variable names.](https://nim-lang.github.io/Nim/manual.html#lexical-analysis-stropping)

It's okay to use `var` while learning Nim or for quick prototyping, although it's much better to learn the difference between different variable declarations.


## Consistent Spacing

Spaces must be consistent on your code, mainly around operators:

```nim
echo 2 - 1 # OK
echo 2-1   # OK
```

Bad inconsistent spaces:
```nim
echo 2 -1 # Error
#      ^ parses as "-1"
```

Omitting spaces on your code has no effect on performance.

All operators are functions in Nim.


## Scoping

- Scope "leaks", "bugs", "glitches", etc.

```python
for x in range(0, 9):
  if x == 6:
    print(x)

print(x)
```

Output:

```
6
8  # Leak!
```

:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:

```nim
for x in 0..9:
  if x == 6:
    echo x

echo x
```

Output:

```
Error: undeclared identifier: 'x'
```

Note that in the example above we use a simple `int`, so the problem may not seem severe. But if `x` were a few gigabytes of RAM in size,
it would "leak" out of the `for` loop to the rest of the outer or main scope instead of being reclaimed. Nim avoids this problem.


Another example:

```python
x = 0
y = 0

def example():
  x = 1
  y = 1
  class C:
    nonlocal x, y
    assert x == 1 and y == 1
    x = 2

example()
```

:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:

```nim
var x = 0
var y = 0

proc example() =
  var x = 1
  var y = 1
  type C = object
  assert x == 1 and y == 1
  x = 2

example()
```

Another example:

```python
x = 0
y = 0

def example():
  x = 1
  y = 1
  class C:
    nonlocal x, y
    assert x == 1 and y == 1
    x = 2
    try:
      raise
    except Exception as _:
      pass

example()
```

:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:

```nim
var x = 0
var y = 0

proc example() =
  var x = 1
  var y = 1
  type C = object
  assert x == 1 and y == 1
  x = 2
  try:
    raise
  except Exception as y:
    discard

example()
```


# Boolean conditionals

- Boolean comparisons "bugs", "glitches", etc.

```python
assert True == not False
```

Fails with the error:

```
SyntaxError: invalid syntax.
```

:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:

The Nim example compiles and runs without incident; the operator precedence is resolved correctly:

```nim
assert true == not false
```

Another example:

```python
assert False + 1
assert not True - 1
```

This runs because `bool` is a subtype of `int` in Python, so it supports the same mathematical operations. In Nim this is not the case:

:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:

```nim
assert false + 1
assert not true - 1
```

Does not Compile:

```
Error: type mismatch: got <bool, int>
```


# block

`block` explicitly creates a new scope, without the overhead of a function. It can have a "name" without the name polluting the local namespace, and can be interrupted anywhere without requiring `return`.

`block` can be used with `var`, `let` and `const` too.

Imagine that you need to get out of a nested `if`, without executing any other code from other `if` and `else` blocks. You can do:

```python
print("Before")

# this is a function, has overhead, pollutes namespace, must return to interrupt, etc.
def example():
  if True:
    print("Inside if true")
    if 42 > 0:
      print("Inside if 42 > 0")
      if 'z' > 'a':
        print("Inside if z > a")
        return  # Must return to interrupt
        if 3.14 > 0.0:
          print("Inside if 3.14 > 0.0")
      else:
        print("else of z > a")
    else:
      print("else of 42 > 0")
  else:
    print("else of true")

example()  # example in namespace
print("After")
```

:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:

```nim
echo "Before"

block example:  # Creates a new explicit named scope. This is not a function; there is no overhead.
  if true:
    echo "Inside if true"
    if 42 > 0:
      echo "Inside if 42 > 0"
      if 'z' > 'a':
        echo "Inside if z > a"
        break example  # Gets out of block example.
        if 3.14 > 0.0:
          echo "Inside if 3.14 > 0.0"
      else:
        echo "else of z > a"
    else:
      echo "else of 42 > 0"
  else:
    echo "else of true"

# No function call. "example" is not polluting the local namespace.
echo "After"
```

- https://nim-lang.github.io/Nim/manual.html#statements-and-expressions-block-statement
- https://nim-lang.github.io/Nim/manual.html#statements-and-expressions-block-expression


## Mutable arguments 

```python
def example(argument = [0]):
  argument.append(42)
  return argument

print(example())
print(example())
print(example())
```

Output:

```python
[0, 42]
[0, 42, 42]
[0, 42, 42, 42]
```

:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:

```nim
func example(argument = @[0]): auto =
  argument.add 42
  return argument

echo example()
echo example()
echo example()
```

Output:

```nim
Error: type mismatch: got <seq[int], int literal(42)>

but expected one of: 
proc add[T](x: var seq[T]; y: sink T)
  first type mismatch at position: 1
  required type for x: var seq[T]
  but expression 'argument' is immutable, not 'var'
```


## Imports

Import                                      | :snake: Python                  | :crown: Nim
--------------------------------------------|---------------------------------|-----------------------------
Only one symbol, use unqualified            | `from math import sin`          | `from std/math import sin`
All symbols, use unqualified                | `from math import *`            | **`import std/math` (recommended)**
All symbols, use fully qualified            | **`import math` (recommended)** | `from std/math import nil`
"import as" another name                    | `import math as potato`         | `import std/math as potato`
Both of the above at the same time          | :negative_squared_cross_mark:   | `from std/math as m import nil`
All symbols except one, use unqualified     | :negative_squared_cross_mark:   | `import std/math except sin`
All symbols except several, use unqualified | :negative_squared_cross_mark:   | `import std/math except sin, tan, PI`
Include another module in this module       | :negative_squared_cross_mark:   | `include somemodule`

**Your modules and types are not going to collide!, even if you have types named like modules, just chill and keep coding...**

In Nim, ``import std/math`` imports all of the symbols from the ``math`` module (``sin``, ``cos``, etc) so that they can be used unqualified. The Python equivalent is ``from math import *``.

If you prefer to not import all the symbols, and always use qualified names instead, the Nim code is ``from std/math import nil``. Then you can call ``math.sin()``, ``math.cos()``, etc. The Python equivalent is ``import math``.

It is generally safe to import all names in Nim because the compiler will not actually compile any unused functions (so there's no overhead). Furthermore, since Nim is statically typed, it can usually distinguish between the two imported functions with the same names based on the types of the arguments they are called with. In the rare cases where the types are the same, you can still fully qualify the name to disambiguate.

The prefix `std/` enforces that the module is imported from the standard library. If a Nimble package has a module with the same name, the compiler can resolve the ambiguity and it is explicit in the code.

Local modules and Nimble modules do not need `std/` prefix.

Python and Nim share these import statements:
```
# Python and Nim
import foo, bar, baz

import foo
import bar
import baz
```

Alternative syntaxes:

```python
# Python
import foo, \
       bar, \
       baz
```

```nim
# Nim
import foo,
       bar,
       baz

# Useful for small diffs when adding/removing imports
import
  foo,
  bar,
  baz

import 
  foo, bar, baz,
  more, imports
```

The variant with one `import` statement per line is common in Python and Nim, but in Nim the form `import foo, bar, baz` is also seen often.

More examples:

```nim
## This is documentation for the module.
#  This is a comment.
include prelude
import std/sugar as stevia
from std/math import nil
from std/with as what import nil
```


### Programatically

```python
__import__("math")
```

:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:

```nim
template imports(s) = import s
imports math
```


### Code without imports

Sometimes in the wild you may see code samples or files **without** the imports but they somehow work anyway. The reason is that Nim can use `import` from the compile command, or from a `.nims` file:

- `nim c --import:sugar file.nim`
- `nim c --import:folder/mymodule file.nim`
- `nim js --import:strutils --include:mymodule file.nim`

Sometimes projects or quick code examples use this to save some typing. Thanks to Dead Code Elimination, if the imported symbols are not used they will not exist on the compiled output.

See also:
- [Nim Command line switches](https://nim-lang.github.io/Nim/nimc.html#compiler-usage-command-line-switches) 


### Prelude

Sometimes you may feel that Python has more symbols available by default without any `import` compared to Nim. To get a similar experience of having the basic data structures and most common imports ready so you can get coding right away, you can use [prelude](https://nim-lang.github.io/Nim/prelude.html):

```nim
include prelude

echo now()             
echo getCurrentDir() 
echo "Hello $1".format("World")
```

[prelude](https://nim-lang.github.io/Nim/prelude.html) is an
[`include` file](https://nim-lang.github.io/Nim/manual.html#modules-include-statement) 
that simply imports common modules for your convenience, to save some typing.
[prelude](https://nim-lang.github.io/Nim/prelude.html) works for JavaScript target too.


### Where Symbols come from?

- If symbols are unqualified, how do you know where symbols come from?

Given `foo()` is a symbol:
- Nim: you typically have `foo()`, [with UFCS support](https://en.wikipedia.org/wiki/Uniform_Function_Call_Syntax#Nim_programming_language).  
- Python: you typically have `object.foo()` rather than `module.foo()`, no UFCS.

Typically the [Editor/IDE](https://marketplace.visualstudio.com/items?itemName=kosz78.nim) 
should hint where the symbols come from, like in any other programming language:

![](https://raw.githubusercontent.com/pragmagic/vscode-nim/master/images/nim_vscode_output_demo.gif)

Nim comes built-in with [NimSuggest](https://nim-lang.org/docs/nimsuggest.html) for Editor/IDE integrations.

Contrary to Python, Nim's type system has all the information about all of the symbols:

```nim
import std/macros
macro findSym(thing: typed) = echo thing.getType.lineInfo

findSym:
  echo  # Where echo comes from?.
```

`echo` comes from:
```
lib/system.nim(1929, 12)
```

When learning Nim, or for quick prototyping, it is okay to use the symbols fully qualified. Doing so produces no errors, but idiomatic Nim avoids this.


### Exports

In Python all symbols in the module are visible and mutable from modules that import it, including symbols that should not be used or mutated outside the module.

In Nim everything is private by default and therefore is not visible from other modules. To make symbols public and visible in other modules, you have to use the asterisk `*`:

```nim
let variable* = 42
const constant* = 0.0
proc someFunction*() = discard
template someTemplate*() = discard
type Platypus* = object
  fluffyness*: int
```

The asterisk not only makes the symbol visible to the outside world, 
the symbol will also appear in the generated documentation (`nim doc`). 
When you import the module, the symbol will be automatically added to the namespace, 
but private (not exported) symbols without `*` will not be visible. 
The asterisk is like a __visual cue__ for humans. You can immediately understand what symbols are a part of the "the public API" just by looking at the module's source code.
The asterisk `*` is pronounced as "star".

For more information, read: https://narimiran.github.io/2019/07/01/nim-import.html

## try/import/except

In Python, imports are a runtime operation and can fail. It is a fairly common pattern that platform-dependent imports are placed inside a try block, and an alternative or fallback inside the except:

```python
try:
    import module
except ImportError:
    import othermodule as module

try:
    from module import some_func
except ImportError:
    # Fallback implementation
    def somefunc():
        return some_value  
```

Nim resolves all imports at compile-time, so something like an `ImportError` does not exist. There's no need to handle import errors at runtime.


## Arrays

Arrays in Nim are fixed size, start at index `0`, and must contain elements of the same type.

When passing an array to a function in Nim, the argument is an immutable reference. Nim will include run-time checks on the bounds of the arrays.

You can use an [`openarray`](https://nim-lang.github.io/Nim/manual.html#types-open-arrays) 
to accept an array of any size on the function arguments,
and you can use `low(your_array)` and `high(your_array)` to query the bounds of the array.

Nim `string` is compatible with `openArray[char]` to avoid unneeded copies for optimization, and `char` is compatible with `int`. Therefore `string` manipulation can be done with math in-place transparently. A function that takes `openArray[char]` accepts `"abcd"` *and* `['a', 'b', 'c', 'd']`.

Array contents are always contiguous in memory, as are arrays of arrays.

See also:
- [Views](https://nim-lang.github.io/Nim/manual_experimental.html#view-types)


## Data Type Sizes

- Whats the size of the different data types?.

```nim
import std/json

type Foo = object            
type Bar = enum true, false  

# (Weird spacing intended)
assert sizeOf( Foo )        == 1
assert sizeOf( Bar )        == 1
assert sizeOf( bool )       == 1
assert sizeOf( {true} )     == 1
assert sizeOf( [true] )     == 1
assert sizeOf( (true) )     == 1
assert sizeOf( int8 )       == 1

assert sizeOf( {'k': 'v'} ) == 2
assert sizeOf( int16 )      == 2

assert sizeOf( int32 )      == 4
assert sizeOf( float32 )    == 4

assert sizeOf( int )        == 8
assert sizeOf( float )      == 8
assert sizeOf( @[true] )    == 8
assert sizeOf( %*{} )       == 8
assert sizeOf( pointer )    == 8
```

This is only an approximation for the empty primitives on 64-bit.


## Objects

Objects in Nim behave quite differently from classes in Python.
Objects support inheritance and OOP. Classes are named types in Nim.
Functions (procs) are free floating functions, not bound to objects 
(however, you can use them in a very similar way to Python).
You can call a function on objects with the `object.function()` syntax as well as `function(object)`; [these are entirely equivalent](https://en.wikipedia.org/wiki/Uniform_Function_Call_Syntax).
Nim does not have an implicit `self` nor `this`.
It is best practice to put all your types near the top of the file, but this is not mandatory.

A way to imagine this is that **procs get "glued" to the types of their arguments at compile-time**, and then you can use them at runtime as if they were Python classes and methods.

From Python to Nim, *as minimal as possible* example:

```python
class Kitten:
    """ Documentation Here """

    def purr(self):
        print("Purr Purr")

Kitten().purr()
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
type Kitten = object  ## Documentation Here
proc purr(self: Kitten) = echo "Purr Purr"
Kitten().purr()
```

Minimal inheritance example:
```nim
type Animal = object of RootObj
type Kitten = object of Animal
assert Kitten is Animal
```

Python-like object orientation examples:

``` Nim
type Animal = ref object of RootObj ## Animal base object.
  age: int                          
  name: string                      ## Attributes of base object.

type Cat = ref object of Animal     ## Cat inherited object.
  playfulness: float                ## Attributes of inherited object.

func increase_age(self: Cat) =
  self.age.inc()                    # Cat object function, access and *modify* object.

var kitten = Cat(name: "Tom")       # Cat object instance.
kitten.increase_age()               # Cat object function used.

assert kitten.name == "Tom"         # Assert on Cat object.
assert kitten.age == 1
```

Inheritance example:

```nim
type
  LUCA        = ref object of RootObj
  Archea      = ref object of LUCA
  Prokaryota  = ref object of Archea
  Eukaryota   = ref object of Prokaryota
  Animalia    = ref object of Eukaryota
  Chordata    = ref object of Animalia
  Mammalia    = ref object of Chordata
  Primates    = ref object of Mammalia
  Haplorhini  = ref object of Primates
  Simiiformes = ref object of Haplorhini
  Hominidae   = ref object of Simiiformes
  Homininae   = ref object of Hominidae
  Hominini    = ref object of Homininae
  Homo        = ref object of Hominini
  Homosapiens = ref object of Homo

assert Homosapiens() is LUCA
assert LUCA() isnot Homosapiens
assert sizeOf(Homosapiens) == sizeOf(LUCA)
let human = Homosapiens()
assert human is Homosapiens
```

See also:
- [Dynamic Typing via metaprogramming](https://github.com/Carpall/nobject#here-a-simple-object-for-allowing-dynamic-typing-in-nim)


## `self.__init__()`

After the Cat example you are probably wondering how to do `def __init__(self, arg):`.

Python `__init__()` is Nim `newObject()` or `initObject()`. Lets make an `__init__()` for the Cat:

```nim
type Cat = object                # Cat object.
  age: int                          
  name: string                   # Attributes of Cat object.

func initCat(age = 2): Cat =     # Cat.__init__(self, age=2)                    
  result.age = age               # self.age = age         
  result.name = "adopt_me"       # self.name = "adopt_me" 

var kitten = initCat()            # Cat object instance.

assert kitten.name == "adopt_me" # Assert on Cat object.
assert kitten.age == 2
```

Naming is a convention and best practice. When you want init for `Foo` just make `newFoo()` or `initFoo()`.
As you may notice `initCat` is just a function that returns a `Cat`.

- `initFoo()` for `object`.
- `newFoo()` for `ref object`.

[Read the documentation for Naming things following conventions and best practices.](https://nim-lang.org/docs/apis.html)

#### Object Attribute Default Values

The object constructor is also the way to set custom default values to the attributes of your objects:

```nim
type Cat = object
  age: int                 # AutoInitialized to 0
  name: string             # AutoInitialized to ""
  playfulness: float       # AutoInitialized to 0.0
  sleeping: bool           # AutoInitialized to false 
func initCat(): Cat =    
  result.age = 1           # Set default value to 1
  result.name = "Bastet"   # Set default value to "Bastet"
  result.playfulness = 9.0 # Set default value to 9.0
  result.sleeping = true   # Set default value to true
```

A more complete structure for a basic program can be something like:

```nim
## Simple application to  do Foo with the Bar.

type
  Animal = ref object of RootObj 
    age: int                          
    name: string                     

  Cat = ref object of Animal
    playfulness: float   


func initCat(age = 2): Cat =   
  result.age = age            
  result.name = "adopt_me"     

func increase_age(self: Cat) =
  self.age.inc()               

proc main() =
  var kitten = Cat(name: "Tom")  
  kitten.increase_age()           

  assert kitten.name == "Tom"      
  assert kitten.age == 1


when isMainModule:
  main()

runnableExamples:
  echo "Optionally some documentation code examples here"
  assert 42 == 42

```

## Run-time Code Expansion

Python objects that *internally* use code generation are very very slow, 
scaling with size. The more you use it the slower it runs. `dataclass`, `metaclass`, decorators, etc can be more than 25 ~ 50x slower than a normal `class`. [`pathlib.Path` and its methods can be more than 25 ~ 50x slower than a normal `str`](https://youtu.be/tFrh9hKMS6Y),
and defeats any optimization, including a `.pyc` file.
Cython does not have CTFE, so it does not help with this specifically.

- Nim code expansion is done at compile-time, making its code generation zero cost at run-time.

For example, you can see the result of ARC code expansion during compilation using `--expandArc`. This is how Nim does compile-time memory management (approximation):

![](https://raw.githubusercontent.com/juancarlospaco/nim-presentation-slides/master/Nim_ARC.png)

See also:
- [`macros.expandMacros` shows you the code expansion on the terminal during compilation](https://nim-lang.github.io/Nim/macros.html#expandMacros.m%2Ctyped)


# Unsafe Type Hints

Python "type hints" can be almost anything and are implicitly executed at run-time. Needless to say, this can be very unsafe:

```console
$ cat example.py
class X: _: "print('PWNED')"  # os.system("rm -rf /folder ")
__import__("typing").get_type_hints(X)

$ python3 example.py

'PWNED'

$
```

Nim types must be a valid Nim type, types are type checked at compile-time:

```console
$ cat example.nim
type X = object
  a: "echo('PWNED')"
echo X()

$ nim r example.nim    # Will not compile.

Error: type expected, but got: "echo('PWNED')"

$
```

Another example

```console
$ cat example.nim
var example: "echo('PWNED')"
echo example

$ nim r example.nim    # Will not compile.

Error: type expected, but got: "echo('PWNED')"

$
```


# By-Value vs By-Reference

- Does Nim passes data around "by value" or "by reference"? It depends ...

The Nim compiler automatically determines whether a parameter is passed by-value or by-reference based on the parameter type's size. 

If a parameter must be passed by-value or by-reference (such as when interfacing with a C library), 
then use the `{.bycopy.}` or `{.byref.}` pragmas.

**Nim passes objects larger than `3 * sizeOf(int)` by reference for performance**,
but this is architecture and implementation defined.
So the following information is just an *approximation* for `x86_64`:

Declaration           | Value or Reference? | Implicit or Explicit? | Managed or Unmanaged? | Observations    |
----------------------|---------------------|-----------------------|-----------------------|-----------------|
`symbol: int`         | By value            | Implicit              | Managed               | Frequent use    |
`symbol: var int`     | By reference        | Implicit              | Managed               | Frequent use    |
`symbol: ref int`     | By reference        | Explicit              | Managed               | Rare            |
`symbol: ptr int`     | By reference        | Explicit              | Unmanaged             | C/C++ FFI       |
`symbol: var ref int` | By reference        | Implicit              | Managed               | Rare            |
`symbol: var ptr int` | By reference        | Implicit              | Unmanaged             | Rare            |  
`symbol: pointer`     | By reference        | Explicit              | Unmanaged Pointer     | C/C++ FFI       |  

- Iff a "by value" symbol is big, then it is passed "by reference" automatically.
- [You can disable this optimization using `{.bycopy.}` pragma on the symbol.](https://nim-lang.github.io/Nim/manual.html#foreign-function-interface-bycopy-pragma)
- [The `{.byref.}` forces passing "by reference", the reverse of `{.bycopy.}`.](https://nim-lang.github.io/Nim/manual.html#foreign-function-interface-byref-pragma)
- Nim `seq` is passed around "by reference" by default.
- Nim `string` is [Copy-On-Write](https://en.wikipedia.org/wiki/Copy-on-write) COW (ARC/ORC).
- [Pointer Arithmetic can be performed with pointer.](https://en.wikipedia.org/wiki/Pointer%20arithmetic)


## Ranges

In Python, simple integer for loops use the `range` generator function. For the 1- and 2- argument forms of this function, nim's [`..` iterator](https://nim-lang.org/docs/system.html#...i%2CT%2CT) works almost the same way:

``` Nim
for i in 0 .. 10:
  echo i  # Prints 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

for i in 5 .. 10:
  echo i  # Prints 5, 6, 7, 8, 9, 10
```

Note that the `..` operator includes the end of the range, whereas Python's `range(a, b)` does not include `b`. If you prefer this behavior, use the [`..<` iterator](https://nim-lang.org/docs/system.html#..%3C.i%2CT%2CT) instead:

``` Nim
for i in 0 ..< 10:
  echo i  # Prints 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
```

Python `range()` also has an optional third parameter, 
which is the value to increment by each step. This can be positive or negative. 
If you need this behavior, use the [`countup`](https://nim-lang.org/docs/system.html#countup.i%2CT%2CT%2CPositive) or
[`countdown`](https://nim-lang.org/docs/system.html#countdown.i%2CT%2CT%2CPositive) iterators:

``` Nim
for i in countup(1, 10, 2):
  echo i  # Prints 1, 3, 5, 7, 9

for i in countdown(9, 0, 2):
  echo i  # Prints 9, 7, 5, 3, 1
```

Convert from `range` to `seq`:
```nim
import sequtils

const subrange = 0..9
const seqrange = toSeq(subrange)
assert seqrange is seq[int]
```

See also:
- [enumerate](https://nim-lang.github.io/Nim/enumerate.html#enumerate.m%2CForLoopStmt)


## Slices

The syntax for slice ranges is different. Python's `a[x:y]` is Nim's `a[x ..< y]`.

``` Nim
let variable = [1, 2, 3, 4]
assert variable[0 .. 0] == @[1]
assert variable[0 .. 1] == @[1, 2]
assert variable[0 ..< 2] == @[1, 2]
assert variable[0 .. 3] == @[1, 2, 3, 4]
```

#### Reverse Index Slices

In Nim a reverse index or backwards index uses `^` with the number, like `^1`. Backwards indexes have a specific type `BackwardsIndex`,
and they can also be "prepared" at compile-time as a `const`:

```nim
const lastOne = ^1  # Compile-time
assert lastOne is BackwardsIndex
assert [1, 2, 3, 4, 5][2 .. lastOne] == @[3, 4, 5]
assert [1, 2, 3, 4, 5][2 .. ^1] == @[3, 4, 5]
var another = ^3    # Run-time
assert [1, 2, 3, 4, 5][0 .. another] == @[1, 2, 3]
assert [1, 2, 3, 4, 5][^3 .. ^1] == @[3, 4, 5]  # 2 Reverse index
```


## Static Bounds-Check

- Nim has [static bounds-checking at compile-time.](https://en.wikipedia.org/wiki/Static_program_analysis)

Lets compare very simplified examples:

```python
[0, 1, 2][9]  # No Index 9
```

This crashes at run-time because there is no index 9:

```console
$ python3 example.py
Traceback (most recent call last):
  File "example.py", line 1, in <module>
    [0, 1, 2][9]
IndexError: list index out of range

$
```

Let's see Nim:

```nim
discard [0, 1, 2][9] # No Index 9
```

Compile and run:

```console
$ nim compile --run example.nim
example.nim(1, 19) Warning: can prove: 9 > 2  [IndexCheck]
example.nim(1, 18) Error: index 9 not in 0..2 [0, 1, 2][9]

$
```

Nim checks at compile-time that `[0, 1, 2]` has no index `9`, because `9 > 2`. Therefore, it won't compile nor run.

This also works with Subrange. Let's say you have a integer variable that **must be positive**:

```nim
let must_be_positive: Positive = -9
```

Compile and run:

```console
$ nim compile --run example.nim
example.nim(1, 34) Warning: can prove: 1 > -9 [IndexCheck]
example.nim(1, 34) Error: conversion from int literal -9 to Positive is invalid.

$
```

Nim checks at compile-time that `must_be_positive` is not `Positive` because `1 > -9`. It won't compile nor run.

Another example:

```nim
var variable0: 5..8 = 5        # int range type, value must be between '5' and '8'.
variable0 = 8
variable0 = 7
assert not compiles(variable0 = 4)
assert not compiles(variable0 = 9)
assert not compiles(variable0 = 0)
assert not compiles(variable0 = -1)
assert not compiles(variable0 = -9)


var variable1: 3.3..7.5 = 3.3  # float range type, value must be between '3.3' and '7.5'.
variable1 = 7.5
variable1 = 5.5
assert not compiles(variable1 = 3.2)
assert not compiles(variable1 = 7.6)
assert not compiles(variable1 = 0.0)
assert not compiles(variable1 = -1.0)
assert not compiles(variable1 = -9.0)


var variable2: 'b'..'f' = 'b'  # char range type, value must be between 'b' and 'f'.
variable2 = 'f'
variable2 = 'c'
assert not compiles(variable2 = 'g')
assert not compiles(variable2 = 'a')
assert not compiles(variable2 = 'z')
assert not compiles(variable2 = '0')
assert not compiles(variable2 = '9')


var variable3: Positive = 1    # Positive type, value must be > 0.
variable3 = 1
variable3 = 999
assert not compiles(variable3 = 0)
assert not compiles(variable2 = -1)
assert not compiles(variable2 = -9)


var variable4: Natural = 0     # Natural type, value must be >= 0.
variable4 = 1
variable4 = 999
assert not compiles(variable4 = -1)
assert not compiles(variable4 = -9)
```

You can control this with `--staticBoundChecks:on` or `--staticBoundChecks:off`.

With `--staticBoundChecks:off` it may raise an error at run-time like Python does.

- For better documentation see: https://nim-lang.github.io/Nim/drnim.html


# Null Coalescing

Python does not have a [null-coalescing operator](https://en.wikipedia.org/wiki/Null_coalescing_operator) (at the time of writing).

Python programmers use the ternary conditional operator instead:

```python
other = bar if bar is not None else "default value"  # "bar" may be null?, or not ?.
```

Nim has a [wrapnils module](https://nim-lang.github.io/Nim/wrapnils.html) with a `?.` null-coalescing operator,
which simplifies code by reducing the need for `if..elif...else` branches around **intermediate values that may be null**.

```nim
assert ?.foo.bar.baz == ""  # "bar" may be Null?, or not ?.
```

Null is `None` in Python. Null is `nil` in Nim.

See: https://nim-lang.github.io/Nim/wrapnils.html


## With Context Manager

There is no direct built-in equivalent to Python's `with` construct. In Nim there are the following options:

- [`template`](#templates)
- [`macros`](https://nim-lang.github.io/Nim/manual.html#macros)
- Named [`block`](https://nim-lang.github.io/Nim/manual.html#statements-and-expressions-block-statement)

[See the Templates section for examples.](#templates)


## Strings

| Lang                      | String  | Multi-line string | Raw String  | Multi-line Raw string | Formatted Literals | Quote   |  
|---------------------------|---------|-------------------|-------------|-----------------------|--------------------|---------|
| :snake: Python            | `"foo"` | `"""foo"""`       | `r"foo"`    | `r"""foo"""`          | `f"""{1 + 2}"""`   | `"` `'` |  
| :crown: Nim               | `"foo"` | `"""foo"""`       | `r"foo"`    | `r"""foo"""`          | `fmt"""{1 + 2}"""` | `"`     |  

#### String Ops

| Ops   | :snake: Python   | :crown: Nim             |
|-------|------------------|-------------------------|
| Lower | `"ABCD".lower()` | `"ABCD".toLowerAscii()` |       
| Strip | `" ab ".strip()` | `" ab ".strip()`        |
| Split | `"a,b,c".split(",")` | `"a,b,c".split(",")` |
| Concatenation | `"a" + "b"` | `"a" & "b"` |
| Find     | `"abcd".find("c")` | `"abcd".find("c")` |
| Starts With | `"abc".startswith("ab")` | `"abc".startswith("ab")` |
| Ends With | `"abc".endswith("ab")` | `"abc".endswith("ab")` |
| Split Lines | `"1\n2\n3".splitlines()` | `"1\n2\n3".splitlines()` |
| Slicing | `"abcd"[0:2]` | `"abcd"[0 ..< 2]` |
| Slicing 1 char | `"abcd"[2]` | `"abcd"[2]`  |
| Reverse Slicing | `"abcd"[-1]` |  `"abcd"[^1]` |
| Normalize | [`unicodedata.normalize("NFC", "Foo")`](https://docs.python.org/3/library/unicodedata.html#unicodedata.normalize "str().lower() is not the recommended way") | `"Foo".normalize()`
| Count Lines | `len("1\n2\n3".splitlines())` | `"1\n2\n3".countLines()` |
| Repeat | `"foo" * 9` | `"foo".repeat(9)` |
| Indent | `textwrap.indent("foo", " " * 9)` | `"foo".indent(9)` |
| Unindent | [`textwrap.dedent("foo")`](https://docs.python.org/3/library/textwrap.html#textwrap.dedent "textwrap.dedent() Removes ALL indentation!") | `"foo".unindent(9)` | 
| Parse Bool | [`bool(distutils.util.strtobool("fALse"))`](https://stackoverflow.com/q/715417 "bool('fALse') == True") :question: | `parseBool("fALse")` |
| Parse Int | `int("42")` | `parseInt("42")` |
| Parse Float | `float("3.14")` | `parseFloat("3.14")` |
| Formatted String Literals | `f"foo {1 + 2} bar {variable}"` | [`fmt"foo {1 + 2} bar {variable}"`](https://nim-lang.org/docs/strformat.html) |
| Levenshtein distance | :negative_squared_cross_mark: | [`editDistance("Kitten", "Bitten")`](https://nim-lang.org/docs/editdistance.html) |

- **Nim string operations require [`import std/strutils`.](https://nim-lang.org/docs/strutils.html)**
- A [very detailed comparison.](https://scripter.co/notes/string-functions-nim-vs-python/)

#### String Efficiency

Single memory allocation strings can be done with `newStringOfCap(capacity = 42)`,
that returns a new empty string `""` but with allocated `capacity` of `42`. If you pass beyond the `capacity` it will not crash nor buffer overflow:

```python
variable = ""
assert variable == "" # length is 0, capacity is 0, 1 allocations, 0 copies
variable += "a"       # length is 1, capacity is 1, 2 allocations, 1 copies
variable += "b"       # length is 2, capacity is 2, 3 allocations, 2 copies
variable += "c"       # length is 3, capacity is 3, 4 allocations, 3 copies
variable += "d"       # length is 4, capacity is 4, 5 allocations, 4 copies
assert variable == "abcd" 
# TOTAL: 5 allocations, 4 copies
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
var variable = newStringOfCap(2)
assert variable == "" # length is 0, capacity is 2, 1 allocations, 0 copies
variable.add "a"      # length is 1, capacity is 2, 1 allocations, 0 copies
variable.add "b"      # length is 2, capacity is 2, 1 allocations, 0 copies
variable.add "c"      # length is 3, capacity is 3, 2 allocations, 0 copies
variable.add "d"      # length is 4, capacity is 4, 3 allocations, 0 copies
assert variable == "abcd" 
# TOTAL: 3 allocations, 0 copies
```

This difference may get bigger for strings inside for loops or while loops.


### F-Strings

Nim `strformat` implements formatted string literals inspired by Python f-strings.
`strformat` is implemented using metaprogramming and the code expansion is done at compile-time.
It also works for the JavaScript target.

Similar to Python f-strings, you can 
[debug the key-value inside the string using an equal sign](https://nim-lang.github.io/Nim/strformat.html#debugging-strings). `fmt"{key=}"` expands to `fmt"key={value}"`:

```nim
let x = "hello"
assert fmt"{x=}" == "x=hello"
assert fmt"{x   =  }" == "x   =  hello"
```

Nim `strformat` supports backslash, while Python's f-strings do not:

```python
>>> print( f"""{ "yep\nope" }""" ) # Run-time error.
Error: f-string expression part cannot include a backslash.
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
echo fmt"""{ "yep\nope" }"""       # Nim works.

yep
ope
```

You can choose a custom character pair to open and close the formatting inside the string by passing the `char` as argument:

```nim
import std/strformat
let variable = 42
assert fmt("( variable ) { variable }", '(', ')') == "42 { variable }"
assert fmt("< variable > { variable }", '<', '>') == "42 { variable }"
```

Using characters like backtick and space `' '` works:

```nim
import std/strformat
let variable = 42
assert fmt(" variable`{variable}", ' ', '`') == "42{variable}"
```

- [It is recommended to read the full documentation of `strformat`.](https://nim-lang.github.io/Nim/strformat.html)


## Raw String

Python raw string can not end in `"\"`, but Nim raw string works just fine:

```python
>>> print(r"\")  # Run-time error.
SyntaxError: EOL while scanning string literal.
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
nim> echo r"\"
"\"

```

This may be relevant when working with strings that use `"\"`, like filesystems paths ` r"C:\mypath\" `, etc.


## Standard Library Equivalents

- [Python Standard Library for Nim.](https://github.com/juancarlospaco/cpython#alternative-stdlib-for-nim-for-python-targets)

Use                          | :snake: Python   | :crown: Nim
-----------------------------|------------------|------------------------------
Operating System             | os               | [os](https://nim-lang.org/docs/os.html)
String operations            | string           | [strutils](https://nim-lang.org/docs/strutils.html)
Date & time                  | datetime         | [times](https://nim-lang.org/docs/times.html)
Random                       | random           | [random](https://nim-lang.org/docs/random.html)
Regular expressions (Backend) | re              | [re](https://nim-lang.org/docs/re.html)
Regular expressions (Frontend) | :negative_squared_cross_mark: | [jsre](https://nim-lang.github.io/Nim/jsre.html)
HTTP                         | urllib           | [httpclient](https://nim-lang.org/docs/httpclient.html)
Logging                      | logging          | [logging](https://nim-lang.org/docs/logging.html)
Run external commands        | subprocess       | [osproc](https://nim-lang.org/docs/osproc.html)
Path manipulation            | pathlib, os.path | [os](https://nim-lang.org/docs/os.html)
Mathematic                   | math, cmath      | [math](https://nim-lang.org/docs/math.html)
MIME Types                   | mimetypes        | [mimetypes](https://nim-lang.org/docs/mimetypes.html)
SQLite SQL                   | sqlite3          | [db_sqlite](https://nim-lang.org/docs/db_sqlite.html)
Postgres SQL                 | :negative_squared_cross_mark: | [db_postgres](https://nim-lang.org/docs/db_postgres.html)
Levenshtein Distance         | :negative_squared_cross_mark: | [editdistance](https://nim-lang.github.io/Nim/editdistance.html)
Serialization                | pickle           | [json](https://nim-lang.org/docs/json.html), [jsonutils](https://nim-lang.github.io/Nim/jsonutils.html), [marshal](https://nim-lang.org/docs/marshal.html)
Base64                       | base64           | [base64](https://nim-lang.org/docs/base64.html)
Open web browser URL         | webbrowser       | [browsers](https://nim-lang.org/docs/browsers.html)
Async                        | asyncio          | [asyncdispatch](https://nim-lang.org/docs/asyncdispatch.html), [asyncfile](https://nim-lang.org/docs/asyncfile.html), [asyncnet](https://nim-lang.org/docs/asyncnet.html), [asyncstreams](https://nim-lang.org/docs/asyncstreams.html)
Unittests                    | unittest         | [unittest](https://nim-lang.org/docs/unittest.html)
Diff                         | difflib          | [diff](https://nim-lang.org/docs/diff.html)
Colors                       | colorsys         | [colors](https://nim-lang.org/docs/colors.html)
MD5                          | hashlib.md5      | [md5](https://nim-lang.org/docs/md5.html)
SHA1                         | hashlib.sha1     | [sha1](https://nim-lang.org/docs/sha1.html)
HTTP Server                  | http.server      | [asynchttpserver](https://nim-lang.org/docs/asynchttpserver.html)
Lexer                        | shlex            | [lexbase](https://nim-lang.org/docs/lexbase.html)
Multi-Threading              | threading        | [threadpool](https://nim-lang.org/docs/threadpool.html)
URL & URI                    | urllib.parse     | [uri](https://nim-lang.org/docs/uri.html)
CSV                          | csv              | [parsecsv](https://nim-lang.org/docs/parsecsv.html)
Parse command line arguments | argparse         | [parseopt](https://nim-lang.org/docs/parseopt.html)
SMTP                         | smtplib          | [smtp](https://nim-lang.org/docs/smtp.html)
HTTP Cookies                 | http.cookies     | [cookies](https://nim-lang.org/docs/cookies.html)
Statistics                   | statistics       | [stats](https://nim-lang.org/docs/stats.html)
Text wrapping                | textwrap         | [wordwrap](https://nim-lang.org/docs/wordwrap.html)
Windows Registry             | winreg           | [registry](https://nim-lang.org/docs/registry.html)
POSIX                        | posix            | [posix](https://nim-lang.org/docs/posix.html), [posix_utils](https://nim-lang.org/docs/posix_utils.html)
SSL                          | ssl              | [openssl](https://nim-lang.org/docs/openssl.html)
CGI                          | cgi              | [cgi](https://nim-lang.org/docs/cgi.html)
Profiler                     | cprofile, profile | [nimprof](https://nim-lang.github.io/Nim/nimprof.html)
Monotonic time               | time.monotonic   | [monotimes](https://nim-lang.github.io/Nim/monotimes.html)
Run functions at exit        | atexit           | [exitprocs](https://nim-lang.github.io/Nim/exitprocs.html)
Set file permissions         | os, stat         | [os](https://nim-lang.github.io/Nim/os.html), [filepermissions](https://nim-lang.github.io/Nim/filepermissions.html)
Recursive walk of filesystem | os.walk          | [os.walkDirRec](https://nim-lang.github.io/Nim/os.html#walkDirRec.i%2Cstring), [globs.walkDirRecFilter](https://nim-lang.github.io/Nim/globs.html#walkDirRecFilter.i%2Cstring%2Cproc%28PathEntry%29)
Templating engine            | string.Template  | [Source Code Filters](https://nim-lang.github.io/Nim/filters.html)
Deques                       | collections.deque | [deques](https://nim-lang.github.io/Nim/deques.html)
B-Tree based ordered Dictionary | :negative_squared_cross_mark: | [btreetables](https://nim-lang.github.io/Nim/btreetables.html)
Critical Bit Tree Dict/Set   | :negative_squared_cross_mark: | [critbits](https://nim-lang.github.io/Nim/critbits.html)
Pooled Memory Allocation     | :negative_squared_cross_mark: | [pools](https://nim-lang.github.io/Nim/pools.html)
Parse JSON                   | json             | [parsejson](https://nim-lang.org/docs/parsejson.html), [json](https://nim-lang.org/docs/json.html)
Parse INI                    | configparser     | [parsecfg](https://nim-lang.org/docs/parsecfg.html)
Parse XML                    | xml              | [parsexml](https://nim-lang.org/docs/parsexml.html), [xmltree](https://nim-lang.org/docs/xmltree.html)
Parse HTML                   | html.parser      | [htmlparser](https://nim-lang.org/docs/htmlparser.html)
Parse SQL                    | :negative_squared_cross_mark: | [parsesql](https://nim-lang.org/docs/parsesql.html)
Colors on the Terminal       | :negative_squared_cross_mark: | [terminal](https://nim-lang.org/docs/terminal.html)
Linux Distro Detection       | :negative_squared_cross_mark: | [distros](https://nim-lang.org/docs/distros.html)
HTML Generator               | :negative_squared_cross_mark: | [htmlgen](https://nim-lang.org/docs/htmlgen.html)
Arrow Functions              | :negative_squared_cross_mark: | [sugar](https://nim-lang.org/docs/sugar.html#%3D%3E.m%2Cuntyped%2Cuntyped)
In-Place to Work-on-Copy     | :negative_squared_cross_mark: | [sugar.dup](https://nim-lang.org/docs/sugar.html#dup.m%2CT%2Cvarargs%5Buntyped%5D)
Syntax Sugar                 | :negative_squared_cross_mark: | [sugar](https://nim-lang.org/docs/sugar.html)
JavaScript & Frontend        | :negative_squared_cross_mark: | [dom](https://nim-lang.org/docs/dom.html), [asyncjs](https://nim-lang.org/docs/asyncjs.html), [jscore](https://nim-lang.org/docs/jscore.html), [jsffi](https://nim-lang.org/docs/jsffi.html), [dom_extensions](https://nim-lang.github.io/Nim/dom_extensions.html), [jsre](https://nim-lang.github.io/Nim/jsre.html)

- This is not complete, but just a quick overview. For more information see https://nim-lang.org/docs/lib.html


## Tuples

Tuples are fixed size, start at index `0`, can contain mixed types, and can be anonymous or named. Named tuples have no extra overhead over anonymous tuples.

#### Anonymous Tuple

```python
(1, 2, 3)
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
(1, 2, 3)
```

#### Named Tuple

- Nim allows the fields to be named, without requiring the tuple itself to be named. Python NamedTuple requires `import collections`, and we need to give it a dummy underscore name:

```python
collections.namedtuple("_", "key0 key1")("foo", 42)
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
(key0: "foo", key1: 42)
```

#### Named Tuple

- We can also name both the fields and the tuple:

```python
collections.namedtuple("NameHere", "key0 key1")("foo", 42)
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
type NameHere = tuple[key0: string, key1: int]
var variable: NameHere = (key0: "foo", key1: 42)
```

`tuple[key0: string, key1: int]` is the `typedesc` for Declarations.
`(key0: "foo", key1: 42)` is the Literal for Assigns.

Nim tuples are a lot like Python NamedTuple in that the tuple members have names.

Do NOT use named tuples to "mimic" proper objects (the compiler re-uses generic instantiations for "identical" tuples).

See [manual](http://nim-lang.org/docs/manual.html#types-tuples-and-object-types) for a more in depth look at tuples.


## Lists

[Nim sequences](http://nim-lang.org/docs/tut1.html#advanced-types-sequences) are *not* fixed size. They can grow and shrink, start at index `0`, and must contain elements all of the same type.

```python
["foo", "bar", "baz"]
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
@["foo", "bar", "baz"]
```

[@](https://nim-lang.github.io/Nim/system.html#%40%2CopenArray%5BT%5D) 
is a function that converts from `array` to `seq`.


## List Comprehensions

```python
variable = [item for item in (-9, 1, 42, 0, -1, 9)]
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
let variable = collect(newSeq):
  for item in @[-9, 1, 42, 0, -1, 9]: item
```

A comprehension can be assigned to `const` too, and it will run at compile-time.

The comprehension is implemented as a `macro` that is expanded at compile-time, 
you can see the expanded code using the `--expandMacro` compiler option:

```nim
let variable = 
  var collectResult = newSeq(Natural(0))
  for item in items(@[-9, 1, 42, 0, -1, 9]):
    add(collectResult, item)
  collectResult

```

The comprehensions can be nested, multi-line, multi-expression, all with zero overhead:

```nim
import std/sugar

let values = collect(newSeq):
  for val in [1, 2]:
    collect(newSeq):
      for val2 in [3, 4]:
        if (val, val2) != (1, 2):
          (val, val2)
        
assert values == @[@[(1, 3), (1, 4)], @[(2, 3), (2, 4)]]
```

Single-line example:

```python
print([i for i in range(0, 9)])
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
echo(block: collect newSeq: (for i in 0..9: i))
```

Python comprehensions convert the code to a generator, but Nim comprehensions do not convert the code to an iterator:

```nim
import std/sugar

func example() =
  discard collect(newSeq):
    for item in @[-9, 1, 42, 0, -1, 9]: 
      if item == 0: return
      item

example()
```
:arrow_up: Nim :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Python :arrow_down:
```python
def example():
  [item for item in [-9, 1, 42, 0, -1, 9] if item == 0: return]
      
example()
```

Python complains:
```
SyntaxError: invalid syntax.
```

Some things that in Python are syntactically disallowed inside comprehensions (like `return`) are allowed in Nim. This is because Nim comprehensions are just macros that expand to normal code.


- Whats `collect()`?.

[collect](https://nim-lang.github.io/Nim/sugar.html#collect.m%2Cuntyped%2Cuntyped) 
takes as argument whatever your returning type uses as the constructor.

## Dict Comprehensions

```python
variable = {key: value for key, value in enumerate((-9, 1, 42, 0, -1, 9))}
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
let variable = collect(initTable(4)):
  for key, value in @[-9, 1, 42, 0, -1, 9]: {key: value}
```

- `collect()` requires [`import std/sugar`.](https://nim-lang.github.io/Nim/sugar.html#collect.m%2Cuntyped%2Cuntyped)


## Set Comprehensions

```python
variable = {item for item in (-9, 1, 42, 0, -1, 9)}
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
let variable = collect(initHashSet):
  for item in @[-9, 1, 42, 0, -1, 9]: {item}
```

- `collect()` requires [`import std/sugar`.](https://nim-lang.github.io/Nim/sugar.html#collect.m%2Cuntyped%2Cuntyped)


## Sets

| Lang                      | Set        | Ordered Set                   | Bitset                        | [Bit Fields](https://en.wikipedia.org/wiki/Bit_field) | Imports       | 
|---------------------------|------------|-------------------------------|-------------------------------|---------------|---------------|
:snake: Python              | `set()`    | :negative_squared_cross_mark: | :negative_squared_cross_mark: | :negative_squared_cross_mark: |               | 
:crown: Nim                 | [`HashSet()`](https://nim-lang.github.io/Nim/sets.html#HashSet) | [`OrderedSet()`](https://nim-lang.github.io/Nim/sets.html#OrderedSet)       | [`set`](http://nim-lang.org/docs/manual.html#types-set-type) | [Bit Fields](https://nim-lang.org/docs/manual.html#set-type-bit-fields) | `import std/sets` |   

- **Python Set can be replaced with [HashSet](http://nim-lang.org/docs/sets.html).**

Python sets are not like the [Nim set type](http://nim-lang.org/docs/manual.html#types-set-type). The "default" set is a [bitset](https://en.wikipedia.org/wiki/Bitset). For every possible value of the contained type, it stores 1 bit indicating whether it is present in the set. This means you should use it if the type has a finite, limited range of possible values. If all of the possible values are also known at compile-time, you can create an `Enum` for them.

The biggest integer you can fit on a set normally is `65535` equals to `high(uint16)`.

You can fit bigger integers using an integer Subrange, if you don't need small integers. An example really stressing set to fit `2_147_483_647` equals to `high(int32)` on a set at compile-time:

```nim
const x = {range[2147483640..2147483647](2147483647)}
assert x is set  # Equals to {2147483647}
```

The basic Nim set type is fast and memory-efficient, compared to the [HashSet](http://nim-lang.org/docs/sets.html) which is implemented as a dictionary. For simple flag types and small mathematical sets, use set. For larger collections, or if you are just learning, use HashSet.


## Dictionaries

Use [tables](http://nim-lang.org/docs/tables.html) for Python-like dicts.

| Lang                      | Dictionary | Ordered Dictionary          | Counter        | Imports              | 
|---------------------------|------------|-----------------------------|----------------|----------------------|
:snake: Python              | `dict()`   | `OrderedDict()`             | `Counter()`    | `import std/collections` | 
:crown: Nim                 | [`Table()`](https://nim-lang.org/docs/tables.html#basic-usage-table) |  [`OrderedTable()`](https://nim-lang.org/docs/tables.html#basic-usage-orderedtable) | [`CountTable()`](https://nim-lang.org/docs/tables.html#basic-usage-counttable) | `import std/tables`      |   

#### Table Constructors
```python
dict(key="value", other="things")
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
to_table({"key": "value", "other": "things"})
```

#### Ordered Dictionary
```python
collections.OrderedDict([(8, "hp"), (4, "laser"), (9, "engine")])
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
to_ordered_table({8: "hp", 4: "laser", 9: "engine"})
```

#### Counters
```python
collections.Counter(["a", "b", "c", "a", "b", "b"])
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
to_count_table("abcabb")
```

**Examples:**
``` Nim
import std/tables

var dictionary = to_table({"hi": 1, "there": 2})

assert dictionary["hi"] == 1
dictionary["hi"] = 42
assert dictionary["hi"] == 42

assert len(dictionary) == 2
assert dictionary.has_key("hi")

for key, value in dictionary:
  echo key, value
```

Tables are just syntax sugar for an array of tuples:

```nim
assert {"key": "value", "k": "v"} == [("key", "value"), ("k", "v")]
assert {"key": true, "k": false} == @[("key", true),  ("k", false)]
```

#### B-Tree Tables

[B-Tree based generic sorted Tables](https://nim-lang.github.io/Nim/btreetables.html) using the same API.

See also:
- [Whats B-Tree ? (Wikipedia).](https://en.wikipedia.org/wiki/B-tree)
- [Whats B-Tree ? (1 Minute Animated Video).](https://youtu.be/coRJrcIYbF4)


### Ternary operators

```python
"result0" if conditional else "result1"
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
if conditional: "result0" else: "result1"
```

In Nim the "ternary operator" is simply an `if..else` inline. Unlike Python, the ordinary `if..else` is an expression, so it can be assigned to a variable. These snippets are equivalent:

```nim
var foo = if 3 < 10:
  50
  else: 100
```

```nim
var foo = if 3 < 10: 50 else: 100
```

## Reading and writing files

**Reading files line by line**
```python
with open("yourfile.txt", "r") as f:
    for line in f:
        print(line)

```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
for line in lines("yourfile.txt"):
  echo line
```

- `lines()` Documentation https://nim-lang.org/docs/io.html#lines.i%2Cstring

**Reading and writing files:**

```nim
write_file("yourfile.txt", "this string simulates data")
assert read_file("yourfile.txt") == "this string simulates data"
```

**Reading files at compile-time:**
```nim
const constant = static_read("yourfile.txt")  # Returns a string at compile-time
```


## Change File Permissions

```python
import std/os
os.chmod("file.txt", 0o777)
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
import fusion/filepermissions
chmod "file.txt", 0o777
```

These examples assume a file `"file.txt"` exists.
[Both use the octal Unix file permissions.](https://en.wikipedia.org/wiki/File-system_permissions#Notation_of_traditional_Unix_permissions)
[Also a lower level API is available on `os` module.](https://nim-lang.github.io/Nim/os.html#setFilePermissions%2Cstring%2Cset%5BFilePermission%5D)

See https://nim-lang.github.io/fusion/src/fusion/filepermissions.html


## Temporarily Change Folder

```python
import std/os

class withDir:
    # Unsafe without a __del__()

    def __init__(self, newPath):
        self.newPath = os.path.expanduser(newPath)

    def __enter__(self):
        self.savedPath = os.getcwd()
        os.chdir(self.newPath)

    def __exit__(self, etype, value, traceback):
        os.chdir(self.savedPath)


with withDir("subfolder"):
  print("Inside subfolder")
print("Go back outside subfolder")
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
import fusion/scripting

withDir "subfolder":
  echo "Inside subfolder"
echo "Go back outside subfolder"
```

These examples assume a folder `"subfolder"` exists.
Python optionally has third-party dependencies which do the same thing; the examples use the standard library.
Some Python third-party dependencies may convert the code inside `withDir` to a generator, forcing you to change the code (like `return` to `yield` etc), examples use standard library.

See https://nim-lang.github.io/fusion/src/fusion/scripting.html


## Map & Filter

```python
def isPositive(arg: int) -> bool: 
  return arg > 0

map(isPositive, [1, 2,-3, 5, -9])
filter(isPositive, [1, 2,-3, 5, -9])
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
proc isPositive(arg: int): bool = 
  return arg > 0 

echo map([1, 2,-3, 5, -9], isPositive)
echo filter([1, 2,-3, 5, -9], isPositive)
```

- map and filter operations require [`import std/sequtils`.](https://nim-lang.org/docs/sequtils.html)


## Lambdas

```python
variable: typing.Callable[[int, int], int] = lambda var1, var2: var1 + var2
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
var variable = proc (var1, var2: int): int = var1 + var2
```

Multi-line example:

```nim
var anon = func (x: int): bool =
             if x > 0:
               result = true
             else: 
               result = false

assert anon(9)
```

Python anonymous functions can not use `return`, but it just works in Nim: 

```python
example = lambda: return 42
assert example() == 42
```

Complains `SyntaxError: invalid syntax`.

:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
let example = func: int = return 42
assert example() == 42
```

Python anonymous functions can not use `yield`, but it just works in Nim: 

```python
example = lambda: for i in range(0, 9): yield i

for _ in example(): pass
```

Complains `SyntaxError: invalid syntax`.

:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
let example = iterator: int = 
  for i in 0..9: yield i

for _ in example(): discard
```

[Anonymous procs in Nim](https://nim-lang.org/docs/manual.html#procedures-anonymous-procs) are basically functions without a name.


## Decorators

- Templates and macros can be used similarly to Python's decorators.

```python
def decorator(argument):
  print("This is a Decorator") 
  return argument

@decorator
def function_with_decorator() -> int:
  return 42

print(function_with_decorator())

```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
template decorator(argument: untyped) =
  echo "This mimics a Decorator"
  argument

func function_with_decorator(): int {.decorator.} =
  return 42

echo function_with_decorator()
```

- Why doesn't Nim use `@decorator` syntax?.

Nim uses `{.` and `.}` because it can have several decorators together.

Also in Nim one works on variables and types:

```nim
func function_with_decorator(): int {.discardable, inline, compiletime.} =
  return 42

let variable {.compiletime.} = 1000 / 2

type Colors {.pure.} = enum Red, Green, Blue
```

[@](https://nim-lang.github.io/Nim/system.html#%40%2CopenArray%5BT%5D) 
is a function that converts from `array` to `seq`.


## JSON

Python uses multi-line strings with JSON inside, Nim uses literal JSON directly in the code.

```python
import std/json

variable = """{
    "key": "value",
    "other": true
}"""
variable = json.loads(variable)
print(variable)
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
import json

var variable = %*{
  "key": "value",
  "other": true
}
echo variable
```

- `%*` converts everything inside the braces to JSON, JSON has a type `JsonNode`.
- `%*` can have variables and literals inside the braces.
- JSON can have Nim comments inside the braces of `%*`.
- If the JSON is not valid JSON, the code will not compile.
- `JsonNode` can be useful in Nim because is a type that can have [mixed types](https://nim-lang.github.io/Nim/manual.html#types-object-variants) and can grow/shrink.
- You can read JSON at compile-time, and store it in a constant as a string.
- To parse JSON from a string you can use `parseJson("{}")`.
- To parse JSON from a file use `parseFile("file.json")`.
- [JSON documentation](https://nim-lang.org/docs/json.html)


## Self-Execution of Main Module

```python
if __name__ == "__main__":
  main()
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
when is_main_module:
  main()
```


## Unittests

```python
import std/unittest


def setUpModule():
    """Setup: Run once before all tests in this module."""
    pass

def tearDownModule():
    """Teardown: Run once after all tests in this module."""
    pass


class TestName(unittest.TestCase):
    """Test case description"""

    def setUp(self):
        """Setup: Run once before each tests."""
        pass

    def tearDown(self):
        """Teardown: Run once after each test."""
        pass

    def test_example(self):
        self.assertEqual(42, 42)


if __name__ == "__main__":
    unittest.main()
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
import std/unittest

suite "Test Name":

  echo "Setup: Run once before all tests in this suite."

  setup:
    echo "Setup: Run once before each test."

  teardown:
    echo "Teardown: Run once after each test."

  test "example":
    assert 42 == 42

  echo "Teardown: Run once after all tests in this suite."
```

- [Unittest documentation.](https://nim-lang.org/docs/unittest.html)
- [The Nimble package manager can also run Unittests.](https://github.com/nim-lang/nimble#nimble-tasks)
- [NimScript can also run Unittests.](https://nim-lang.org/docs/nims.html)
- [You can run documentation as Unittests with `runnableExamples`](https://nim-lang.org/docs/system.html#runnableExamples%2Cuntyped).


#### Assert with customized messages

- `assert` can take a `block`. You can customize the message for better user experience:

```nim
let a = 42
let b = 666
doAssert a == b, block:
  ("\nCustom Error Message!:" &
   "\n  a equals to " & $a &
   "\n  b equals to " & $b)
```


### Testament

An alternative to `unittest`. It is prepared for big projects and has more features.

- https://nim-lang.github.io/Nim/testament.html **(Recommended)**


## Docstrings

Docstrings in Nim are ReSTructuredText *and* MarkDown comments starting with `##`. ReSTructuredText and MarkDown can be mixed together if you want.

Generate HTML, Latex (PDF) and JSON documentation from source code with `nim doc file.nim`.

Nim can generate a dependency graph DOT `.dot` file with `nim genDepend file.nim`.

[You can run documentation as Unittests with `runnableExamples`](https://nim-lang.org/docs/system.html#runnableExamples%2Cuntyped).

```python
"""Documentation of module"""

class Kitten(object):
    """Documentation of class"""

    def purr(self):
        """Documentation of method"""
        print("Purr Purr")
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
## Documentation of Module *ReSTructuredText* and **MarkDown**

type Kitten = object ## Documentation of type
  age: int  ## Documentation of field

proc purr(self: Kitten) =
  ## Documentation of function
  echo "Purr Purr"
```

## Optional Indentation

You can write constructs like `if..then` and `try..except..finally` on a single line without errors or warnings; indentation is optional. Obviously, this is only a good idea if the snippet is short and simple.

```nim
let a = try: 1 + 2 except: 42 finally: echo "Inline try"

let b = if true: 2 / 4 elif false: 4 * 2 else: 0

for i in 0 .. 9: echo i

proc foo() = echo "Function"

(proc   () = echo "Anonymous function")()

template bar() = echo "Template"

macro baz() = echo "Macro"

var i = 0
while i < 9: i += 1

when is_main_module: echo 42
```


## CamelCase

- Why is Nim CamelCase instead of snake_case?.

It really isn't, Nim is style-agnostic!

```nim
let camelCase = 42      # Declaring as camelCase 
assert camel_case == 42 # Using as snake_case

let snake_case = 1      # Declaring as snake_case
assert snakeCase == 1   # Using as camelCase

let `free style` = 9000
assert free_style == 9000  
```

**This feature allows Nim to seamlessly interoperate with a lot of programming languages with different casing styles.**

For more homogeneous code you can enforce a default casing style using the compiler command `--styleCheck:hint`. Nim will *style check* your code before compilation, similar to `pycodestyle` in Python. If you want even more strict styling you can use `--styleCheck:error`.

Nim comes with a builtin code auto-formatter named Nimpretty.

A lot of programming languages have some kind of case-insensitivity, such as:
PowerShell, SQL, PHP, Lisp, Assembly, Batch, ABAP, Ada, Visual Basic, VB.NET, Fortran, Pascal, Forth, Cobol, Scheme, Red, Rebol.

If you are just starting from scratch, you can use Python-like names while learning. It will not produce an error unless you tell the compiler you want that.

## def vs proc/func

- Why doesn't Nim use `def` instead of `proc`?.

Nim uses `proc` for normal functions, which is short for "procedure".

Use `func` for when your routine cannot and should not access global or thread-local variables (see also: [pure functions](https://en.wikipedia.org/wiki/Pure_function)).

[Nim has side-effects tracking.](https://nim-lang.github.io/Nim/manual.html#procedures-func)

You can not use `echo` inside `func`, because `echo` mutates `stdout`, which is a side-effect. Use `debugEcho` instead.

See also:
- [Strict Func](https://nim-lang.github.io/Nim/manual_experimental.html#strict-funcs)
- [Write Tracking for Nim](https://nim-lang.org/araq/writetracking_2.html)

If you are just starting from scratch, you can use `proc` for all the functions while learning. It will not produce an error for doing so.

# Async

Nim has had async built-in for a long time. It works as you may expect with `async`, `await`, `Future`, etc.

[asyncdispatch](https://nim-lang.org/docs/asyncdispatch.html) is a module to write concurrent code using the `async`/`await` syntax.

`Future` is a type (like a Future in Python, or a Promise in JavaScript).

`{.async.}` is a pragma that converts functions to async (like `async def` in Python).

Let's convert the official Python asyncio *Hello World* to Nim:

```python
async def main():
    print("Hello ...")
    await asyncio.sleep(1)
    print("... World!")

asyncio.run(main())
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
proc main() {.async.} =
  echo("Hello ...")
  await sleep_async(1)
  echo("... World!")

wait_for main()
```

Internally async is implemented using metaprogramming (macros, templates, pragmas, etc).

| Description                      | [asyncCheck](https://nim-lang.org/docs/asyncfutures.html#asyncCheck%2CFuture%5BT%5D) | [waitFor](https://nim-lang.org/docs/asyncdispatch.html#waitFor%2CFuture%5BT%5D) | [await](https://nim-lang.org/docs/asyncdispatch.html#await%2CT) |
|----------------------------------|------------|---------|-------|
| Waits for the Future to complete | :negative_squared_cross_mark: | :heavy_check_mark: | :heavy_check_mark: |
| Ignores the Future               | :heavy_check_mark: | :negative_squared_cross_mark: | :negative_squared_cross_mark:  |
| Returns result inside Future     | :negative_squared_cross_mark: | :heavy_check_mark: | :heavy_check_mark: |
| Only available inside async      | :negative_squared_cross_mark: | :negative_squared_cross_mark: | :heavy_check_mark: |

- Why doesn't Nim use `async def`?.

Async is just a `macro` in Nim, no need to change the syntax of the language. It is like a decorator in Python, only more powerful.

Also in Nim the same function can be asynchronous *and* synchronous at the same time, with the same code, with the same name.

In Python when you have a library *"foo"*, you may need both `foo` (sync) and `aiofoo` (async), which are usually completely different projects, repos, developers and APIs. This is not needed in Nim, or rarely seen, thanks to said feature.

[Because async is just a `macro` in Nim you can create your own async your way too.](https://github.com/disruptek/cps#why)

See also [asyncfile](https://nim-lang.org/docs/asyncfile.html), 
[asyncnet](https://nim-lang.org/docs/asyncnet.html), 
[asyncstreams](https://nim-lang.org/docs/asyncstreams.html), 
[asyncftpclient](https://nim-lang.org/docs/asyncftpclient.html),
[asyncfutures](https://nim-lang.org/docs/asyncfutures.html).


# Do I have to know C?

You never have to actually manually edit C, the same way in Python you never manually edit the .pyc files.

In Nim you code by writing Nim, the same way in Python you code by writing Python.


## Templates

A template replaces its invocation with the template body at compile-time.

Essentially, **the compiler will copy and paste a chunk of code for you**.

A template allows us to have a function-like constructs without any overhead, or
to split huge functions into smaller parts.

Too many function and variable names may pollute the local namespace.
Variables inside templates do not exist outside of their template.
Templates do not exist in the namespace at run-time (if you do not export them),
Templates may optimize certain values if they are known at compile-time.

Templates *cannot* do `import` nor `export` of libraries automatically implicitly. Templates do *not* "auto-import" symbols used inside itself. If you use any imported library on the body of a template, you must import that library when invoking that template.

Inside templates you can not use `return` because a template is not a function.

Templates allow you to implement very high-level, beautiful APIs for everyday usage, while keeping the low-level optimized details out of your head and [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself).

Python `with open("file.txt", mode = "r") as file:` implemented using a template:

[![Template explanation animation](https://raw.githubusercontent.com/juancarlospaco/nim-presentation-slides/master/templates.gif "Template explanation animation")](https://github.com/juancarlospaco/nim-presentation-slides/blob/master/templates.xcf)

The GIF is not perfect, but a lazy simplified approximation! 

This is not the way to read files in Nim, just an exercise.

This template is not perfect, but a lazy approximation. It is an exercise for the reader to try to improve it ;P

```nim
template withOpen(name: string, mode: char, body: untyped) =
  let flag = if mode == 'w': fmWrite else: fmRead  # "flag" doen't exist outside of this template
  let file {.inject.} = open(name, flag)   # Create and inject `file` variable, `file` exists outside of this template because of {.inject.}
  try:
    body                                   # `body` is the code passed as argument
  finally:
    file.close()                           # Code after the code passed as argument

withOpen("testing.nim", 'r'): # Mimic Python with `open("file", mode='r') as file`
  echo "Hello Templates"      # Code inside the template, this 2 lines are "body" argument on the template
  echo file.read_all()        # This line uses "file" variable
```

If you are just starting from scratch, do not worry, you can use functions for everything while learning.


## How to share variables between functions?

Sharing variables between functions is similar to Python.

**Global variable:**

```python
global_variable = ""

def function0():
    global global_variable
    global_variable = "cat"

def function1():
    global global_variable
    global_variable = "dog"

function0()
assert global_variable == "cat"
function1()
assert global_variable == "dog"
function0()
assert global_variable == "cat"
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
var global_variable = ""

proc function0() =
  global_variable = "cat"

proc function1() =
  global_variable = "dog"

function0()
assert global_variable == "cat"
function1()
assert global_variable == "dog"
function0()
assert global_variable == "cat"
```

**Object Attribute:**

```python
class IceCream:

  def __init__(self):
    self.object_attribute = None

def function_a(food):
    food.object_attribute = 9

def function_b(food):
    food.object_attribute = 5

food = IceCream()
function_a(food)
assert food.object_attribute == 9
function_b(food)
assert food.object_attribute == 5
function_a(food)
assert food.object_attribute == 9
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
type IceCream = object
  object_attribute: int

proc functiona(food: var IceCream) =
  food.object_attribute = 9

proc functionb(food: var IceCream) =
  food.object_attribute = 5

var food = IceCream()
functiona(food)
assert food.object_attribute == 9
functionb(food)
assert food.object_attribute == 5
functiona(food)
assert food.object_attribute == 9
```

You can pass functions as arguments to other functions like in Python. Functions (procs) are first class objects.


### In-Place vs Out-Place

If you are migrating from an interpreted language, like Python or JavaScript, you may find strange mentions of "In-Place" and "Out-Place" somewhere in Nim. If you don't know what it means then Nim looks like it has duplicated functions.

Python allocates a new string or object when something in it changes somehow. Let's say you have a huge string in a variable and you want to change a single character. Since Python strings are immutable, the only solution is to duplicate the string in memory but with the new copy having that character changed. Returning a new copy is an "Out-Place" operation. Most of Python works like this.

On the other hand, Nim's strings are mutable. In Nim you can change only the character you want to change, rather than copying the string in memory. Some functions work in-place, some functions work on a new copy. The documentation will (usually) which.

[using `macro` Nim can turn from an in-place function to out-place one.](https://nim-lang.github.io/Nim/sugar.html#dup.m%2CT%2Cvarargs%5Buntyped%5D)

Nim stdlib modules designed for the JavaScript target usually work on a new copy. This is just how the JavaScript target is; there is no in-place API nor benefits from using it.

Some Nim stdlib modules that work on a new copy may or may not be changed to work in-place in the future.

Examples:

```nim
import std/sugar  # sugar.dup

func inplace_function(s: var string) =  # Does not use "string" but "var string"
  s = "CHANGED"

# In-Place algo.
var bar = "in-place"
inplace_function(bar)  ## Variable mutated in-place.
assert bar == "CHANGED"

# Out-Place algo.
assert "out-place".dup(inplace_function) == "CHANGED"  ## Variable mutated on a new copy.
```


## Import Nim files in Python

- https://github.com/Pebaz/nimporter#nimporter


## Python Syntax for Nim

- https://github.com/Yardanico/nimpylib#nimpylib


## Publish to PYPI

- https://github.com/yglukhov/nimpy/wiki#publish-to-pypi
- https://github.com/sstadick/ponim/blob/master/README.md#nim--python--poetry--
- https://github.com/sstadick/nython#nython

## Silent Compilation

If you want the compilation to be completely silent (you may miss important warnings and hints), 
you can add to the compile command ` --hints:off --verbosity:0 `.


## Compiler Help

The compiler help is long. To make it more user friendly only the most frequent commands are shown with `--help`. If you want to see the full help you can use `--fullhelp`.


## Build Modes

When your code is ready for production you should use a Release build,
you can add to the compile command ` -d:release `.

Feature    | Release Build                 | Debug Build                   |
-----------|-------------------------------|-------------------------------|
Speed      | Fast                          | Slow                          
File Size  | Small                         | Big                           
Optimized  | :heavy_check_mark:            | :negative_squared_cross_mark: 
Tracebacks | :negative_squared_cross_mark: | :heavy_check_mark: 
Run-time checks | :heavy_check_mark:       | :heavy_check_mark: 
Compile-time checks | :heavy_check_mark:   | :heavy_check_mark: 
`assert`   | :negative_squared_cross_mark: | :heavy_check_mark: 
[`doAssert`](https://nim-lang.org/docs/assertions.html#doAssert.t%2Cuntyped%2Cstring) | :heavy_check_mark:  | :heavy_check_mark: 


# MicroPython

Nim compiles to C, so it can run on Arduino and similar hardware.

Has several memory management strategies to fit your needs, including full manual memory management.
Nim binaries are small when built for Release and it can fit the hardware tiny storage.

- https://github.com/zevv/nim-arduino
- https://github.com/elcritch/nesper#example-code
- https://gitlab.com/endes123321/nimcdl/tree/master#nimcdl-nim-circuit-design-language
- https://github.com/cfvescovo/Arduino-Nim#arduino-nim
- https://gitlab.com/nimbed/nimbed#nimbed
- https://gitlab.com/endes123321/led-controller-frontend#led-controller-frontend
- https://gitlab.com/jalexander8717/msp430f5510-nim
- https://github.com/mwbrown/nim_stm32f3
- https://github.com/gokr/ardunimo
- https://gitlab.com/NetaLabTek/Arduimesp
- https://ftp.heanet.ie/mirrors/fosdem-video/2020/AW1.125/nimoneverything.webm


# SuperCollider

SuperCollider is C++ so it can be re-utilized using Nim.

Theoretically, Nim SuperCollider plugins should be just as fast as C code.
Nim's metaprogramming allows us to build LiveCoding friendly DSLs.

Some projects for Nim LiveCoding:

- https://github.com/vitreo12/omni#omni
- https://github.com/capocasa/scnim#scnim---writing-supercollider-ugens-using-nim


#### ABC

See [this](http://rosettacode.org/wiki/Abstract_type#Nim)


## Philosophy

The key to understanding Nim is that Nim was designed to be as fast as C, but to be much safer. Many of the design decisions are based on making it harder to shoot yourself in the foot.
In Python, there are no pointers (everything is treated as a reference).
While Nim does give you pointers, Nim gives you other, safer tools for your everyday needs, while pointers are mostly reserved for interfacing with C and doing low-level system programming.

Contrarily to Python, most Nim code can be executed at compile time to perform meta-programming.
You can do a lot of the DSLs possible with Python decorators/metaprogramming with Nim macros and pragmas.
(And some stuff that you can't!). Of course, this requires some different patterns and more type safety.


[ :arrow_up: :arrow_up: :arrow_up: :arrow_up: ](#table-of-contents "Go to top")
"""
nbSave()
