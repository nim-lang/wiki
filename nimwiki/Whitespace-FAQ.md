**WIP**

-----------------

# Whitespace
## New Lines

Most statements have only one line, and are followed by a line break. With languages whose lines are delimited by semicolons, the programmer pays a tax every line, just so that multiline statements can be used. But as presented below, Nim lets you use multiline statements most of the time w/o requiring this semicolon tax.

Really long lines that must be broken are bad style, but often unavoidable. In those cases, Nim provides many implicit continuation options. The rule of thumb is that after a `,`, unary or binary operators and `(` `[` `{` you can safely put a line break and continue the statement in the following line. If none of those things occurs naturally, you can always add a parenthesis. Two characters in those exceedingly rare situations, instead of one character every line.

After a continuation, the code can be positioned quite freely. The only rule is that the continuing line must be indented at least one level above the first line. 

For example, all the following Nim code is valid:

```nim

someReallyLongProc(withMany, commands,
                   that, may, be, broken,
                   in many, lines)

var c = long().method().chains().
  ofFunctionsWithlooongNames()

var x = 2 +
        2

const DeBruijnNumbersTable: array[32, int8] =
  [
    0'i8, 1, 28, 2, 29, 14, 24, 3, 30, 22, 20, 15, 25, 17, 4, 8,
    31, 27, 13, 23, 21, 19, 16, 7, 26, 12, 18, 6, 11, 5, 10, 9
  ]

```

Nim also has semicolons. They are redundant as simple statement terminators, but useful if you want to fit multiple statements in one line. Statement lists can also be used  in some places where you would need to define a block using indentation

## Indentation

In 'curly braces languages', indentation works like comments. You will put it to make the code understandable, but its meaning is not enforced by the compiler/interpreter and thus can get out of sync with the real meaning, defined by the braces, or lack of it. This can lead to dangerously ambiguous code (for humans to understand, of course). For example (from ["Python: Myths about Indentation"](http://www.secnetix.de/~olli/Python/block_indentation.hawk)):

```C
if (some condition)
        if (another condition)
                do_something(fancy);
else
        this_sucks(badluck);
```
Either the indentation is wrong, or the program is buggy, because an "else" always applies to the nearest "if", unless you use braces. This is an essential problem in C and C++. Of course, you could resort to always use braces, no matter what, but that's tiresome and bloats the source code, and it doesn't prevent you from accidentally obfuscating the code by still having the wrong indentation. (And that's just a very simple example. In practice, C code can be much more complex.)

### Tabs vs Spaces

This is a non-issue in Nim, as only spaces are accepted as an indentation character --- a syntax error will be thrown if the compiler detects tabs being used for indentation (though this can be worked around by using a [syntax filter](https://nim-lang.org/docs/filters.html)). However, languages that allow both of them to be mixed are dangerous. Some languages, like python 2 by default (fixed on python 3), tries to convert a tab to a certain number of spaces, and thus an indentation error introduced by mixing tabs and spaces will only be detected as a run-time failure. Other languages, that ignores any type of indentation, will generate code that behaves differently than it looks at first sight when using an editor with different tab-stops configuration. This can hide/introduce bugs, like in the previous C/C++ example. 

## Deep nesting

Many editors have an option to visibly show indentation markers, helping to visualize more easily the different levels, but code should not be indented too deeply since it is frequently a sign that parts should be refactored into smaller functions.

## Strong spaces

A experimental feature, currently only available through a source code filter, is strong spaces. The relative spacing between operators and operands overrides their standard precedence, like adding parenthesis would.

Only 0, 1, 2, 4 or 8 spaces are allowed and the compiler enforces that infix operators have the same amount of spaces before and after them. This rules does not apply when a newline follows after the operator, then only the preceding spaces are considered.

# Sharing code

Use dedicated source code paste sites and tags, that usually also gives you syntax highlighting and maybe even versioning and forking support. Having to read code on the internet without syntax highlighting and stripped indentation sucks. https://gist.github.com/ is ideal for this.
