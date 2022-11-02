import strformat, strutils
import nimib
import nimoji

nbInit

nbText:"""

<details>
  <summary>DISCLAIMER!</summary>

This page is unofficial and incomplete. Contributions are appreciated.

This guide assumes a good understanding of the Java language and JVM semantics. There might still be something for you if you don't use Java but use another JVM language like Scala, Kotlin, Groovy etc.

General learning resources: https://nim-lang.org/learn.html

</details>


## Comparison

### General

Feature | Java | Nim
---|---|---
Compilation | JVM bytecode | C/C++/Obj-C/JS source
Paradigms | class-based, object-oriented | procedural, compile-time
Metaprogramming | reflection, annotations | macros, templates, generics
Memory management | Garbage collected | [Multiple strategies: garbage collected, manual, automatic](https://nim-lang.org/docs/gc.html), [traced and untraced pointers](https://nim-lang.org/docs/manual.html#types-reference-and-pointer-types)

### Syntax

Feature | Java | Nim
---|---|---
Comments | `// single line`, `/* multiline */` (nestable) | `# single line`, `#[multiline]#` (nestable)
Blocks | Uses curly braces | Uses indents like Python, another option is [statement list expression](https://nim-lang.org/docs/manual.html#statements-and-expressions-statement-list-expression)
Operators | Predefined set of symbols, `1+-1` easily parsed as `1 + (-1)` | Custom operators supported for a limited set of characters, [first character based precedence](https://nim-lang.org/docs/manual.html#syntax-precedence), strong spaces when using [command call syntax](https://nim-lang.org/docs/manual.html#procedures-command-invocation-syntax) and prefix operators
Operator overloading | None | Operators are user defined except `=` and `.`, can overload: subscripts, curly subscripts `a{b}`, experimental [call and dot operators](https://nim-lang.org/docs/manual_experimental.html#special-operators)
If/else statement | `if (a) { foo(); } else { bar(); }` | `if a: foo() else: bar()`
If/else expression | `a ? b : c` | `if a: b else: c`
Switch/case expression/statement | `switch (a) { case b -> c }` | `case a`<br/>`of b: c`
Return statements | `return x;` | [Multiple options](https://nim-lang.org/docs/manual.html#statements-and-expressions-return-statement): implicit return at the end of a proc, result variable, explicit return statement
Try/catch/finally | `try { foo(); } catch (Exception ex) { bar(); } finally { baz(); }` | `try: foo() except Exception as ex: bar() finally: bar()` - can omit `as ex` or `Exception as ex`
Throw exception | `throw ex;` | `raise ex`
Procedure definition | `static T foo(U a, S b) {}` in class body | `proc foo(a: U, b: S): T = discard` in module
Method definition | `T foo(U a, S b) {}` in class body | `method foo(obj: Obj, a: U, b: S): T = discard` in module
Calling procedure | `ClassName.foo(a, b)` | `foo(a, b)`, `foo a, b`, `a.foo(b)`, `a.foo b`
Calling method | `obj.foo(a, b)` | `foo(obj, a, b)`, `foo obj, a, b`, `obj.foo(a, b)`, `obj.foo a, b`
Method/procedure declarations are order-agnostic | Yes | No, can use forward declarations, experimental [code reordering](https://nim-lang.org/docs/manual.html#scope-rules-code-reordering)
String literals | `"str"`, `"""str"""` as of Java 13 | `"str"`, `"""str"""`, `foo"str"` ([raw string literals](https://nim-lang.org/docs/manual.html#lexical-analysis-raw-string-literals))
Collection literals | `new int[] {1, 2, 3}` | array: `[1, 2, 3]`, seq: `@[1, 2, 3]`, bitset: `{1, 2, 3}`, tuple: `(1, 2, 3)`, [table constructor](https://nim-lang.org/docs/manual.html#statements-and-expressions-table-constructor)
Introduce new lexical scope | `{}`, `label: {}`, can't break (?) | `block:`, `block label:`, can break with `break label`
Increment | `i++` | Uses `inc` proc, `inc i`

### Language semantics

Feature | Java | Nim
---|---|---
Namespacing & importing | `public`/`private`/package-scope modifiers, can import: single classes or all classes from a package, single or all static members from a class | `export`/`*` postfix based, can import: exported symbols from modules with `import mod`, only import specific symbols from a module with `from mod import foo, bar`, force all symbols from a module to be qualified with `from mod import nil`, don't import specific symbols from a module with `import mod except foo, bar`, can alias imports for both symbols and modules with `import mod as m`. `include file` is also possible, embeds source files inside modules
FFI with C | [JNI](https://docs.oracle.com/javase/8/docs/technotes/guides/jni/) | Compiles to C, only needs some pragmas
Immutability | `final`, getter and setter encapsulation | `let`, getter and setter encapsulation, enforced by `let` for value types
Discarding method return values | `foo();` is a valid statement if `foo()` returns a value | `foo()` is not a valid statement if `foo()` returns a value, you have to use the [`discard` statement](https://nim-lang.org/docs/manual.html#statements-and-expressions-discard-statement).
Type inference | `var` type for locals, diamond operator, [lambda inference](https://docs.oracle.com/javase/tutorial/java/javaOO/lambdaexpressions.html#target-typing) | `let`/`const`/`var` don't need type annotation if initialized, routine generics can be inferred from arguments, `auto` return type. No inference for object constructor generics or anonymous procs (though generic lambdas are automatically specialized). Empty collections (`@[]`, `[]`, `{}`) need type annotation
Typeclasses | Interfaces | Experimental [concepts](https://nim-lang.org/docs/manual_experimental.html#concepts), intersection/union types, [`openarray`](https://nim-lang.org/docs/manual.html#types-open-arrays), [`range`](https://nim-lang.org/docs/manual.html#types-subrange-types)
Multiple inheritance | Interfaces only | No
Method polymorphism | Instance methods are polymorphic on the instance only | Multimethods are polymorphic on each possible argument
Generics | Erased and only involves classes (subject to change with [Project Valhalla](https://openjdk.java.net/projects/valhalla/), uses angle brackets like C++ | Similar to C++ templates, uses square brackets like Scala
Variance in generics | `? extends T`/`? super T`, generics invariant by default | `out T`/`in T`, [experimental](https://nim-lang.org/docs/manual_experimental.html#covariance), generics invariant by default
Type aliases | None | `type Foo = Bar`
Dependent types | No | Yes
Named, order agnostic parameters | No | Yes
Default parameters | No | Yes
Varargs | Yes | Yes, can also use a [transformation proc](https://nim-lang.org/docs/manual.html#types-varargs)
Constructor overloading | Yes, `public Obj() {}` | No, convention is to use `newObj()` for reference types and `initObj()` for value types
Pass by reference | No | `x: var T`
Closures/function references | Classes that extend "functional interfaces" (interfaces that act as function signatures) | Pointers in conjunction with proc types that have calling convention information
Destructors | `finalize()`, discouraged, try with resources/Closable is preferred | `=destroy`, `withFoo` templates/`defer: ` can be used to emulate Closable behaviour
Exceptions | `Exception` and `Error` implement `Throwable`, `Error` isn't supposed to be caught | `CatchableError` and `Defect` extend `Exception`, `Defect` isn't supposed to be caught
Exception tracking | Forced explicit checked exceptions with `throws` | Inferred or explicit with `raises` pragma
Effect tracking | None | Inferred or explicit with `tags` pragma
Null checking | Boolean check is `x == null`. Dereferencing null is NullPointerException, no compile-time mechanisms except Java EE `@NotNull`, other JVM languages have better null semantics and nullable types, [`Optional<T>`](https://docs.oracle.com/javase/8/docs/api/java/util/Optional.html) | Boolean check is `isNil(x)`. Dereferencing nil is a segmentation fault with `--nilchecks:off`, [experimental `not nil` annotation](https://nim-lang.org/docs/manual.html#types-not-nil-annotation), [`Option[T]` in options module](https://nim-lang.org/docs/options.html)
Bounds checking | Yes, `IndexOutOfBoundsException` | Yes, `IndexError`, can be turned off
Overflow checking | No | Yes, `OverflowError`, can be turned off

### Data types

Feature | JVM | Nim
---|---|---
Number types | Signed integers of 8, 16, 32 and 64 bits (8 and 16 bits are actually 32 bits in bytecode), floats of 32 and 64 bits | Unsigned and signed integers with bitsize in type name e.g. `int32`, `int` has platform-dependent size, `float` is always float64, compatibility types like `cint` available and use C defined types.
Boolean type | `boolean`, one of `true` or `false`, 32 bit integer | `bool`, enum of `true` or `false`, 8 bit integer
Char type | `char`, 32-bit integer, treated as unsigned 16-bit integer | `char`, unsigned 8 bit integer, `cchar` and `cuchar`, `cschar` types for compatibilty with C 
Enums | Implemented as ordered singleton instances of a class | 8 or 16 bit enumerations like C, can be used as array indices
Strings | Immutable wrapper around `char[]`. Concatenated with `+` | Similar to `seq[char]`, mutable and growable, compatible with `openarray[char]`. Concatenated with `&`, but you can do `var x = "abc"; x.add("def")`. `ref string` is essentially `StringBuilder`
Collection types | Variable-length arrays in the core language, `List`, `Set`, `Map` interfaces in the standard library | `array[I, T]` where I is a compile time integer or range type, [`UncheckedArray[T]`](https://nim-lang.org/docs/manual.html#types-unchecked-arrays), `seq[T]`, [Pascal-style bitset type `set[T]`](https://nim-lang.org/docs/manual.html#types-set-type), slice type with `a..b`, tuples and named tuples, standard library: [tables](https://nim-lang.org/docs/tables.html), [sets](https://nim-lang.org/docs/sets.html) and [more](https://nim-lang.org/docs/lib.html#pure-libraries-collections)
Structured types | Classes, reference type with extra data | Objects, nominal value type with optional inheritance, have no extra data without inheritance, named tuples have no inheritance but are structurally typed instead of nominal, any type can be made a reference or pointer (traced or untraced pointer)
Tagged unions | No, inheritance is used instead, enums can implement abstract methods/interfaces, Scala/Kotlin use sealed types | [Object variants](https://nim-lang.org/docs/manual.html#types-object-variants) like Pascal and Ada
Pointer access | Incubating [foreign memory access API](https://openjdk.java.net/jeps/370) | Yes, dereference operator is `foo[]`, pointer arithmetic needs casting to `uint`

### Documentation, libraries & popular tooling

Feature | Java | Nim
---|---|---
IDE support | Eclipse, Android Studio, IntelliJ IDEA, almost universally supported | Most of the community uses VS Code, see [editor support](https://github.com/nim-lang/Nim/wiki/Editor-Support)
Package manager / build tool | Ant + Ivy, Maven, Gradle, sbt (Scala), Leiningen (Clojure) | Nimble
Library format | `.jar` binaries | Source code, unused code is not included in binary (dead code elimination), can also compile to a shared library
Style guide | Last one by Oracle from 1999, [Google style guide](https://google.github.io/styleguide/javaguide.html), [Twitter style guide](https://github.com/twitter-archive/commons/blob/master/src/java/com/twitter/common/styleguide.md) | [NEP-1](https://nim-lang.org/docs/nep1.html)
Doc comments | `/// foo`, `/** line1<newline>  * line2<newline> */`, HTML formatted | `## foo`, `##[lines here don't matter]##`, RST formatted
Doc generator | `javadoc` | `nim doc`
Unit testing | JUnit, Spock | Standard library [unittest module](https://nim-lang.org/docs/unittest.html)"""
nbSave()
