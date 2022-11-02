import strformat, strutils
import nimib
import nimoji

nbInit

nbText:"""
# Note: Old, use macros instead, but some information here is still useful

## Introduction
As there are no tutorials (that I know of) on how to add new features to the nimrod
compiler I have decided to make one, based on me implementing the `requires`
pragma which will be used for Babel Packages.

As with many tasks there are many tools that are very helpful, I have used
the *nimgrep* tool which is in the tools/ directory in Nimrod's repository, but I'm sure you know of other tools which can be very helpful!

## First steps
The first thing I have decided to do was create a test file, it follows:

    {.requires packageA "0.7" "0.9".}
    echo("hi")
  
(It originally had a `..` between the two string literals, I decided to get rid
of that because I noticed that pragmas don't support it, I might come back to it.)

I then saved that file as *"pragmaTest.nim"* and compiled it with
`nimrod c pragmaTest.nim`. This has caused `pragmaTest.nim(1, 10) Error: invalid pragma: requires`.

The next step was quite obvious, searching for "invalid pragma:", `nimgrep --recursive --ext:nim "invalid\ pragma:"`,
this only gives one result.

    ../Nimrod/rod/msgs.nim
      258:     errInvalidPragmaX: "invalid pragma: $1",

After some more intellectual grepping and looking through files, I noticed that the pragma() function in pragmas.nim
takes an argument called `validPragmas` this lead me to *semtypes.nim* and *semstmts.nim* 
after searching for (yes, you've guessed it) `pragma(`(please note this needs escaping when used as a regex).

There was many `pragma` calls, I have looked at most of them and since I wanted
a "global"(not sure if that's the correct term) pragma, for example
`{.warning: "warning".}`. The `pragma` function is called with many different
valid pragma groups. There is among many others, `stmtPragmas`, which is what
I wanted, it's defined in *pragmas.nim*.

## Hacking the code!
I found where `TSpecialWords` is defined(*wordrecg.nim*) and added `wRequires`
there, to the `specialWords` array below, and also to `stmtPragmas`. I then added `wRequires` to the case statement in the `pragma` function in *pragmas.nim*.

This is where the `debug` function came into play, it is a function that pretty prints a 
node in the AST, it is very useful. I added two `debug` calls one for the 'it' node
and another one for the 'n' node.

I then bootstrapped by executing `./koch boot`. After I got the beautiful "SUCCESS",
I compiled *pragmaTest.nim*. And I got this output: 

    {
      "kind": "nkIdent",
      "ident": "requires"
    }
    {
      "kind": "nkPragma",
      "sons": [
        {
          "kind": "nkIdent",
          "ident": "requires"
        },
        {
          "kind": "nkIdent",
          "ident": "packageA"
        },
        {
          "kind": "nkStrLit",
          "strVal": "0.7"
        },
        {
          "kind": "nkStrLit",
          "strVal": "0.9"
        }
      ]
    }"""
nbSave()
