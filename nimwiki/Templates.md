## Templates

This page is a draft for brainstorming about Nim templates, before writing a [RFC](https://github.com/nim-lang/RFCs). The goal is to complete the [specification of templates](https://nim-lang.org/docs/manual.html#templates) and eventually complete the implementation in the compiler.

#### Compiler sources
Some sources related to templates...
* Proc and template calls: [semcall.nim](https://github.com/nim-lang/Nim/blob/devel/compiler/semcall.nim)
* Template instantiation: [evaltempl.nim](https://github.com/nim-lang/Nim/blob/devel/compiler/evaltempl.nim)
* Semantic analysis of hygienic templates: [semtempl.nim](https://github.com/nim-lang/Nim/blob/devel/compiler/semtempl.nim)
* Semantic checking of type declarations: [semtypes.nim](https://github.com/nim-lang/Nim/blob/devel/compiler/semtypes.nim)
* Generic instantiation: [semgnrc.nim](https://github.com/nim-lang/Nim/blob/devel/compiler/semgnrc.nim)
* Semantic analysis of expressions: [semexprs.nim](https://github.com/nim-lang/Nim/blob/devel/compiler/semexprs.nim)
* Semantic analysis of statements: [semstmts.nim](https://github.com/nim-lang/Nim/blob/devel/compiler/semstmts.nim)

### How does it work?
Templates in Nim work by replacing code: the template call is substituted by the template body in the call location.
```nim
template foo =
  echo "Add the echo line"

proc bar =
  foo
  foo

bar()
```
When the compiler finds a call to `foo`, instead of inserting a procedure call like with a traditional proc, it replace the call with the body of the template. In our small example, `bar` proc is identical as if the programmer had written it like:
```nim
proc bar =
  echo "Add the echo line"
  echo "Add the echo line"
```

### How to select the right template?
Usually, like for proc overloading, the template that will be selected for application will be selected based on its parameters.
```nim
template foo =
  echo "Add the echo line"

template foo(i: int) =
  echo "i = " & $i

proc bar(i: int) =
  foo(i)
  foo

bar 3
```
Now, `bar` is seen by the compiler as if the developer had written:
```nim
proc bar(i: int) =
  echo "i = " & $i
  echo "Add the echo line"
```

### Scope
As a template application is not a call but a source code substitution, no new scope is created by the compiler. More generally, the compiler can't check the validity of the code of a template definition apart from being syntactically correct by the parser. The resulting code will be checked when the template body is applied to instantiation site. As a consequence, the validity of a template body will not be checked by the compiler as long as the template is not used.
```nim
template foo =
  echo 1 + a

proc fizz =
  let a = 3
  foo()

fizz()
```
Variable `a` is not defined nor known in template `foo` but the compiler accepts the template definition as valid as long as it respects Nim syntax.

### Redefinition
Contrarily to procs, templates can be redefined in source code and so the following code is valid and prints `1` and `2`.
```nim
template foo: int =
  1
  
echo foo()
  
template foo: int =
  2
  
echo foo()
```

You can see that it can lead to nasty bugs when you redefine inadvertently a template because of code move. A template definition is known by the compiler by its last definition at the moment it is used.
```nim
template foo: int =
  1
  
template bar: int =
  foo()
  
template foo: int =
  2

echo bar()
```
So the code above prints `1` as only the first definition is known. You can change this behaviour to delay symbol resolution by the compiler with the [`mixin` statement](https://nim-lang.org/docs/manual.html#generics-mixin-statement), but now the compiler raises an error as it sees two `foo` symbols defined!
```nim
template foo: int =
  1
  
template bar: int =
  mixin foo
  foo()
  
template foo: int =
  2

echo bar()
```
```sh
Error: ambiguous call; both in.foo() [declared in /usercode/in.nim(1, 10)] and in.foo() [declared in /usercode/in.nim(8, 10)] match for: ()
```

### Return value
The last instruction of the templates defines its "return" value. The template is not really returning a value as its whole body text is replaced in the call site. It just signifies to the compiler that the last instruction of the whole text replacement is to be of the type given by the return type of the template definition.
```nim
template foo: int =
  1 + a

proc fizz =
  let a = 3
  let i = foo()
  echo "i = ", i

fizz()
```

### Debugging templates
Debugging templates can be more challenging that debugging traditional procedures because the error messages can be located at the template application site but be related to the template definition.
```nim
template foo: int =
  1 + a

proc fizz =
  let a = false
  let i = foo()
  echo "i = ", i

fizz()
```
```
$ nim c -r tmpl
Hint: used config file '.../config/nim.cfg' [Conf]
Hint: used config file '.../config/config.nims' [Conf]
....
.../tmpl.nim(6, 14) Error: type mismatch: got <int literal(1), bool>
but expected one of: 
proc `+`(x, y: float): float
  first type mismatch at position: 2
  required type for y: float
  but expression 'a' is of type: bool
...
proc `+`(x: int8): int8
  first type mismatch at position: 2
  extra argument given
1 other mismatching symbols have been suppressed; compile with --showAllMismatches:on to see them

expression: 1 + a
```

The first debugging rule is *If you don't really read a template, use a proc instead*. You'll face less compiler bugs.

A constant cause of bug in templates is re-using a parameter name as a variable, forgetting that all occurrences of the parameter name are renamed in the template body.

One can sometimes use `expandMacros` to get a view of the template's definition with parameters substituted, particularly in the case of template defining other templates.

### Template hygiene
When a template is applied, its parameters are substituted by the argument values of the instantiation site.
```nim
template foo(a: int) =
  echo "a + i = ", a + i

proc fizz =
  let a = 2
  let i = 3
  foo(i)

fizz()
```
The variable `a` in the proc `fizz` is not the same as the one in the template `foo`. When applying the template, the compiler renames the template arguments before applying them. The previous code is similar to:
```nim
proc fizz =
  let a = 2
  let i = 3
  echo "a + i = ", a`gensym12345 + i

fizz()
```

Taking an example from compiler [semtempl.nim](https://github.com/nim-lang/Nim/blob/devel/compiler/semtempl.nim#L12-L27):
```nim
template `||` (a, b: untyped): untyped =
  let aa = a
  if aa: aa else: b

var
  a, b: bool
echo a || b || a
```
First, using the temporary variable `aa` with the parameter `a` value prevent multiple evaluations of `a`, because `a` value when the template is instantiated will be replicated as-is from the template definition into the code.

Then, when `a || b || a` is evaluated, the `a` here is not the same as the one in the template arguments, and the template argument `a` will need to be renamed with a temporary name to prevent clashes. This will need to be done multiple times as the template is invoked twice. The resulting code will look like:
```nim
var
  a, b: bool
echo (let aa2 = (let aa1 = a; if aa1: aa1 else b); if aa2: aa2 else: a)
```
This renaming of template variables is some sort of hygiene to prevent name clashes and is done automatically by Nim compiler while the programmer must prevent multiple unwanted parameter evaluations.

### Dirty templates
TODO

### Template parameters
As already explained, templates are selected on there name and then checked for their parameters against the type of the arguments on the call site. In case of ambiguity when multiple templates definitions exist with the same name, parameters are used to select the right template definition to apply in a process similar to proc overloading.

This template application overloading works only for functional parameters but does not work for generic parameters (TODO: at least, to my understanding, it should not work when the generic variables are not typed).

```nim
template foo(i: int): string =
  "In foo of int"

template foo(s: string): string =
  "In foo of string"

echo foo(3)
echo foo("Yoo!")
```
will print
```
$ nim c -r tmpl.nim
...
In foo of int
In foo of string
```

Beware that the type of template parameters is only used during signature matching (i.e. the compiler just checks that types can match modulo implicit conversions) but somehow is lost when template is instantiated so for instance `template foo[T](a, b: T)` could be invoked with `a` and `b` being respectively `int` and `int32`. This could be considered a bug (https://github.com/nim-lang/Nim/issues/11794).

### Parameters evaluation
Parameters are not evaluated by templates but are substituted in the source code when the template is applied. The following example
```nim
proc incr(x: var int): int =
  inc x
  result = x

template foo(i: int): int =
  i + i

var a = 1
echo "foo = ", foo(incr a)
echo "a = ", a
```
prints the results
```
foo = 5
a = 3
```
Because `foo` is a template, its application `foo(incr a)` must not be considered as a traditional procedure call (though it looks like one) and its parameter function call has been evaluated twice! Always keep always in mind that templates are text substitution in the source code. This example is rewritten like the following by the Nim compiler:
```nim
proc incr(x: var int): int =
  inc x
  result = x

var a = 1
echo "foo = ", (incr a) + (incr a)
echo "a = ", a
```

This applies to generic parameters too. While in a procedure, a generic parameter instantiated by a type in a call can be considered as defining another instance of the procedure for that type by the compiler, this mechanism does not apply with templates. In a template application, the generic parameter is instantiated like the other parameters and the template definition is recopied in the source code.

### Var parameters and templates
Though it does not make sense to declare template's parameters as `var`, Nim compiler accepts them and the type system checks that types and variability hold.
```nim
template foo(x: var int): int =
  x = x + 1
  x

template foo(x: int): int =
  x + 3
  
var x = 1
echo "foo(x) = ", foo(x), ", foo(1) = ", foo(1)
echo "x = ", x
```
prints the expected result
```
foo(x) = 2, foo(1) = 4
x = 2
```

### When are templates invoked?
Compilation in Nim occurs in multiple passes. At first, the source code is parsed for valid syntax but the types are not checked yet. Then in a second pass, types are checked in what is call semantic analysis. A special type of templates (and macros) can be used to be invoked during the first pass. This allows to process source text that is not valid Nim code, for instance to write a DSL or code rewrite functions.

When a template parameter is declared as `untyped`, its type is not checked by the compiler.

If all parameters of a template are `untyped`, then the template is applied during the first pass of compilation. These are called immediate templates.

You can mix `untyped` and `typed` parameters. In that case, the template is evaluated during the semantic phase.

But when is invoked a template without parameters? If the return type is `untyped`, it makes sure the replacement is done before any semantic or type resolution. If the template has no return type, it is probably applied during the first phase.

### Untyped parameters
`untyped` parameters are useful to capture source code text before semantic analysis, that is text that respects Nim syntax but could be invalid. Templates are too limited in their features to process these type of parameters and macros are more suited to process these parameters. But templates can still use `untyped` parameters, for instance to define block-like keywords.
```nim
TODO TO BE COMPLETED....
```

### Scope again
According to [Nim manual](https://nim-lang.org/docs/manual.html#templates-symbol-binding-in-templates), templates as *hygienic macro* open a new scope but this is not clear. Why is the following code working in that case?
```nim
template declareInScope(x: untyped, t: typedesc) =
  var x: t

declareInScope(a, int)
a = 3
echo "a=", a
```
The [reason](https://nim-lang.org/docs/manual.html#templates-typed-vs-untyped-parameters) is that the `declareInScope` template is `untyped` because `x` argument is `untyped` and is evaluated before type checking.

As `untyped` templates can accept invalid syntax that is replaced in the AST of the code being analysed by the compiler, I don't think we can talk of scope for `untyped` templates with the same meaning as for procs.

### Back on return type
If a template is given no return type and it contains no `untyped` argument, it is considered `typed` of `void` type. Return type of `typed` templates is checked by the compiler.
```nim
template foo: untyped =
  "untyped foo"

template bar =
  "bar"
    
template fizz: string =
  "void fizz"
  
template bu: void =
  echo "boo!"
    
echo foo()
echo bar()
echo fizz()
bu()
```

### Recursion in templates
The compiler expands templates at compile time. When encountering a call, it checks if it's a template (or macro or proc but we're talking about templates here) and if it's the case, it replaces the call by the template body source after renaming parameters. And then it parses again the new source code  to see if another template substitution must be applied. And again and again until no more templates can be applied.
So can we write recursive templates? Based on these explanations, no. The compiler would go into an infinite loop.
```nim
template foo(i: int) =
  echo "i is now = " & $i
  if i > 0:
    foo(i - 1)

proc fizz =
  foo(5)

fizz()
```

```
$ nim c tmpl
Hint: used config file '.../config/nim.cfg' [Conf]
Hint: used config file '.../config.nims' [Conf]
....
.../tmpl.nim(7, 6) template/generic instantiation of `foo` from here
.../tmpl.nim(4, 8) template/generic instantiation of `foo` from here
.../tmpl.nim(3, 8) Error: template instantiation too nested
```

But the compiler evaluates `when` cases at compile-time when expanding template invocation and recursive templates can be evaluated in Nim virtual machine!
```nim
template foo(i: int) =
  echo "i is now = " & $i
  when i > 0:
    foo(i - 1)

proc fizz =
  foo(5)

fizz()
```
prints
```
i is now = 5
i is now = 4
i is now = 3
i is now = 2
i is now = 1
i is now = 0
```
showing that the recursive template has been invoked 6 times.

There's a constant defined to prevent endless recursion in template instantiation: https://github.com/nim-lang/Nim/blob/devel/compiler/evaltempl.nim#L143

### Co-recursion
```nim
import macros

template foo(a: int): int =
  a * bar(a - 1)

template bar(a: int): int =
  when a == 1:
    1
  else:
    foo(a)
  
expandMacros:
  echo foo(5)
```
prints the factorial of 5 calculated at compile time. So templates can be co-recursive too.

### Typed arguments
As explained in [Nim manual](https://nim-lang.org/docs/manual.html#templates-passing-a-code-block-to-a-template), symbols in a template with `typed` arguments must be resolved when the template is instantiated. And this can create strange errors (see example in Manual).

### Templates and variable arguments
Templates accept `varargs[]` arguments but they can't be processed by the templates (i.e, the template can't scan the `varargs` content).

### Templates and generic parameters
Like we already explained, templates are not procedure calls but source text replacement, after selection of the correct instance of template definition based on its name and parameter types. Each parameter is substituted by its expression on the template instantiation site. The same process occurs for template generic parameters. [Generic parameters are considered like functional parameters for template selection](https://github.com/nim-lang/Nim/blob/devel/compiler/semcall.nim#L525-L526) because there is no type instantiation like what occurs with procs. When they are unconstrained by a type, they are considered `untyped`.
```nim
template foo[N](a: N): int =
  len(a)

echo "Length of seq[int] = ", foo(@[1, 2, 3])
echo "Length of seq[string] = ", foo(@["I", "have", "a", "dream"])
echo "Length of string = ", foo("When I was young")
```

### Templates and static parameters
Static parameters are constant expressions known at compile time. Static parameters must be constant expressions when a template is invoked. They can be used in generic parameters as well as functional parameters.

#### BUG:
When both a static and non-static generic parameter template definitions are available, the most constrained one will be selected. The following code
```nim
template foo[N: string]: untyped =
  "foo string"

template foo[N: static string]: untyped =
  "foo static string"

template foo[N]: untyped =
  "foo generic"

echo foo["wellwell"]()
```
does not compile with Nim 1.3.5 but should print `foo static string`.

### Executing code in templates
Can we execute code in template? For instance, would it be possible to have a template that expands to some text code when a condition is defined, and to another text code if not? What about:
```nim
import macros

template foo(x: int): string =
  when x mod 7 == 0:
    "buzzle"
  else:
    $x

expandMacros:
  echo foo(6)
  echo foo(7)
  echo foo(8)
```

This seems to work, as if the `when` branch was executed when the template is expanded and template invocation is substituted by template body, but in fact this execution is done at the compilation phase after all templates invocations. The corresponding code expansion is not
```nim
echo $6
echo "buzzle"
echo $7
```
but
```nim
echo (when 6 mod 7 == 0: "buzzle" else: $6)
echo (when 7 mod 7 == 0: "buzzle" else: $7)
echo (when 8 mod 7 == 0: "buzzle" else: $8)
```
So the answer is *I don't know*. It seems that `when` clauses are executed in Nim VM while expanding templates (look at the recursion examples). So probably `template` + `when` can be used to create *dynamic* templates...

### Lookup for symbols in template
How does a template find symbols in its definition? For [example from Nim Forum](https://forum.nim-lang.org/t/6560),
```nim
proc x[T](i: T) =
  echo "generic x"

template temp(a: int) =
  x(a)

proc x(i: int) =
  echo "specific x"

temp(14)
```
prints `generic x` while
```nim
template temp(a: int) =
  x(a)

proc x[T](i: T) =
  echo "generic x"

proc x(i: int) =
  echo "specific x"

temp(14)
```
prints `specific x`. In one case, the generic proc was selected while the specific proc was in the other case, only by changing the position of the template definition in the source code.

The reason is that if only one proc with the name of the symbol is defined when the template definition is evaluate, as seen by Nim compiler parsing the source, the symbol will be considered to be a closed symbol (`closedSymChoice`) while it is considered as an open symbol (`openSymChoice`). The programmer can control this behaviour and force the template to select the most specific proc, independently of the template position in the source code, by using the `mixin` [keyword](https://nim-lang.org/docs/manual.html#generics-mixin-statement).
```nim
template temp(a: int) =
  mixin x
  x(a)
```

Reversely, to force the template to bind a symbol early, the `bind` [keyword](https://nim-lang.org/docs/manual.html#generics-bind-statement) can be used. But a bind is rarely useful because symbol binding from the definition scope is the default.
```nim
template temp(a: int) =
  bind x
  x(a)
```

### Templates and export
Can proc generated by templates made visible from outside the current module?
```nim
template foo(procName: untyped) =
  proc procName*(x: int): int =
	result = x

foo(bar)

expandMacros:
  foo(fizz)
```

Note that there's a bug (https://github.com/nim-lang/Nim/issues/13828) with Nim 1.2 where visibility is not preserved when the template generates a `template` instead of a `proc`.

### Why do templates accept parameters without types?
Why is the following syntax accepted by the compiler and what does it mean?
```nim
import macros

template foo(procName) =
  proc procName(x: int): int =
    result = x

expandMacros:
  foo(bar)
```

TODO: I suppose no-types parameters are considered `untyped`. While templates without return type are probably considered `void`...
All the following definitions are equivalent from a compilation point of view:
```nim
template foo(procName: untyped): untyped =
  proc procName(x: int): int =
    result = x
```
```nim
template foo(procName: untyped) =
  proc procName(x: int): int =
    result = x
```
```nim
template foo(procName) =
  proc procName(x: int): int =
    result = x
```

### You can't discard a template
Well, at least it makes no consistent sense as a template invocation is not a function call. So even if a template instantiation site looks like a proc call, using `discard` is non-predictable as it depends on the template body definition.
```nim
template foo =
  echo "Biz"
  1
  
discard foo()
```
Does the `discard` applies on both `echo "Biz"` and `1`, or only on `1`?

### Templates and result variable
Why the `result` variable makes no sense with templates... If `result` existed for templates, the following template
```nim
template foo(a: int): int =
  let b = a + 1
  echo b
  b
```
 would be written like
```nim
template foo(a: int): int =
  result = `let b = a + 1; echo b; b`
```
The whole body text of the template would be assigned to the `result` automatic variable. And you can see that the type of `result` (`void` or `untyped`?) does not necessarily match with the return type of the template (`int`).

### Templates on types
Can a template be used in contexts other than proc calls? For instance, can we define a template for a type declaration?
```
template foo: untyped =
  array[4, int]

var a: foo() = [0, 1, 2, 3]
echo "a = ", a
```
correctly prints `[0, 1, 2, 3]`.

Template expansion is not limited to statements context (as if a proc was evaluated) and can't be used in other contexts.

### Defining an iterator in a template
Using a template to define an iterator is not as direct as for a proc. The first way is to use an inline closure iterator with no name:
```nim
type
  Melon = object

template pairs*(m: Melon): tuple[key: int, val: int] =
  let iter = iterator(melon: Melon): tuple[key: int, val: int] =
    for i in a .. 10:
      yield (key: i, val: i * i)
  iter(m)

block:
  let a = 2
  let m = Melon()
  for k, v in m:
    echo "k=", k, "; v=", v
```
or without a closure iterator:
```nim
type
  Melon = object

template pairs*(m: Melon): tuple[key: int, val: int] =
  (iterator(melon: Melon): tuple[key: int, val: int] =
    for i in a .. 10:
      yield (key: i, val: i * i))(m)

block:
  let a = 2
  let m = Melon()
  for k, v in m:
    echo "k=", k, "; v=", v
```
Reference: https://forum.nim-lang.org/t/6378

### Term rewriting templates
TODO

### When to use templates?
The main rule to using templates is **If you can do without templates, either with procs or macros, don't use templates. You'll save on nasty bugs and debugging trouble.**

Templates are useful to:
1. Reduce the size of a block of code, when some text parts can be factorized in a template. For instance, in an external GUI library, all API calls share a `ctx` parameter that keeps the context of the call. Instead of forcing the user to specify this argument in each call, the library author has defined templates that add this parameter. To the library user, templates invocations seem similar to proc calls, but with a lighter syntax.
```nim
template newCanvas(body: untyped) =
  block:
    let ctx = GUI_newContext()
    body

template drawLine(p1, p2: Point) =
  GUI_drawLine(ctx, p1, p2)

# Now in the code with a nice syntax
newCanvas:
  drawLine x1, x2
```

2. Optimization, particularly when using term rewriting templates.

3. Creation of simple DSL
For instance, after using a database connection, the user must return it to the connection pool. A template can automate this simple pattern and hide the *complexity* to the user:
```nim
template execSQL(sql: string): Rows =
  block:
    let conn = getConnection(db)
    let res = conn.sqlExecute(sql)
    releaseConnection(conn)
    res

# ... in code
t = execSQL "select * from ..." 
```

4. When some part of the code must be evaluated at compilation time.

### Consequences of using templates
1. Even if code can be smaller when using templates, executable will be probably larger because template code is replicated when templates are instantiated, compared when using procs.
2. When used judiciously, templates can make faster executable: no procs call stack and parameters management; applying optimizations with term rewriting.
3. More difficult to debug. Templates are not seen by debuggers...


## Issues with templates

### Generic and templates
https://github.com/nim-lang/Nim/issues/13527

## Common bugs when using templates

1. Parameter evaluated multiple times
```nim
proc incr(x: var int): int =
  inc x
  result = x

template foo(i: int): int =
  i + i

var a = 1
echo "foo = ", foo(incr a)
echo "a = ", a
```

2. Parameter hygiene in template or proc generating template
```nim
import macros

template foo(x: int; y: int) =
  proc bar(x: int): int =
    result = y

expandMacros:
  foo(1, 2)
```
results in `Error: identifier expected, but found '1'`.
Here, `x` argument in `bar` has been renamed by [template arguments hygiene](https://nim-lang.org/docs/manual.html#templates-hygiene-in-templates) when template `foo` is instantiated. This can be seen in the `expandMacros` result displayed when compiling, after changing `x` in `bar` for `a`.

3. Obscure error message
```nim
template foo(a: int, b: int) =
  template bar(a: int): int =
    a == b

foo(1, 2)
```
results in `Error: identifier expected, but found '1'`.
