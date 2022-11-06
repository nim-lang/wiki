import nimib, nimibook

nbInit(theme = useNimibook)

nbText:"""
<details>
  <summary>DISCLAIMER!</summary>

This page is unofficial and incomplete. Contributions are appreciated.

[official doc](https://nim-lang.org/documentation.html)

</details>

### Language Features

Feature | Haskell | Nim
---|---|---
Comments | `-- single line`, `{- multiline -}`(nestable)  | `# single line`, `#[multiline]#` (nestable)
Blocks | Uses [space and tab or C-like](https://en.wikibooks.org/wiki/Haskell/Indentation) | Uses indents like Python, another option is [statement list expression](https://nim-lang.org/docs/manual.html#statements-and-expressions-statement-list-expression)
Operators | operator is function (use `(+) a b` , or `a + b`), Operator has precedence, infix by default, [Unicode syntax](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/unicode_syntax.html) | [command call syntax](https://nim-lang.org/docs/manual.html#procedures-command-invocation-syntax) [unicode operators](https://nim-lang.org/docs/manual.html#lexical-analysis-unicode-operators)
Operator overloading | None | Operators are user defined except `=` and `.`, can overload: subscripts, curly subscripts `a{b}`, experimental [call and dot operators](https://nim-lang.org/docs/manual_experimental.html#special-operators)
If/else statement | None | `if a: foo() else: bar()`
If/else expression | `if test then a else b` | `if test: a else: b`
case expression | `case t of m1 -> a`<br/>`    otherwise -> b` | `case t`<br/>`of m1: a`<br/>`else: b`
Exception | [many ways](https://wiki.haskell.org/Exception), use `Control.Monad`,   | `try: foo() except Exception as ex: bar() finally: bar()` - can omit `as ex` or `Exception as ex`
Procedure definition | `id a = a`, `id::a->a` for declare | `proc foo(a: U, b: S): T = discard` in module
Method definition | None | `method foo(obj: Obj, a: U, b: S): T = discard` in module
Calling procedure | `func a b`, or `a \`func\` b` | `foo(a, b)`, `foo a, b`, `a.foo(b)`, `a.foo b`
Calling method | None | `foo(obj, a, b)`, `foo obj, a, b`, `obj.foo(a, b)`, `obj.foo a, b`
Method/procedure declarations are order-agnostic | Yes | No, can use forward declarations, experimental [code reordering](https://nim-lang.org/docs/manual.html#scope-rules-code-reordering)
String literals | `"str"` | `"str"`, `"""str"""`, `foo"str"` ([raw string literals](https://nim-lang.org/docs/manual.html#lexical-analysis-raw-string-literals))
Collection literals |  [list comprehension](https://wiki.haskell.org/List_comprehension) `[(a, b) | b <- ['a'..'z']`, a <- [1..50], even a], [Overloaded string and list](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/overloaded_strings.html) | array `[1, 2, 3]`, seq `@[1, 2, 3]`, set `{1, 2, 3}`, tuple `(1, 2, 3)`, [table constructor](https://nim-lang.org/docs/manual.html#statements-and-expressions-table-constructor)
compiler output | `hi` interface file, native assembly or llvm | translate to C, C++, Objective C , JavaScript
major compiler | ghc | nim
major REPL | ghci | `nim secret`
stability | old | young
meta-programming | template-haskell | `macro` keyword
template | use `{-# LANGUAGE CPP #-}` | `template` keyword
pure function | IO Monad | `func` keyword or `noSideEffect` pragma

### Data Types

#### Haskell

Haskell is pure functional language, variables are immutable

However, you can use [State Monad](https://wiki.haskell.org/State_Monad) or [IORef](https://hackage.haskell.org/package/base-4.16.0.0/docs/Data-IORef.html) to behave like mutable

`let` behaves like create new immutable variable

```haskell
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
  let smaller = quicksort [a | a<-xs, a<=x]
      bigger  = quicksort [a | a<-xs, a>x]
  in  smaller ++ [x] ++ bigger
```

In addition, `where` is the same

```haskell
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = smaller ++ [x] ++ bigger
    where
       smaller = quicksort [a | a<-xs, a<=x]
       bigger  = quicksort [a | a<-xs, a>x]
```

#### Nim

`var` for mutable

`let` for immutable

`const` for compile-time symbol

```nim
var mutable = "some"
mutable &= " string"
let shadow_copy = mutable
const flags = ["--run", "--hints:off"]
```

Haskell and Nim

Haskell | Nim
----- | -----
Int8  | int8
Int16 | int16
Int32 | int32
Int64 | int64
Word8 | uint8
Word16 | uint16
Word32 | uint32
Word64 | uint64
Double | float or float64 (same meaning)
Float | float32
Ptr | pointer
Bool | bool

Only Haskell

Haskell | meaning
------- | -------
Integer | Arbitrary precision integers
Ratio a | numerator and denominator in type a
Rational | aka Ratio Integer
Char | represent Unicode code points
Complex a | real and image number in type a
[a] | List with element in type a
String | aka [Char]

Only Nim

Nim  | meaning
---  | ---
char | 1 byte character
string | mutable chars
cstring | pointer to memory, `const char*`
`ptr[T]` |  untraced pointer
`ref[T]` |  traced pointer
byte | aka uint8

Nim has many type to interfacing with C

for Example: `csize_t`, `cint`, `cshort`

### type inference

Both Haskell and Nim is static typed

Haskell's most widely used compiler (GHC) has strong type inference to determine what expression's type is

for Example

```haskell
Prelude> :t 25
25:: Num a => a
Prelude> add a b = a+b
Prelude> :t add
add :: Num a => a -> a -> a
Prelude> add 1 2
3
Prelude> add 1.0 2.0
3.0
Prelude> (add 1 2)::Int
3
Prelude> (add 1 2)::Integer
3
Prelude> (add 1 2)::Float
3.0
Prelude> (add 1 2)::Double
3.0
```

the `+` function' signature is `Num a => a -> a -> a`, so `add`'s parameter *a* and *b* must instance of Num
Int, Integer ,Float, Double are instances of Num type class
use `::Type` to explicit tell the compiler the type of expression

```haskell
Prelude> :{
Prelude| repr::(Show a)=>a->String
Prelude| repr a = "repr " ++ (show a)
Prelude| :}
Prelude> repr 23
"repr 23"
Prelude> repr [1..5]
"repr [1,2,3,4,5]"
Prelude> repr (return ()::IO ())

<interactive>:7:1: error:
    * No instance for (Show (IO ())) arising from a use of `repr'
    * In the expression: repr (return () :: IO ())
      In an equation for `it': it = repr (return () :: IO ())
```

`show`'s signature is `Show a->String`, we can say repr's parameter *a* must instance of Show typeclass

```Haskell
Prelude> a = []
Prelude> :t a
a :: [a]
Prelude> a ++ ['a'..'d']
"abcd"
Prelude> a ++ [1..5]
[1,2,3,4,5]
```

`a :: [a]` means a can be any type

Nim don't accept any type, 

```nim
var arr: seq[int]
for i in 0..5:
  arr.add i
echo $arr
```

### Lazyness

In Haskell, you can pass expression to function, and it's un-evaluted.

Or you have a infinate list, you can just take first five elements, calcuate the result.

```haskell
main = do
    let a = [0..]::[Int]
    print $ take 5 a
```

In Nim, expression will be evaluted and pass to function, so do pass large data to function, you can pass by a pointer

List example

```nim
type List[T] = object
   data: T
   next: ref List[T]

func fromArray[T](a: openarray[T]): ref List[T] = 
   new(result)
   var tmp = result
   tmp[].data = a[0]
   for i in 1..<len(a):
      new(tmp[].next)
      tmp = tmp.next
      tmp[].data = a[i]
   tmp.next = nil
   return result

proc `$`[T](a: ref List[T]): string = 
   result = "["
   var tmp = a
   while true:
     result.add($ tmp.data)
     if tmp.next==nil:
        break
     result.add ", "
     tmp = tmp.next
   result.add "]"

let a = fromArray [12, 45, 27, 64, 1024, 4096]

echo a
```

### Documentation, libraries & popular tooling

Feature | Haskell | Nim
---|---|---
IDE support | use Haskell Language Server, [see](https://wiki.haskell.org/IDEs) | VS Code, see [editor support](https://github.com/nim-lang/Nim/wiki/Editor-Support)
Package manager | cabal, stack, ghc-pkg | Nimble
Library format | `hs` source, `hi` interface, `o` object, [see](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/using.html#getting-started-compiling-programs) | Source code, unused code is not included in binary (dead code elimination), can also compile to a shared library or static library
Style guide | [see](https://kowainik.github.io/posts/2019-02-06-style-guide) | [NEP-1](https://nim-lang.org/docs/nep1.html)
Doc generator | [haddock](https://haskell-haddock.readthedocs.io/en/latest/index.html) | `nim doc`, `nim rst2html`, `nim tex`, `nim jsondoc`, `nim doc2tex`
Unit testing | [HTF](https://hackage.haskell.org/package/HTF) [QuickCheck](https://hackage.haskell.org/package/QuickCheck) [HUnit](https://hackage.haskell.org/package/HUnit) | Standard library [unittest module](https://nim-lang.org/docs/unittest.html)

### Examples

#### Hello world

Haskell

```haskell
main = do
  print "enter your name"
  a <- getLine
  print $ "hello " ++ a
```

compile
```sh
ghc Main.hs
./Main 
# or runghc Main.hs
```

Nim

```nim
echo "enter your name"
let a = stdin.readLine()
echo "hello " & a
```

compile

```sh
nim c Main.nim
./Main
# or nim c --run Main.nim
```

#### case

Haskell

case expression

```haskell
case (parse "<string>" number "45") of (Right x) -> x
                                       (Left err) -> print err >> fail "parse error"
```

pattern matching

```haskell
fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)
fibs::[Integer]
fibs = 1 : 1 : zipWith (+) fibs (tail fibs)
main = print $ take 10 fibs
```

Nim

```nim
var 
  a = 0
  b = 0
  res: int
let s = "+"

case s:
of "+": res = a + b 
of "-": res = a - b
else: res = -1
```

#### Algebraic Data Type

Haskell

```haskell
data Value = IVal Integer | FVal Double deriving (Show, Eq)

data Expr
  = Var String
  | Lit Value
  | App Expr Expr
  | Lam String Expr
  deriving (Eq, Show)
```

nim

```nim
type 
  ExprKind = enum
    Var, Lit, Lam, App
  Expr = ref object
    case kind: ExprKind
    of Var:
      name: string
    of Lit:
      val: float
    of App:
      a, b: Expr
    of Lam:
      n: string
      e: Expr

func eval(e: Expr): Expr = 
   case e.kind:
   of Var: ...
```

#### importing modules

```haskell
{-# LANGUAGE Unsafe #-} -- since Unsafe.Coerce is unsafe, use LANGUAGE pragma to mark this module unsafe
module Main (hello) where -- expose hello function

import Unsafe.Coerce -- expose all symbols
import qualified Control.Monad.Writer as W -- W is the new name
import Data.ByteString hiding (putStrLn) -- readFile is not visible
import Data.Semigroup ((<>), Semigroup) -- import (<>) function and Semigroup typeclass

hello::String -- hello is type String, aka [Char]
{-# INLINABLE hello #-} -- tell ghc hello is inlineable
hello = "Hello "<>"world" -- the function body

main::IO () -- main is entry point of program, main is a empty tuple inside the IO Monad
main = putStrLn hello -- call putStrLn
{-
  {-
    multi line comment
  -}
-}
```

Nim

```nim
import System # expose all symbols
import System as S # S W is the new name
from System import create # import create
import System except int # import all symbols except int
import system as S except int # S is the new name, int is not imported

# hello is a procedure, return some string
proc hello(): string {.inline.} = "hello " & "world"

# three ways to call
# they are the same
echo hello()
hello().echo
echo(hello())

#[
  #[
       multi line comment
  ]#
]#
var mutable = "Win32"
mutable &= "API"

let immutable = ["Nim", "PlayGround", "C"]

const compileTime = 2 shl 1024

echo $mutable, $immutable, $compileTime
```

#### templates

Haskell

```haskell
{-# LANGUAGE CPP #-}

#define bind(a, f) a <- f
#define COUNT 5

main::IO ()

main = do
  putStrLn "enter a number->"
  bind(s, getLine)
  bind(num, readIO s)::IO Integer
  print $ scanl (+) 0 (take COUNT $ repeat num)
```

nim
```nim
template curry(a, b, c) = 
  a (b, c)

curry(echo, 1, 2)
```

#### macros

Haskell

Macro.hs

```haskell
{-# LANGUAGE TemplateHaskell #-}
module Macro
  ( duplicate )
where

import Language.Haskell.TH
import Language.Haskell.TH.Syntax

duplicate :: String -> Q Exp
duplicate s = do
  [| fromString s++s |]
```

Main.hs

```haskell
{-# LANGUAGE TemplateHaskell #-}

module Main where

import Macro
main :: IO ()
main = putStrLn $(duplicate "<>")
```

Nim
```nim
import macros

macro readContent(path: static[string]): untyped = 
  let c = staticRead path
  result = newLit c

stdout.write readContent("Main.nim")
```

#### FFI

Haskell

```haskell
module Main where
import Prelude hiding (sin)
import Foreign.C.Types

-- stdcall in windows
foreign import ccall "math.h sin"
    sin::CDouble->CDouble

main = print $ map sin (take 50 (scanl (+) 0 (repeat 0.001)))
```

Nim

```nim
proc sin(a: cdouble): cdouble {.importc, header: "math.h", nodecl.}

var i = 0.cdouble
while i < 0.05:
  echo sin(i)
  i += 0.001
```"""
nbSave()
