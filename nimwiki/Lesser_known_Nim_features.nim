import nimib, nimibook

nbInit(theme = useNimibook)

nbText:"""
### Implicit range type:

```nim
# `a` can accept values 0, 1, 2, 3
var a: 0 .. 3 = 2 # ok
a = 6 # compile error

a = 0; a.inc 10 # runtime error OverflowDefect

type
  Test = object
    port: 1 .. 65535

let t = Test(port: 70000) # error
```

### Less known examples of Nim argument passing syntax

Both of these ways are actually used with templates/macros, but not a lot of people realise that you can use them with normal procs (because in Nim a code block evaluates to the last expression in it if that block needs to return a value)

```nim
# first example
proc tata(a, b: int) = 
  echo a + b

tata(5): 3 # 8

tata():
  5
do:
  3

# another way of writing the second example
tata do:
  5
do:
  3
```

See [do notation](https://nim-lang.org/docs/manual_experimental.html#do-notation)

### lvalue type conversion for distinct or equivalent types, better explained with code:

```nim
type
  Dollar = distinct int

var a = 5.Dollar
int(a) = 3
```

Documented in https://nim-lang.org/docs/manual.html#type-relations-convertible-relation (last sentence in that section)

### Using enums as array indexes

Since enums are Ordinal types, they can be used for indexing arrays.
This is much faster and uses less memory than a hash table:

```nim
type
  Pet = enum
    Cat, Dog, Parrot

# Here we explicitly specify indexes
const my_pets = [
  Cat: "meow",
  Dog: "woof",
  Parrot: "hello world!"
]
echo my_pets[Parrot]

# Or without indexes:
const other: array[Pet, string] = [
  "meow", "woof", "bwak"
]
```

### Changing start index for arrays
It is possible to have Nim arrays with indexes that don't start at 0:

```nim
let data: array[3 .. 5, int] = [1, 2, 3]
echo data[4] # 2

let other: array[-5 .. -2, int] = [3, 5, 7, 9]
echo other[-3] # 7
```

### One interesting example of command invocation syntax:


```nim
# Same as if unlikely(5 > 3)
# or if (unlikely) 5 > 3
if(unlikely) 5 > 3:
  echo "not possible"
else:
  echo "true"

(echo)5 # Same as echo 5 or echo(5)
```

#### Try / except expressions

You can use try / except as an expression:

```nim
import strutils

let myint =
  try:
    parseInt("not a number")
  except ValueError:
    -1
```

Documented at https://nim-lang.org/docs/manual.html#exception-handling-try-expression

#### Overloading based on the named argument

```nim
proc foo(a: int) =
  echo "argument a: ", a

proc foo(b: int) =
  echo "argument b: ", b

foo(a=1)
foo(b=2)
foo(1)  # compilation error: ambiguous call
```

Documented in https://nim-lang.org/docs/manual_experimental.html#named-argument-overloading

#### (Ab)using statement list expressions to allow using parenthesis like braces in Nim:

```nim
proc square(inSeq: seq[float]): seq[float] = (
  result = newSeq[float](len(inSeq));
  for i, v in inSeq: (
    result[i] = v * v;
  )
)

echo square(@[1.0, 2, 3])
```
See https://nim-lang.org/docs/manual.html#statements-and-expressions-statement-list-expression

#### Using complex expressions based on other arguments as default arguments in procedures:

```nim
proc mytest(a: string, b = "hello " & $(len(a) + 5)) =  
  echo b

mytest("hello world")
```

That example is a bit stupid, but it gives you an idea of what is possible :)

A more complex example which also makes use of the `static[int]` argument:

```nim
type
  Lexer = object
    buf: seq[string]
    idx: int

func `[]`(l: Lexer, idx: static[int]): string = 
  ### Get token relative to current position - only works with literal integers
  l.buf[l.idx + idx]

func `[]`(l: Lexer, idx: int = l.idx): string = 
  ### Get current token by default but can get one at specific index if parameter is provided
  l.buf[idx]

func next(l: var Lexer) = inc l.idx

var buf = Lexer(buf: @["hello", "world", "nice"])

echo buf[] # Get current token
echo buf[+2] # Check to next tokens
buf.next() # Move to next token
echo buf[-1] # Prevous
for i in 0 ..< buf.buf.len:
  echo buf[i] # Iterate over all tokens
```

Or the last, craziest example:
```nim
proc tmp(a = 12, b = a + 2, c = ((
  block:
    var buf: string
    for i in 0 .. 2:
      buf &= " * " & $i

    buf
))
) = echo b, c

tmp(b = 122)
```

#### [`using` statement](https://nim-lang.org/docs/manual.html#statements-and-expressions-using-statement)

For modules where some kind of common state object is being passed around as argument to all procs it quickly becomes annoying to write it over and over again, especially if it has name that is longer than several characters. One possible workaround is to use type alias like `type Ps = ProcessingState` or try to use shorter names, but `using` statement is a better solution.

You can override type of the `pc` parameter - `using` only provides the default fallback type.

```nim
type 
  ProcessingContext = object
    env: seq[string]

using 
  pc: ProcessingContext

# Argument type is inferred from `using`
proc doThings1(pc; args: seq[int]) = 
  #              ^
  #              Note that semicolon (`;`) should be used to separate arguments
  #              with implicit types (declared with `using`) declaration
  static: echo "1 ", typeof pc
  echo pc.env

# Written explicitly
proc doThings2(pc: ProcessingContext, args: seq[int]) =
  #                ^                ^
  #                |                If type is written explicitly you can use
  #                |                regular comma (`,`)                      
  #                Can set parameter type explicitly. Not needed with `using` but
  #                still possible.
  static: echo "2 ", typeof pc
  echo pc.env

# Override argument type
proc doThings3(pc: int, args: seq[int]) =
  static: echo "3 ", typeof pc
```

Output:

```
1 ProcessingContext
2 ProcessingContext
3 int
```

### Python-style indexing operators with commas
Code speaks for itself:
```nim
type
  MyArr = array[8, array[8, int]]

proc `[]`(b: MyArr, r, c: int): int = 
  b[r][c]

proc `[]=`(b: var MyArr, r, c: int, val: int) = 
  b[r][c] = val

var b: MyArr

b[0, 3] = 5
echo b[0, 3]
``` 

### Iteration over `static` values

Iterate over collection of `static` values:

```nim
import strscans

for ch in fields(("a", "hay$i")):
  var i: int
  if scanf("hay12", ch, i):
    echo i
```

Regular iteration over `["a", "hay$i"]` would make `ch` just a `string`,
but with `fields` iterator loop is unrolled, so `ch` is a `static[string]`,
making it possible to use with `scanf()` which accepts compile-time
constant as it's second argument.

### Wrapping C #define macro

C defines macros can be wrapped like any procedure.

For example the coz profiler https://github.com/plasma-umass/coz/blob/381cbe5/include/coz.h#L83
exposes the following define for end users:

```C
#define COZ_PROGRESS_NAMED(name) COZ_INCREMENT_COUNTER(COZ_COUNTER_TYPE_THROUGHPUT, name)
```
This can be wrapped with
```Nim
proc coz_progress_named*(name: cstring) {.importc: "COZ_PROGRESS_NAMED", header:"path/to/coz.h".}
```
"""
nbSave()
