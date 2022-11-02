import strformat, strutils
import nimib
import nimoji

nbInit

nbText:"""
# Best Practices

This list is a community-maintained guide for some "best practice" suggestions. Written in the TLDR style, suggestions are in no particular order, should be beneficial to users with any level of Nim proficiency.

- Use 2-spaces indentation.
- [Use `func` where possible.](https://nim-lang.github.io/Nim/manual.html#procedures-func)
- [Use `auto` instead of `any`.](https://github.com/nim-lang/RFCs/issues/281#issue-737225894)
- [Use `self` instead of `this` for specifying the main object argument in routines.](https://github.com/nim-lang/Nim/pull/16927#issue-567131544)
- Use `const` and `let` where possible.
- Put your types near the top of the file.
- Use `import` for **public** code instead of `include`.
- Use `include` for **unittesting private code** instead of `import`.
- [Use `runnableExamples` for code examples in the documentation.](https://nim-lang.github.io/Nim/system.html#runnableExamples%2Cstring%2Cuntyped)
- Use `tuple` to return multiple values of different types.
- Standard library imports should be prefixed with `std/`, like `std/os`, `std/[strutils, sequtils]`, etc.
- Use `when isMainModule:` to specify code that'll only run if the source file is the main one.
- Design your code to work in-place, then [use `sugar.dup` if you need to call it out-of-place.](https://nim-lang.github.io/Nim/sugar.html#dup.m%2CT%2Cvarargs%5Buntyped%5D)
- Prefer in-place functions, for example, `sort` instead of `sorted` where appropriate.
- [Use `options` for optional types and optional returns.](https://nim-lang.github.io/Nim/options.html#basic-usage)
- Use `Natural` or `Positive` as an argument or input type for non-negative integers.
- Use `char` to operate on single characters, for example `"foo" & '\n'` instead of `"foo" & "\n"`.
- Annotating routines with `{.deprecated.}` will make the compiler print out all places where that routine is called.
- Procedures like `echo`, `repr`, `astToStr`, `assert`, `expandMacros` and the compiler switch `--expandArc` can be useful for debugging.
- In macros prefer to operate on the AST instead of using `parseStmt` and string operations.
- For designing new macros write the desired result manually and then use `dumpAstGen` to get macro code that will generate the same code. 
- Use `string` to represent strings of any kind (Nim strings are not encoded in any way) - **NOT** for binary blobs.
- Use `seq[byte]` to represent raw binary blobs.
- Prefer to use `func` and/or `proc` even for OOP, use interface-like libraries (for example [iface](https://github.com/yglukhov/iface) instead of `method` unless there's no way around it.
- Use `nimble init` or a "repo template" like [nimtemplate](https://github.com/treeform/nimtemplate) to start a new project.
- Try to use `FIXME`, `NOTE`, `OPTIMIZE`, `TODO` in relevant code comments so that [editors](https://marketplace.visualstudio.com/items?itemName=ExodiusStudios.comment-anchors) and [GitHub Actions can read them.](https://github.com/marketplace/actions/todo-to-issue)
- For documentation it is generally preferred to use descriptive third person present tense with proper punctuation.
- For documentation the first paragraph of a doc comment must be a summary, it should concisely define the purpose and functionality of the module/library.
- **Do NOT** use `distinct tuple`.
- **Do NOT** use `float` for things that need to be precise (like money), instead consider using decimal.
- **Do NOT** use `discard` on a `Future`.
- **Do NOT** add label names to the `block` statement if you don't use them.
- **Do NOT** write error messages in ALL_CAPS.
- **Do NOT** use exclamation marks in error messages.
- **Do NOT** name your variables in ALL_CAPS unless it's required for FFI purposes.
- **Do NOT** use `Natural` or `Positive` as a return type for integers, use `int` or `uint` instead.
- **Do NOT** use `try` blocks with a lot of `except` branches, use explicit control flow instead.
- **Do NOT** repeat `&` too much for string concatenation, use `add` instead.
- **Do NOT** repeat `&` too much to string formatting, use `std/strformat` instead.
- **Do NOT** call `randomize()` in your libraries that use `std/random`, users should call it themselves.

See also:
- https://nim-lang.github.io/Nim/nep1.html
- https://status-im.github.io/nim-style-guide
- https://community.kde.org/Policies/Commit_Policy#Guidelines
- [Naming things cheatsheet, language agnostic](https://github.com/kettanaito/naming-cheatsheet#naming-cheatsheet)
"""
nbSave()
