import strformat, strutils
import nimib
import nimoji

nbInit

nbText:"""
## Nim doesn't require call-site annotation for `var` parameters
This is referring to systems like C#'s: `void foo(ref int myInput){...}; foo(ref a);`. Note the ref on the `foo` call. If this was Nim, it'd be impossible to tell from the call-site that `foo` has the potential to modify `a`.

Possibly. The problem here is that of what mental metaphor is being used. In many languages, heap allocation through pointers is the only method of having objects, and passing them to a function gives the freedom to modify them without any callsite annotations. In Nim, things can be allocated on the stack, and those things need to be treated in the same way as things on the heap.

``` nimrod
proc foo(input: var T) = ...
proc foo(input: ref T) = ...
let a: ref T = ...  # `let` says the value of the pointer is immutable
foo(a)  # valid, this is Java-style
var b: T = ...
foo(b)  # also valid
```

Note that the difference between what happens in Java and what Nim does is simply a matter of efficiency: Nim does not require our `T` to be allocated on the heap, and it certainly allows `b` to be declared with `let`, which will force an compile-time error to be thrown.

## Sum types are weird
In OCaml, sum types are denoted like this:
``` ocaml
 type OptionalInt =
  | Value of int
  | Missing
```
while in Nim they are written like 
``` nimrod
type
  NodeKind = enum opValue, opAdd, opSub, opMul, opCall
  Node = ref object
     case kind: NodeKind
     of opValue: value: int
     of opAdd, opSub, opMul, opCall: kids: seq[Node]
```

While the OCaml way looks better, the Nim version allows for multiple types to have the same values without repetition. It also has the advantage that multiple variants can concisely be matched upon using sets, eg `node.kind in {opSub, opMul}`.
"""
nbSave()
