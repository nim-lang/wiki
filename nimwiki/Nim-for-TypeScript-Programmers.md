# Table of contents

|||||
|:---:|:---:|:---:|:---:|
| [Comparison](#comparison) | [Variables](#variables) | [Ternary operators](#ternary-operators) | [Anonymous functions](#anonymous-functions) |
| [This](#this) | [Arrow functions](#arrow-functions) | [Compile-Time Function Execution](#compile-time-function-execution) | [Server-side rendering](#server-side-rendering) |
| [Client-side rendering](#client-side-rendering) | [Svelte](#svelte) | [Parcel](#parcel) | [CommonJS](#commonjs) |
| [WebGL GUI](#webgl-gui) | [Electron](#electron) | [Webview](#webview) | [React](#react) |
| [More GUI frameworks](#more-gui-frameworks) | [WebAssembly](#webassembly) | [Build modes](#build-modes) | [Minification](#minification) |
| [Obfuscation](#obfuscation) | [JavaScript interoperability](#javascript-interoperability) | [Pragmas for Interoperability](#useful-pragmas-for-interoperability) | [Interoperability template](#interoperability-template) |
| [Regular expressions](https://nim-lang.github.io/Nim/jsre.html) | [HTML/CSS WYSYWIG editor for Nim](#htmlcss-wysywig-editor-for-nim) | [Run on NodeJS](#nodejs-compatibility) | [BigInt](https://nim-lang.github.io/Nim/jsbigints.html) |
| [Fetch](https://nim-lang.github.io/Nim/jsfetch.html) | [Best Practices](https://github.com/nim-lang/Nim/wiki/best-practices#best-practices) | [More](#more)||


<!-- [Cheatsheet PDF](https://www.overleaf.com/read/svnxffsjvscy) | (deactivated, requires login) -->
<!-- It does not require Login to read and download, needs login to edit and write. -->


<details>

  <summary>DISCLAIMER!</summary>

Unofficial, work in progress! This is still a stub. Please help to extend it.
There may be inaccuracies in this guide.
The guide assumes some intermediate knowledge.

The official tutorials can be found here:  

* [Nim Tutorial (Part I)](http://nim-lang.org/docs/tut1.html)
* [Nim Tutorial (Part II)](https://nim-lang.org/docs/tut2.html)
* [Nim Tutorial (Part II)](https://nim-lang.org/docs/tut3.html)

The official manual provides an overview of the language:

* [Nim Manual](http://nim-lang.org/docs/manual.html)

The official library docs document Nim's standard library:

* [Nim Standard Library](https://nim-lang.org/docs/lib.html)

</details>


# Comparison

Feature              |  TypeScript                          | Nim
---------------------|--------------------------------------|-----------------------------------------
Execution model      | JavaScript code (Compiler)           | JavaScript code (Compiler)
Written using        | TypeScript                           | Nim
License              | Apache                               | MIT
Version (Major)      | `3.x`                                | `1.x`
Typing               | Static, ["provably correct" types](https://github.com/Microsoft/TypeScript/wiki/TypeScript-Design-Goals#non-goals) | Static, Strong, Inferred
Meta-programming     | :negative_squared_cross_mark: [#issue-13252](https://github.com/Microsoft/TypeScript/issues/13252#issuecomment-334646630), [Decorators](https://www.typescriptlang.org/docs/handbook/decorators.html) are limited | :heavy_check_mark: template, macro
int8/16/32/64 types  | :negative_squared_cross_mark:        | :heavy_check_mark:
float32/float64 types | :negative_squared_cross_mark:       | :heavy_check_mark:
Char types           | :negative_squared_cross_mark:        | :heavy_check_mark:
Subrange types       | :negative_squared_cross_mark: [#issue-225324972](https://github.com/microsoft/TypeScript/issues/15480#issue-225324972) | :heavy_check_mark:
JSON types           | :negative_squared_cross_mark: [#issue-56296923](https://github.com/microsoft/TypeScript/issues/1897#issue-56296923) | :heavy_check_mark:
Regex types          | :negative_squared_cross_mark: [#issue-128264906](https://github.com/Microsoft/TypeScript/issues/6579#issue-128264906) | :heavy_check_mark:
Option types         | :negative_squared_cross_mark:        | :heavy_check_mark:
Operator overloading | :negative_squared_cross_mark:        | :heavy_check_mark:
Custom operators     | :negative_squared_cross_mark:        | :heavy_check_mark:
Run-time checks      | :negative_squared_cross_mark:        | :heavy_check_mark:
Side effects tracking | :negative_squared_cross_mark:       | :heavy_check_mark:
Enum types           | :heavy_check_mark:                   | :heavy_check_mark:
Immutability         | Limited, `readonly` keyword          | :heavy_check_mark:
Function arguments immutability | Mutable                   | Immutable
Full DOM API         | :heavy_check_mark:                   | :heavy_check_mark:
`console.log()` anywhere | :question: Compiler complains | :heavy_check_mark:
`console.assert()` anywhere | :question: Compiler complains | :heavy_check_mark:
NodeJS integration   | :heavy_check_mark:                   | :heavy_check_mark:
Generics             | :heavy_check_mark:                   | :heavy_check_mark:
Type inference       | :heavy_check_mark:                   | :heavy_check_mark: 
Closures             | :heavy_check_mark:                   | :heavy_check_mark:
Object-oriented      | :heavy_check_mark:                   | :heavy_check_mark:
Methods              | :heavy_check_mark:                   | :heavy_check_mark:
Exceptions           | :heavy_check_mark:                   | :heavy_check_mark:
Anonymous functions  | :heavy_check_mark:                   | :heavy_check_mark: 
Arrow functions      | :heavy_check_mark:                   | :heavy_check_mark:
Array comprehensions  | :heavy_check_mark:                  | :heavy_check_mark:
Formatted string literals | :heavy_check_mark:              | :heavy_check_mark: 
FFI                  | :heavy_check_mark: JS only           | :heavy_check_mark: C/C++/JS
Async                | :heavy_check_mark:                   | :heavy_check_mark:
Regex                | :heavy_check_mark:                   | :heavy_check_mark:
Self-documentation comments | :heavy_check_mark:            | :heavy_check_mark: 
Package publishing   | :heavy_check_mark:                   | :heavy_check_mark: 
Package manager      | :heavy_check_mark:                   | :heavy_check_mark: 
Code auto formatter   | :heavy_check_mark: via NPM           | :heavy_check_mark: Nimpretty
File extensions      | .ts, .tsx                            | .nim, .nims


# Variables

Creating a new variable uses `var`, `let` or `const`.
Nim has immutability and compile-time function execution.
You can assign functions to variables.
`const` is different from TypeScript by being truly immutable.

| Feature             | `const`                | `let`                  | `var`                  |
|---------------------|------------------------|------------------------|------------------------|
| Run-Time            | NO                     | :heavy_check_mark: YES | :heavy_check_mark: YES |
| Compile-Time        | :heavy_check_mark: YES | NO                     | NO                     |
| Immutable           | :heavy_check_mark: YES | :heavy_check_mark: YES | NO                     |
| AutoInitialized     | :heavy_check_mark: YES | :heavy_check_mark: YES | :heavy_check_mark: YES |
| Reassignable        | NO                     | NO                     | :heavy_check_mark: YES |
| Requires Assignment | :heavy_check_mark: YES | :heavy_check_mark: YES | NO                     |
| Can be Global       | :heavy_check_mark: YES | :heavy_check_mark: YES | :heavy_check_mark: YES |

If you are just starting from scratch, you can use `var` while learning, it will not produce an error for doing so, until you learn more.


# Ternary operators

```javascript
conditional ? "result0" : "result1"
```
:arrow_up: TypeScript :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
if conditional: "result0" else: "result1"
```

You probably notice that the *Ternary Operator* is just an `if..else` inline.


# Anonymous functions

```typescript
var myfunc = (argument1: number, argument2: number) => {
    return argument1 + argument2
};

console.log( myfunc(1, 2) )
```
:arrow_up: TypeScript :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
var myfunc = ( proc (argument1, argument2: int): int = argument1 + argument2 )

echo myfunc(1, 2)
```

In Nim an [anonymous function](https://nim-lang.org/docs/manual.html#procedures-anonymous-procs) is a function without a name and surrounded by brackets.


# This

`this` in Nim does not have a fixed or hard coded naming,
so you may see some code using `self` instead.
Nim only cares about it being the first argument.
`this` or `self` is immutable by default.

```nim
type Cat = object

proc purr(this: Cat) = echo "Purr Purr"         # using 'this'
proc dance(self: Cat) = echo "Tappity Tappity"  # using 'self'

let garfield = Cat()

garfield.purr()   # Purr Purr
garfield.dance()  # Tappity Tappity

# yep, this/self is the instance
proc himself(self: Cat): Cat = return self
echo garfield == garfield.himself()  # true
```


# Arrow functions

Nim has [arrow functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions), they are [syntactic sugar](https://en.wikipedia.org/wiki/Syntactic_sugar) for normal functions.
Using arrow functions requires to `import sugar`.

Let's convert the above cat example to use arrow functions:

```nim
import sugar

type Cat = object

let purr = (this: Cat) => echo "Purr Purr"         # using `this`
let dance = (self: Cat) => echo "Tappity Tappity"  # using `self`

# The call syntax is identical
```

If you do not need to pass any arguments, don't:

```nim
import sugar

let purr = () => echo "Purr Purr"  # No arguments

purr()  # Purr Purr
```

You can use pragmas on your arrow functions:

```nim
let functionName = () {.inline.} => 42
let another_name = () {.inline.} => 42
```

(*See also [inline pragma](https://nim-lang.org/docs/manual.html#inline_1)*)

You can use function names *and* pragmas on your arrow functions:

```nim
function_name(argument0, argument1: int) {.noSideEffect.} => argument0 + argument1
let variab = (argument0, argument1: int) {.noSideEffect.} => argument0 + argument1
```
(*See also [noSideEffect pragma](https://nim-lang.org/docs/manual.html#pragmas-nosideeffect-pragma)*)


# Compile-time function execution

Nim has compile-time function execution that allows you to run *backend-like* code at compile-time and use it on frontend at run-time.
Compile-time [FFI](https://en.wikipedia.org/wiki/Foreign_function_interface) is also possible. Most code that works at compile-time and NimScript also tends to work for frontend.


# Server-side rendering

## With SCFs

Nim [Source Code Filters](https://nim-lang.github.io/Nim/filters.html) (SCF)
are a standard library templating mechanism to do server-side rendering of templates.

SCFs have the file extension `*.nimf` and start with the [shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)) `#?stdtmpl`. <!-- Why is both necessary? --> Inside, the logic is normal Nim code, but with the prefix `#`, while the template is written as-is (no `#`).

SCFs are usually functions that return a string. Those functions can use normal string operations and formatting. They get compiled into normal Nim code, providing excellent performance.

<div><em>serverside.nimf</em></div>

```nim
#?stdtmpl
#func generateXML(name, age: string): string =
<xml>
    <name>$name</name>
    <age>$age</age>
</xml>
```

<div><em>serverside_includer.nim</em></div>

```nim
include "serverside.nimf"

echo generateXML("Nim", "16 (in 2021)")

# prints:
# <xml>
#     <name>Nim</name>
#     <age>16 (in 2021)</age>
# </xml>
```

## With Karax

The [Karax framework](https://github.com/pragmagic/karax) also does server-side rendering (install with `nimble install karax`):

<div><em>karax_helloworld_serverside.nim</em></div>

```nim
import karax/[karaxdsl,vdom]

writeFile "app.html", $(block: buildHtml(tdiv):
  h1: text"Hello World"
  p: text"Compile:  nim r file.nim ")
```

<div><em>karax_helloworld_serverside_<a href="https://bulma.io/">bulma</a>.nim</em></div>

```nim
include prelude
import karax / [karaxdsl, vdom]

writeFile "example.html", $(block: buildHtml(tdiv):

  link(href="https://cdn.jsdelivr.net/npm/bulma@0.9.1/css/bulma.min.css", rel="stylesheet")

  section(class="section"):
    tdiv(class="container"):
      h1(class="title"):
        text"Welcome"

      button(class="button is-success"): text"Example"

      ol(class="ol"):
        li: text"Item 0"
        li: text"Item 1"

      code(class="code"): text"""echo "Hello World" """
)
```

# Client-Side Rendering

Karax can also do client-side rendering, it includes a local dev server among other really cool things.

You can compile and run this example in web browser using Karax `karun` tool.

<div><em>karax_helloworld_clientside.nim</em></div>

```nim
include karax/prelude
setRenderer func: auto = buildHtml(h1): text"Hello World"
```

![Karax Clien Side Render](https://raw.githubusercontent.com/juancarlospaco/nim-presentation-slides/master/karax.png)

<!-- Todo: transform to code -->

# Svelte

[nclearseam](https://mildred.github.io/nclearseam) is a Nim frontend inspired by [Svelte](https://svelte.dev/).


# Parcel

[parcel-plugin-nim](https://github.com/nepeckman/parcel-plugin-nim#parcel-plugin-nim) is a Nim module for [Parcel](https://parceljs.org/) support.


# CommonJS

[jsExport.nim](https://github.com/nepeckman/jsExport.nim#jsexportnim) is a Nim module for [CommonJS](https://en.wikipedia.org/wiki/CommonJS) support.


# WebGL GUI

[nimx](https://github.com/yglukhov/nimx#nimx--) is a cross-platform GUI framework with [WebGL](https://get.webgl.org/) target, compiles your GUI to WebGL.


# Electron

You can run Nim inside [Electron](https://www.electronjs.org/).


# Webview

You can also use a cross-platform tiny (1 `.h` file) and fast (C code) [webview](https://github.com/webview/webview):
- [WebGui](https://github.com/juancarlospaco/webgui#buit-in-dark-mode)
- [Webview for nim](https://github.com/oskca/webview#webview-for-nim)

[WIISH](https://github.com/iffy/wiish#features) also provides a similar cross-platform WebView, with other targets too.


# React 

[React.nim](https://github.com/andreaferretti/react.nim#reactnim) provides ReactJS bindings for Nim.


# More GUI frameworks

If it is not mandatory to be a JavaScript-only GUI, 
and you just need a GUI that works on Windows/Linux/Mac,
then you have even more alternatives to try:
- [nimx](https://github.com/yglukhov/nimx#nimx--)
- [NimQL](https://github.com/filcuc/nimqml#nimqml)
- [uibuilder.nim](https://github.com/ba0f3/uibuilder.nim#uibuildernim)
- [wNim](https://github.com/khchen/wNim#wnim)
- [NiGui](https://github.com/trustable-code/NiGui#nigui)
- [illwill](https://github.com/johnnovak/illwill#main-features)
- [gintro](https://github.com/stefansalewski/gintro)
- [UI](https://github.com/nim-lang/ui#ui)
- [nimgui](https://github.com/zacharycarter/nimgui#nimgui)


# WebAssembly

You can compile your Nim code to [WebAssembly](https://webassembly.org/) using:

- [Clang WASM target](https://clang.llvm.org) OR 
[Emscripten](https://emscripten.org) OR 
[NLVM](https://github.com/arnetheduck/nlvm#introduction).

More about compiling your project to WebAssembly:

- [NimES](https://github.com/def-/nimes#nimes-nes-emulator-in-nim-)
- [nlvm](https://github.com/arnetheduck/nlvm#introduction)
- [Nim WebAssembly Example](https://github.com/2vg/nim-wasm-example)
- [wasmrt](https://github.com/yglukhov/nimwasmrt#wasmrt-)


# Build modes

When your code is ready for production you can create a release build by adding the compile commands ` -d:release` and `-d:danger`.

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


# Minification

Nim does *not* minify the compiled JavaScript by default.

Nim typically compiles to very small file sizes when it builds for release. 
Thanks to [dead code elimination](https://en.wikipedia.org/wiki/Dead_code_elimination) only the used symbols get compiled, others are not present in the release build. E.g. if you import a module but do not use it, it will not exist in the release build (and a hint in the terminal will notify you about the unused import).

Nim uses spaces as indentation.
Basically you are good to go with the JavaScript file that Nim compiles.

Alternatively you can use any other minifier software to do that kind of post-processing of JavaScript.

<!-- How to do this? -->


# Obfuscation

Nim does *not* obfuscate the compiled JavaScript by default.

If you want to obfuscate the compiled JavaScript, you can control the name mangling, 
among other more useful features using `{.exportc.}` pragma, to use the mangling as obfuscator.

```nim
var variable {.exportc: "lkfnjmgkw3du4905r3q2ep8n4urfp34w2efltgvepotik132qm0".} = false
proc funct() {.exportc: "kl34jgo9liw35e4atr8i30q2rk1fipkpfrsdofir93o2qujfoks".} = echo 42
```

Compiles to:

```javascript
var lkfnjmgkw3du4905r3q2ep8n4urfp34w2efltgvepotik132qm0 = false;

function kl34jgo9liw35e4atr8i30q2rk1fipkpfrsdofir93o2qujfoks() {
  rawEcho("42");
}
```

You use the human friendly names `variable` and `funct`, while the code compiles to the obfuscated names.

Nim will not lose track of the names, you can generate the obfuscated names with any random algo of your own.

Alternatively you can use any other obfuscator software to do that kind of post-processing of JavaScript.

<!-- How to do this? (Not that i care about doing such a mean thing) -->


# JavaScript interoperability

Nim can directly interoperate with JavaScript. Here is how you can create your own libs.

There is no additional performance cost, the compiler will just emit the code you want.

As minimal as possible example, not too useful, but explains it as simple as possible:

```nim
func log(arg, arg2: SomeNumber) {.importjs: """console.log(#, #)""".}
```

- `#` is replaced by arguments by index, starting at index 0, if any.
- `@` is replaced by all remaining arguments, if any, separated by comma.
- `$$` to escape a single `$` on string or Regex.
- `$1` is replaced by the current function name.
- Argument types and return types are Nim types, from std lib or your own custom.
- `importcpp` is sometimes used as `importjs`.
- You can use `openArray` *as return type* on functions, it will return `array` instead of `seq`.
- Print to console using vanilla JavaScript `console.log()` and similar.
- [Ensure that DOM is ready](https://developer.mozilla.org/en-US/docs/Web/API/Document/readyState#Examples) using vanilla JavaScript `(function(){  ...  })();`.
- [Enforce Strict Mode](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode) using vanilla JavaScript `"use strict";`.
- [ImportJs pragma](https://nim-lang.org/docs/manual.html#implementation-specific-pragmas-importjs-pragma)
- If the function has no arguments, then `@` generates nothing (empty).
- If the function has no arguments, then `#` produces an error.
- Note that with `@` commas are automatically inserted, with `#` you must add the commas.
- You can use multi-line strings for the patterns.
- You can use `strformat` for the patterns, but you must import `strformat`.

Let's compile this tiny example to JavaScript target:

<div><em>lognumbers.nim</em></div>

```nim
func log(arg, arg2: SomeNumber) {.importjs: """console.log(#, #)""".}

log(42, 9)
```

<div><em>run in console</em></div>

```
nim js -d:danger lognumbers.nim
```

<div><em>generates lognumbers.js</em></div>

```javascript
console.log(42, 9);
```

<!--

Actually generates:

/* Generated by the Nim Compiler v1.4.4 */
var framePtr = null;
var excHandler = 0;
var lastJSError = null;
if (!Math.trunc) {
  Math.trunc = function(v) {
    v = +v;
    if (!isFinite(v)) return v;
    return (v - v % 1) || (v < 0 ? -0 : v === 0 ? v : 0);
  };
}

console.log(42, 9);

-->


If you need to use *named* arguments you can use the `{.emit.}` pragma:

```nim
func functionName(namedArgument: int) = {.emit: """console.log( `namedArgument`);""".}
```

- ``` `namedArgument` ``` is replaced by arguments *by name*.
- Argument types and return types are Nim types, from std lib or your own custom.
- Print to console using `console.log()` and similar.
- You can use `openArray` *as return type* on functions, it will return `array` instead of `seq`.
- [Ensure that DOM is ready](https://developer.mozilla.org/en-US/docs/Web/API/Document/readyState#Examples) using vanilla JavaScript `(function(){  ...  })();`.
- You can use `"use strict"` if you want, but it may not have effect.
- The rest is similar to `importjs`, as explained above.
- https://nim-lang.org/docs/manual.html#implementation-specific-pragmas-emit-pragma

Let's compile this tiny example to JavaScript target:

<div><em>lognamed.nim</em></div>

```nim
func log(mynum: int) = {.emit: """console.log(`mynum`);""".}

log(42)
```

<div><em>lognamed.js</em></div>

```javascript
function log(mynum) {
  console.log(mynum);
}

log(42);
```

<!--

Actually generates:

/* Generated by the Nim Compiler v1.4.4 */
var framePtr = null;
var excHandler = 0;
var lastJSError = null;
if (!Math.trunc) {
  Math.trunc = function(v) {
    v = +v;
    if (!isFinite(v)) return v;
    return (v - v % 1) || (v < 0 ? -0 : v === 0 ? v : 0);
  };
}

function log_1872002(mynum_1872004) {
    console.log(mynum_1872004);

  
}
log_1872002(42);

-->


More Examples:

```nim
func log(foo, bar, baz: SomeNumber) = {.emit:
"""
console.log('foo = ' + `foo`, 'bar = ' + `bar`, 'baz = ' + `baz`);
"""
.}

func encapsulated_log(foo, bar, baz: SomeNumber | string) {.importjs:
"""
(function () {
    "use strict";
    console.log('foo = ' + #, 'bar = ' + #, 'baz = ' + #);
})()
"""
.}

log(42, 19, 0)
encapsulated_log(42, "hi", 19)

```

<!-- i noticed that this does not compile if i call it with floats, despite using `SomeNumber` -->

# Useful pragmas for interoperability

- [`{.importjs.}` import JavaScript.](https://nim-lang.github.io/Nim/manual.html#implementation-specific-pragmas-importjs-pragma)
- [`{.compiletime.}` Force code to run at compile-time.](https://nim-lang.github.io/Nim/manual.html#pragmas-compiletime-pragma)
- [`{.exportc.}` Escape Name Mangling (for Debug, Obfuscation, etc).](https://nim-lang.github.io/Nim/manual.html#foreign-function-interface-exportc-pragma)
- [`{.emit.}` Emit code directly with passed arguments.](https://nim-lang.github.io/Nim/manual.html#implementation-specific-pragmas-emit-pragma)
- [`{.varargs.}` Force a function to accept several arguments.](https://nim-lang.github.io/Nim/manual.html#foreign-function-interface-varargs-pragma)
- [`{.hint.}` Human-friendly colored messages at compile-time that generates no code.](https://nim-lang.github.io/Nim/manual.html#pragmas-hint-pragma)
- [`{.warning.}` Human-friendly colored messages at compile-time that generates no code.](https://nim-lang.github.io/Nim/manual.html#pragmas-warning-pragma)
- [`{.codegendecl.}` Emit code directly on code generator.](https://nim-lang.github.io/Nim/manual.html#implementation-specific-pragmas-codegendecl-pragma)
- [`{.noinit.}` Escape implicit variable auto-initialization.](https://nim-lang.github.io/Nim/manual.html#statements-and-expressions-var-statement)
- [`{.discardable.}` Allow to discard unused return values (for debug, quick prototyping, etc).](https://nim-lang.github.io/Nim/manual.html#statements-and-expressions-discard-statement)
- [`{.noreturn.}` Force a function to never return](https://nim-lang.github.io/Nim/manual.html#pragmas-noreturn-pragma)
- [`{.asmnostackframe.}` Force a function to not have the `result = ` auto-injected, useful with `{.emit.}`](https://nim-lang.github.io/Nim/manual.html#pragmas-asmnostackframe-pragma)
- [`{.injectStmt.}` Inject code before every other statement in the current module.](https://nim-lang.github.io/Nim/manual.html#implementation-specific-pragmas-injectstmt-pragma)
- [Pragmas are just `macro`, so you can create your own.](https://nim-lang.github.io/Nim/manual.html#userminusdefined-pragmas-macro-pragmas)

**See also:**

- [`static:` / `static()` Force a block of code to run at compile-time.](https://nim-lang.github.io/Nim/manual.html#statements-and-expressions-static-statementslashexpression)
- [`when` Compile-time `if`](https://nim-lang.github.io/Nim/manual.html#statements-and-expressions-when-expression)
- [`jsre` module for an example of actual code.](https://github.com/nim-lang/Nim/blob/devel/lib/js/jsre.nim)
- [`jsconsole` module for an example of actual code.](https://github.com/nim-lang/Nim/blob/devel/lib/js/jsconsole.nim)


# Interoperability template

- Nim "code template" pseudocode that you can *Edit* to create your own JavaScript libs:

```nim

func functionName(argument: SomeNumber | string | bool): SomeNumber {.importjs: """
(function () {
  "use strict";

  console.log("CODE HERE");
  console.log(#);
  return 42;

})(); """, exportc: "functionName".}  ## Documentation Comment.


func functionName2(namedArgument: SomeNumber | string | bool): SomeNumber = {.emit: """

  console.log("CODE HERE");
  console.log( `namedArgument` );
  return 42;

""", exportc: "functionName2".}  ## Documentation Comment.


```


# HTML/CSS WYSYWIG editor for Nim

This is a community maintained open source project thats a HTML/CSS WYSYWIG Editor with Nim Support without JavaScript required,
for creating [Source Code Filter starter templates](https://nim-lang.org/docs/filters.html) (similar to Pug templating, etc),
so you dont have to start by hand with an empty blank file, not meant to produce a "finished" page but a template to edit.
Ideas to make it more useful welcome. Pull Requests welcome.

- Drag&drop your components in the page and press the "View Code" green button.
- Documentation of each component clicking on the "?" link.
- Ready-made full-page templates on the "Templates" category.

## Spectre CSS

Uses [Spectre CSS because it wont need third-party JavaScript libraries, is 9 Kilobytes, pure CSS, JavaScript framework agnostic.](https://picturepan2.github.io/spectre/experimentals/viewer-360.html#viewer-360) 

![](https://raw.githubusercontent.com/juancarlospaco/grapespectre/master/screenshot2.png)

- https://juancarlospaco.github.io/grapespectre

## Bulma CSS

Uses [Bulma CSS because it wont need third-party JavaScript libraries, pure CSS, JavaScript framework agnostic.](https://bulma.io/documentation) 

![](https://raw.githubusercontent.com/juancarlospaco/grabulma/master/screenshot.png)

- https://juancarlospaco.github.io/grabulma


# NodeJS compatibility

- [NodeJS Standard Library for Nim](https://github.com/juancarlospaco/nodejs#nodejs-standard-library-for-nim)


# More

To not duplicate all documentation here, please continue reading:

- https://github.com/nim-lang/Nim/wiki/Nim-for-Python-Programmers#table-of-contents

It is Python-oriented, but the same concepts also work for Frontend too!.


[ :arrow_up: :arrow_up: :arrow_up: :arrow_up: ](#Table-Of-Contents "Go to top")
