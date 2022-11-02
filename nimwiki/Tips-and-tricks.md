# Nim Tips and tricks

A mix of bits of code, cookbook recipes, deep knowledge, tips and tricks about Nim programming.

## Compilation

### Syntax

#### Check syntax

Use `nim check myfile.nim` to check your program for errors, without code generation. This makes the process quicker. Also, `nim check` displays more error messages than `nim c` and it can help finding the cause of an error.

### Using reserved words as identifiers

You can use the slanted quote string syntax (stropping) if you need to use a reserved word as an identifier.

```nim
var `type`: int
```

### Conditional compilation

#### Defining a compile time symbol

You want to define `useSomeFeature` at compilation time and use it in the code.

* Do it when you compile: `$ nim c -d:useSomeFeature myApp`
* Put it in the `yourfilename.nims` file located in the same directory as your source file `yourfilename.nim` as `switch("define", "useSomeFeature")`
* Put it in the `nim.cfg` file located in the same directory as source file and write `define:useSomeFeature`

```nim
when defined(useSomeFeature):
  const someSubFeature = true
  type idType = int32
  var defaultUserName = "Frank"
else:
  type idType = int16
  var defaultUserName = "Molly"

# `when` does not open a new scope, so `idType` and `defaultUserName` are available here.

when isMainModule:
  # this code is ran only when this module is the main compilation module
  echo "This module was compiled on ", CompileDate, " at ", CompileTime
```

### Errors

#### Error: attempting to call routine: 'a'

Nim likes spaces. This is a quirk of the command syntax where `a +b` is evaluated as `a(+(b))`.
Use spaces, preferably, like `a + b` or else `a+b`, but don't mix space and no-spaces usage.

#### Error: expression '...' has no type (or is ambiguous)

- Have you tried to `discard` the value from a proc that does not return any value?

```nim
proc noReturnValue =
  echo "Foo!"

discard noReturnValue()
```

#### Error: '...' doesn't have a concrete type, due to unspecified generic parameters.

- A inner proc "inherits" the including proc generics declaration and you don't need to re-define them.

```nim
proc foo[T](x: T) =
  proc bar[T](y: T) =    <== Error is here
    echo "In bar"
  echo "In foo"
```
You must write:

```nim
proc foo[T](x: T) =
  proc bar(y: T) =    # Generic type T is defined by englobing proc
    echo "In bar"
  echo "In foo"
```

#### Error: undeclared field: 'major' for type foo.Version

To access fields of a public object, these fields must be public too.

This is causing the error, where ``Version`` is defined in ``foo.nim``:

```nim
type
  Version* = object
    major: int
```

You must write:

```nim
type
  Version* = object
    major*: int
```

#### Error: template instantiation too nested

Remember that templates replace template call with template body recursively. This can occur even in non-recursive templates in case of parameter clash. For instance:

```nim
template foo(body: untyped) =
  template bar(body: untyped) =
    ...
```

Here the ``body`` parameter is not seen both by ``foo`` and ``bar`` as different symbols. When ``foo`` instantiates, it will replace the occurrence in ``bar`` parameters. To prevent the symbol name clash, you must write:

```nim
template foo(fooBody: untyped) =
  template bar(barBody: untyped) =
    ...
```

#### Error: identifier expected, but found '...

See also `Error: template instantiation too nested`

#### Error: type mismatch: got &lt;X&gt; but expression is of type: X

This can happen when a type is defined twice, probably because of a file ``include``. This can occur too when you create duplicated types in macro code.

#### Error: ambiguous call; both procName...

You have forward declared `procName` to define recursive macro procs but the compiler complains that it found two declarations of `procName`. Additionally, there's a hint that `procName` is declared but not used!

This happens because the forward declaration does not [use the same parameter names](https://github.com/nim-lang/Nim/issues/12175) as in the proc definition .

```nim
# Forward declaration of procName that will cause a compile error.
# Use argument `stmt` instead of `arg` to have it compile.
proc procName(arg: NimNode): NimNode

proc procName(stmt: NimNode): NimNode =
  ...
```

## Tests

#### How to test that the compiler will reject a piece of code?

Use [compiles](https://nim-lang.org/docs/system.html#compiles%2Cuntyped).

```nim
import unittest

suite "valid syntax":
  test "syntax errors":
    let a = "foo"
    let b = 5
    assert not compiles(let c = a + b), "Can't mix string and int"
```

#### Enhance documentation with examples

You can provide examples of in your documentation, with [runnableExamples](https://nim-lang.org/docs/system.html#runnableExamples%2Cuntyped).
When the documentation is extracted from the source with `$ nim doc myfile.nim`, these examples are extracted and put in a temporary
file, compiled and tested. This is a good way to provide examples for your API and check that they are still valid.

```nim
proc isOdd(i: int): bool =
  ## Test if its argument is odd.
  runnableExamples:
    assert 5.isOdd, "5 is an odd number"
    assert not isOdd(3 * 2), "6 is not an odd number"

  result = i mod 2 == 1
```

## Templates

#### Templates overloading

Like proc or funct, template follow overloading rules. You can use normal types for parameters but they can have meta-types too: `typed`, `untyped` and `typedesc`.

There are [lazy type resolution rules for `untyped`](https://nim-lang.org/docs/manual.html#overloading-resolution-lazy-type-resolution-for-untyped) parameters.

For `typed` parameters, you can use [parameter constraints](https://nim-lang.org/docs/manual_experimental.html#term-rewriting-macros-parameter-constraints) to reduce the scope of the parameters.

```nim
template foo(x: typed{lit}) =
  echo "foo matched the literal '", x, "'"

template foo(x: typed{ident}) =
  echo "foo matched the identifier '", x, "'"
```

#### Template scopes

You have defined a `dsl:` and you want to define an `options:` template that can be used only within `dsl:`. How do you do this? Use `block:` scopes and [declaredInScope](https://nim-lang.org/docs/system.html#declaredInScope%2Cuntyped), like following:

```nim
template dsl*(body: untyped) =
  block:
    const inDsl {.inject, used.} = true
    # Here define the dsl code...

template options(body: untyped) =
  when not declaredInScope(inDsl):
    {.fatal: "`options` can be used only in `dsl` block".}
    # Here define the options code...
```

Don't try to create englobing templates! Templates are text code rewriting macros and you'll get unexpected results...

## Macros

#### Dump macro expansion

[expandMacros](https://nim-lang.org/docs/macros.html#expandMacros.m%2Ctyped) shows how a macro call is expanded at compilation time. It's very useful for debugging macros...

[dumpTree](https://nim-lang.org/docs/macros.html#dumpTree.m%2Cuntyped) can also be used to print how a block of code is parsed at compile time.

```nim
import macros

let x, y = (4, 8)
expandMacros:
  echo "x > y is expanded to ", x > y
dumpTree:
  echo "x > y is expanded to ", x > y
```

## Output

#### Echo to stderr

`echo` writes to `stdout`. If you want to print to `stderr` use [write](https://nim-lang.org/docs/streams.html#write%2CStream%2Cvarargs%5Bstring%2C%5D) and [writeLine](https://nim-lang.org/docs/streams.html#writeLine%2CStream%2Cvarargs%5Bstring%2C%5D)

```nim
writeLine(stderr, "Write to stderr")
```

#### How do I echo in a `{.noSideEffect.}` proc?

You can use [debugEcho](https://nim-lang.org/docs/system.html#debugEcho%2Cvarargs%5Btyped%2C%5D) for this.

## Enums

#### Converting string to enum

Strings can be converted to enum using [parseEnum](https://nim-lang.org/docs/strutils.html#parseEnum%2Cstring) from [strutils](https://nim-lang.org/docs/strutils.html). Beware that a `ValueError` is raised if the enum is not found. If you don't want to manage
the exception, provide a default with [parseEnum](https://nim-lang.org/docs/strutils.html#parseEnum%2Cstring%2CT).

```nim
import strutils

type
  Fruit = enum
    Apple,
    Banana,
    Cherry

  let fruit = parseEnum[Fruit]("cherry")
  let pineapple = parseEnum[Fruit]("pineapple", Banana)
```

## Tuple

#### Enumerate the fields of a tuple or object.

[fields](https://nim-lang.org/docs/iterators.html#fields.i%2CS%2CT) and [fieldPairs](https://nim-lang.org/docs/iterators.html#fieldPairs.i%2CT) will help you discover the fields and values of a tuple or object. But as Nim is strongly type, you can't build a result mixing types. Either use conditional compilation for different code paths or use overloading.

```nim
type
  Custom = object
    foo: string
    bar: bool

proc `$`(x: Custom): string =
  result = "Custom:"
  for name, value in x.fieldPairs:
    when value is bool:
      result.add("\n\t" & name & " is " & $value)
    else:
      result.add("\n\t" & name & " \'" & value & "\'")

proc `$1`(x: string): string = $x
proc `$1`(x: bool): string = $x

proc `$1`(x: Custom): string =
  result = "Custom:"
  for name, value in x.fieldPairs:
    result.add("\n\t" & name & " is " & `$1`(value))

let o = Custom(foo: "Hi there!", bar: false)

echo "o=", $o
echo "o1=", `$1`(o)
```

## Seq and lists

#### Heterogeneous lists

Nim being strongly typed, you can't mix multiple types in a ``seq``. [andrea](https://forum.nim-lang.org/t/4415) came out with heterogeneous lists that fit that special need:

```nim
# hlist.nim

type
  HNil* = object
  HCons*[H, T] = ref object
    h: H
    t: T
  HList = HNil or HCons

let hNil* = HNil()

proc cons*[H; T: HList](hd: H; tl:T): auto =
  HCons[H, T](h: hd, t: tl)

template `<>`*(hd, tl: untyped): untyped = cons(hd, tl)

proc head*[H, T](c: HCons[H, T]): H {.inline.} = c.h

proc tail*[H, T](c: HCons[H, T]): T {.inline.} = c.t
```

They can be used like in this short example where ``l`` contains a ``string`` and an ``int``.

```nim
import hlist

proc printAll(n: HNil) =
  discard

proc printAll[H; T](hl: HCons[H, T]) =
  echo hl.head
  printAll(hl.tail)

let l = "hi" <> (2 <> hNil)
printAll(l)
```

## Iterators

### Recursive iterators

From a [forum post](https://forum.nim-lang.org/t/7020) demonstrating how to simulate recursive iterator by converting a recursive proc to generate all character permutations of a string. This macro does not support `break` or `continue` statement, but read the referred [post](https://forum.nim-lang.org/t/7020) to find more complete example.

```nim
import std/macros

macro toItr*(x: ForLoopStmt): untyped =
    ## Convert factory proc call for inline-iterator-like usage.
    ## E.g.: ``for a,b in toItr(myFactory(parm)): echo a,b``.
    let
        forVars = x[0..^3]
        call    = x[^2][1] # Get foo out of toItr(foo)
        body    = x[^1]
        itrSym  = ident"itr"
        #itrSym  = genSym(ident="itr")
    var forTree = nnkForStmt.newTree()  # for
    for v in forVars: forTree.add v     # for v1,...
    forTree.add(nnkCall.newTree(itrSym), body) # for v1,... in itr(): body
    result = quote do:
        block:
            let `itrSym` {.inject.} = `call`
            `forTree`
    #debugEcho result.repr # uncomment to print the generated code

when isMainModule:
    proc lex_perm[T: seq|string](s: T, idxStart=0): iterator(): (T,int) =
        var idx= idxStart
        result = iterator(): (T,int) =
            if s.len == 0: yield (s[0..<0], idx)
            for i in 0 ..< s.len:
                for s2,_ in toItr lex_perm(s[0 ..< i] & s[i+1 .. ^1], idx):
                    yield (s[i ..< i+1] & s2, idx)
                    inc idx
    
    for s,idx in toItr lex_perm("123", 1): echo idx,":  ",s
```

## External libraries

### Managing external libraries memory allocations

Some external libraries provide an API to give access to data structures that they allocated on their own. They also provide a reference counting process in order for the client code to manage when the library can release the memory or resources used by these data structures. The use of [destructors](https://nim-lang.org/docs/destructors.html) and compiling with ``--gc:arc`` or ``--gc:orc`` can ease bridging to these API. In the following sample, ``apiX()`` are calls to the external library API.

```nim
type
  MyObject* = object
    ## The Nim proxy object that is used in Nim code
    apiObject: pointer
      ## The pointer to the library object

proc initMyObject*: MyObject =
  ## Get a new library object.
  result = MyObject(apiObject: apiGetObject(...))
  # We increment the reference counter for this object
  apiIncRefCounter(apiObject)

proc `=destroy`(o: var MyObject) =
  ## When a ``MyObject`` is destroyed in Nim code, we need to decrement
  ## the API reference counter of that object.
  if not isNil(o.apiObject):
    apiDecRefCounter(o.apiObject)
    o.apiObject = nil

proc `=`(a: var MyObject; b: MyObject) =
  # Do nothing for self-assignments:
  if a.apiObject == b.apiObject:
    return

  # Destroy what is allocated in a
  `=destroy`(a)

  # Copy new content to a and increment reference counter
  if not isNil(b.apiObject):
    a.apiObject = b.apiObject
    apiIncRefCounter(a.apiObject)
```

Don't forget to compile with ``--gc:arc`` or ``--gc:orc`` to enable destructors. Notice how ``MyObject`` has public visibility while its ``apiObject`` field is kept private.

## Language details

#### Shallow vs. DeepCopy

* https://forum.nim-lang.org/t/2665#16487

#### import vs include

``import`` imports the public symbols (the ones with `*` after the name) from the imported module. You can't access the non-public symbols. ``import`` lines can be used only at the top level of a module.

``include`` replace the include line with the content of the included file. You can access public and non-public symbols as they are part of the code now. ``include`` is mainly used to break big Nim files into smaller ones. ``include`` statements are not limited to the top level of module. But ``include`` files can create strange error messages too (see Error: type mismatch: got &lt;X&gt; but expression is of type: X).

## Optimization via C compiler flags (LTO, PGO, ...)

#### Clang

* https://forum.nim-lang.org/t/6295