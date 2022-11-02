<details>
  <summary>DISCLAIMER!</summary>

Unofficial, work in progress. There may be inaccuracies in this guide. 

This is a guide for people with experience in C or a similar language. The guide assumes some intermediate knowledge, for instance of how stacks and heaps works. 

The general tutorials can be found here:  
http://nim-lang.org/docs/tut1.html  
http://nim-lang.org/docs/tut2.html

The manual provides a more or less complete overview of the language:
http://nim-lang.org/docs/manual.html  

</details>


### Comparison

Feature              | C                                 | Nim
---------------------|-----------------------------------|-----------------------------------------
Compilation          | Machine code (Compiler)           | Machine code via C* (Compiler)
Meta-programming     | C Preprocessor                    | Yes, template, macro
Memory Management    | Manual (GC w/ libraries or obj-C) | Garbage collector or manual
Types                | Static                            | Static
Dependent types      | No                                | Partial support
Generics             | No (Templates w/ C++)             | Yes
int8/16/32/64 types  | Yes                               | Yes
Unsigned integers    | Yes                               | Yes
Arrays               | Yes                               | Yes
Char types           | Yes                               | Yes
Enum types           | Yes                               | Yes
Anonymous Functions  | No (Yes w/ C++11)                 | Yes
Immutability         | Yes                               | Yes
Bounds-checking      | No                                | Yes
Type inference       | No (some w/ C++11)                | Yes 
Closures             | No (Yes w/ obj-C or C++11)        | Yes
Operator Overloading | No (Yes w/ C++)                   | Yes, on any types
Custom Operators     | No                                | Yes
Object-Oriented      | No (Yes w/C++ or obj-C)           | Minimalistic**
Methods              | No (Yes w/C++)                    | Yes
Multi-Methods        | No                                | Yes
Exceptions           | No (Yes w/C++)                    | Yes
Package Manager      | No (unofficially yes)             | Yes, Nimble
File extensions      | .c, .h                            | .nim, .nims

 \*Other backends supported and/or planned.  
 \**See section below. Also, it's arguably possible to write OOP-style in pure C.

### Arrays

In C, an array is more or less syntactic sugar for pointers. In Nim, arrays are much more strict and safe to use. They are pass-by-value (meaning they're copied at assignment). When passing an array to a proc in Nim, the argument is a read-only reference, meaning it can't be assigned to. Take the following example:

**C:**

```C
void foobar(int z[4]) {
	z[5] = 5;
	printf("%d\n",z[5]);
}
int main() {
	int x[4] = {1, 2, 3, 4};
	foobar(x);
	printf("%d\n", x[1]);
	return 0;
}
```

**Nim:**

```nim
proc foobar(z: array[0..3, int]) = 
  z[5] = 5  # Error: Cannot assign to z
  echo z[5] # Error: Index out of bounds.

var x = [1, 2, 3, 4]

foobar(x)
```

The C code will compile; it may or may not crash. The Nim code will not compile. If you mean to change the array that was passed to the procedure, you can change the the signature of the procedure to ```proc foobar(z: var array[0..3, int])```. Now, you will only get index out of bounds error. If you change the index in both lines to 1, the code will compile. If the index is a variable, Nim will include run-time checks on the bounds of the array.

In C, you can pass an ``int[3]`` to the foobar function, and the compiler will not complain. In this case, Nim would not compile. You can use an openarray to accept an array of any size, and you can use low(z) and high(z) to query the bounds of the array.

Nim arrays can also be indexed from any number. That is, ``z: array[1..4, int]`` is an array of int indexed from 1 to 4. Trying to access ``z[0]`` would throw an "index out of bounds" error.

In C, there's nothing that stops you from keeping a pointer to a stack-allocated array after the function that declared it has returned (and the stack is invalidated). In Nim, this is true as well, but you are strongly discouraged from using pointers in Nim, and you can accomplish almost everything you'd otherwise use pointers for with normal arguments, "var" arguments, variables, and "ref".

### Unsigned integers

Nim strongly discourages the use of unsigned integers, as it's considered unnecessary and [somewhat unsafe](http://critical.eschertech.com/2010/04/07/danger-unsigned-types-used-here/) for most applications.

That said, unsigned integers are used and support for them has improved over the years. In most cases, you should only use them for systems programming use cases though, not for general applications if you can help it.

### Object-orientation

Objects in Nim have more features than structs in C, but behave quite differently from classes in C++. Objects support inheritance (but not multiple inheritance). Otherwise, most of the features that apply to objects simply apply to all types in Nim.

You can call a proc on objects with the ```anObject.foobar()```, but you can do that on any type (e.g. ints and arrays) as well. You can have methods on object, but you can have methods on any types, and for all the arguments, not just the first (in C++, implicit) one.

Nim does not have an implicit `this` or `self`.

It is possible to implement object-orientation features from other languages (like C++, Java, etc. or Smalltalk, Objective-C, Ruby, etc.) through libraries, thanks to the extensive meta-programming features of Nim. These are at the moment mostly work-in-progress.

### Structs - Tuples and Objects

Tuples and Objects in Nim are kind of like structs in C, but not exactly. Objects, like C structs, use nominal typing. This means that given objects A and B (where B is not a subclass of A), A can not be substituted for B, and B can not be substituted for A, even if they have the same fields. Tuples, on the other hand, use structural typing. If a tuple C contains the same fields as tuple D, they are interchangeable. This is a feature not present in C.

### Interfacing C and Nim

See [Foreign function interface](http://nim-lang.org/docs/manual.html#foreign-function-interface).

### Converting C code to Nim

See [c2nim](https://github.com/nim-lang/c2nim/blob/master/doc/c2nim.rst).

### Cheat Sheet

**Note:** Code examples are not exactly one-to-one, there may be subtle differences in the semantics. See comments.

<table>
  <tr>
    <th>C</th><th>Nim</th><th>Comment</th>
  </tr>

  <tr>
<td>
<pre>
/* A single-line comment */
int x = 3;  // more comment
// So is this
</pre>
<pre>
/*
a multi-line comment
*/
//
// or maybe this way?
//
#if 0
    some code 
    including comments 
    to be ignored
#endif
</pre>
</td>
<td>
<pre>
# A single-line comment
var x = 3  # more comment
</pre>
<pre>
#[
a multi-line comment. #[ may be nested ]#
]#
#
# or maybe this way?
#
when false:
  a multi-line comment 
  (but must be indented 
  to be included)
</pre>
</td>
<td>
<b>Single line comments</b>. Use the hash char (#).
<br>
<br>
<b>Multi-line comments</b>. Readability vs ease of use?
</td>
  </tr>
  <tr>
<td>
<pre>
int x;
int y = 2;
</pre>
</td>
<td>
<pre>
var x : int
var y1 : int = 2
var y2 = 2
let z = 2
</pre>
</td>
<td><b>Define variable</b>. y2 uses type inference. z is single-assignment. In Nim, uninitialized variables are initialized to 0/nil or similar defaults.</i>
</td>
  </tr>

  <tr>
<td>
<pre>
char s[] = "Hello World.";
char s0 = s[0]; // 'H'
char *t = s; // Ptr to s
s[11] = '!';
// s, t == "Hello World!"
</pre>
</td>
<td>
<pre>
var s = "Hello World."
var s0: char = s[0] # 'H'
var t = s # Copy of s
s[11] = '!'
# s is "Hello World!"
# t is "Hello World."
</pre>
</td>
<td><b>Strings and char</b>. Strings are pass-by-value (copied on assignment) and strictly bounds-checked on access.</i>
</td>
  </tr>

  <tr>
<td>
<pre>
char a = '\n';
printf("byte %d\nA%cB\n", 
        a, a);
</pre>
</td>
<td>
<pre>
let a = '\L'
echo "byte ", $int(a), 
     "\nA" & $a & "B"
</pre>
</td>
<td><b>Newlines and chars</b>. In Nim, you can't use ``\n`` as a character literal, because on Windows, it expands to CR+LF. Thus, you need to specify which char to use.</i>
</td>
  </tr>

  <tr>
<td>
<pre>
9 % 8  // 1
-9 % 8 // -1
(unsigned)(-9) % 
   (unsigned)(8) // 7
</pre>
</td>
<td>
<pre>
9 mod 8  # 1
-9 mod 8 # -1
-9 %% 8  # 7
</pre>
</td>
<td><b>Modulo operator</b>. <i>%% treats its argument as unsigned numbers. <a href="https://nim-lang.org/docs/manual.html#types-preminusdefined-integer-types">See</a></i></i>
</td>
  </tr>


  <tr>
<td>
<pre>
int x = foobar() ? 42 : 0;
</pre>
</td>
<td>
<pre>
var x = if foobar(): 42 
               else: 0
</pre>
</td>
<td>
<i>if statements return the value of the expression they evaluate to, so Nim doesn't need a </i><b>ternary operator</b>.</i>
</td>
  </tr>


  <tr>
<td>
<pre>
void foo() {
  printf("Hello World\n");
}
int bar() {
  return 2;
}
int baz(int x) {
  return x*2;
}
int foobar(int *x) {
  return (++*x)*2;
}

</pre>
</td>
<td>
<pre>
proc foo() =
  echo "Hello World"

proc bar(): int =
  2

proc baz(x: int): int =
  x*2

proc foobar(x: var int): int =
  inc(x)
  result = x*2
</pre>
</td>
<td><b>Function/Procedure.</b>  </td>
  </tr>

  <tr>
<td>
<pre>
int a = 3
int *b = &a;
</pre>
</td>
<td>
<pre>
var a = 3
var b = addr(a)
</pre>
</td>
<td><b>Getting an address.</b> <i></i> </td>
  </tr>

  <tr>
<td>
<pre>
void foobar(person_t *a) {
  person_t b;
  b = *a;
  b.name = "Bob";
  *a = b;
}
</pre>
</td>
<td>
<pre>
proc foobar(a: ref Person) =
  var b: Person
  b = a[]
  b.name = "Bob"
  a[] = b
</pre>
</td>
<td><b>Dereference.</b> <i>In C, only the pointer to the strings in the struct is copied. In Nim, the string is also copied, but refs are not deep-copied.</i> </td>
  </tr>

  <tr>
<td>
<pre>
double d = 3.1415926;
int i = (int) d;
d = (double) i;
printf("%d, %g\n", i, d);
</pre>
<pre>
int x = 42;
void *p = &x;
int y = (int) *p;
printf("%d, %d, %p\n", x, y, p);
</pre>
</td>
<td>
<pre>
var d = 3.1415926
var i = d.int
d = i.float
echo i, " ",d
</pre>
<pre>
var 
  x = 42
  p: pointer = x.addr
  y = cast[ptr int](p)[]
echo x, " ", y, " ", repr(p)
</pre>
</td>
<td>
<b>Simple casting</b> Considered unsafe in Nim (and that you know what you are doing).
<br>
cast is NOT for numeric type conversion.
</td>
  </tr>

</table>


### Philosophy

The key to understanding Nim is that Nim was designed to be as fast as C, but to be much safer. Many of the design-decisions are based on making it harder to shoot yourself in the foot. For example, in C you are required to use a pointer for most of your everyday programming needs. While Nim does give you pointers, Nim gives you other, safer tools for your everyday needs, while pointers are mostly reserved for interfacing with C and doing low-level system programming. In other words, C gives you a combined hammer and gun, while Nim gives you a separate gun and hammer.

The other important thing to know is that while C uses a separate language to do meta-programming (the preprocessor), Nim meta-programming is done with the Nim language itself. That means that most Nim code can be executed at compile time, and Nim's ability to generate Nim code at compile time is much more sophisticated.

[ :arrow_up: :arrow_up: :arrow_up: :arrow_up: ](#Comparison "Go to top")
