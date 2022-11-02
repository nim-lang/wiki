import strformat, strutils
import nimib
import nimoji

nbInit

nbText:"""
# **Disclaimer: this list is outdated - nowadays most libraries work with ARC/ORC just fine**

Works (and tested) with ARC
- https://github.com/zevv/npeg
- https://github.com/yglukhov/variant
- https://github.com/yglukhov/nimpy
- https://github.com/gokr/spryvm (compiled with ARC by default)
***

Works (and tested) with ORC
- https://github.com/bung87/htmlparser

***


Works with ORC (as of writing)
- https://github.com/soasme/nim-markdown - ~~https://github.com/nim-lang/Nim/issues/15039~~ Fully fixed in https://github.com/nim-lang/Nim/pull/15113
- https://github.com/nim-lang/irc - ~~[wrong sink parameter passing](https://github.com/nim-lang/Nim/issues/14207)~~
- https://github.com/flyx/NimYAML - Works with a patch https://gist.github.com/Yardanico/b4aaf28ec157c330a7639103d892b9be ~~[crash when modifying a string with mitems iterator](https://github.com/nim-lang/Nim/issues/15052)~~
- https://github.com/jabbalaci/nimpykot/

Works with ARC (as of writing)
- https://github.com/ba0f3/ptrace.nim - ~~https://github.com/ba0f3/ptrace.nim/pull/2~~
- https://github.com/D-Nice/nbaser - ~~https://github.com/D-Nice/nbaser/issues/6~~
- https://github.com/Nycto/RBTreeNim - ~~partially fixed by https://github.com/nim-lang/Nim/issues/15024 , but still SIGSEGVs on some tests.~~ Fully fixed in https://github.com/nim-lang/Nim/pull/15113
- https://github.com/treeform/flippy
- https://github.com/elijahr/lockfreequeues
- https://github.com/joachimschmidt557/nimmm
- https://github.com/BarrOff/roots (test fails, but it fails with refc and seems because of float precision)
- https://github.com/jackhftang/lrucache.nim
- https://github.com/rlipsc/polymorph
- https://github.com/jiro4989/faker
- https://github.com/jiro4989/wave
- https://github.com/fox0430/moe - ~~https://github.com/nim-lang/Nim/issues/14994~~
- https://github.com/johnnovak/illwill
- https://github.com/jangko/msgpack4nim
- https://github.com/StefanSalewski/gintro
- https://github.com/treeform/typography
- https://github.com/bluenote10/NimData
- https://github.com/alehander92/gara
- https://github.com/GULPF/timezones
- https://github.com/bluenote10/NimSvg
- https://github.com/jangko/nimAES
- https://github.com/narimiran/itertools
- https://github.com/jangko/nimpdf
- https://github.com/vindaar/seqmath
- https://github.com/vindaar/shell
- https://github.com/ftsf/nico (tested the platformer example)
- https://github.com/nitely/nim-regex - ~~[[ARC] ICE with static objects](https://github.com/nim-lang/Nim/issues/14236)~~
- https://github.com/trustable-code/NiGui - ~~[[ARC] Incorrect sinking of an argument?](https://github.com/nim-lang/Nim/issues/14233)~~
- https://github.com/avahe-kellenberger/nimdow - need to replace two `cast[Pcuchar](wmName)` with `cstring(wmName)` in `windowmanager.nim`
- https://github.com/oprypin/nim-random - ~~[ARC codegen bug with inline iterators](https://github.com/nim-lang/Nim/issues/14219)~~
- https://github.com/cheatfate/nimcrypto - ~~[ARC codegen bug with inline iterators](https://github.com/nim-lang/Nim/issues/14219)~~
***

***

Won't work in arc without changes in the libraries:
- https://gist.github.com/Yardanico/5a9f7e9842101443ebf662c58340f406#gistcomment-3289689:
  - https://github.com/brentp/hts-nim doesn't work
  - https://github.com/brentp/mosdepth doesn't work because hts-nim doesn't work

***

A bug or not yet sure:
- https://github.com/jangko/nimAES/ - a bug in the library itself, read https://irclogs.nim-lang.org/21-07-2020.html#23:28:13
- [ARC: deepCopy in new runtime feature missing, do we have alternatives?](https://github.com/nim-lang/Nim/issues/13997):
  - https://github.com/PMunch/nim-persistent-vector: because of `deepCopy` [here](https://github.com/PMunch/nim-persistent-vector/blob/master/persvector.nim#L56)
  - https://github.com/NimParsers/parsetoml: uses `deepCopy` too
- https://github.com/mratsim/Arraymancer: known, [issue here](https://github.com/mratsim/Arraymancer/issues/423)
- https://github.com/Vindaar/ggplotnim: blocked by arraymancer
- nimsuggest - compiles if you put ~10 `{.nosinks.}`, but fails for the first `nimsuggest` test.
- https://github.com/PMunch/nimlsp - doesn't work as it depends on `nimsuggest`
- https://github.com/zedeus/nitter - [[ARC] Undeclared variable in C with inline pragma and iterators](https://github.com/nim-lang/Nim/issues/14251) - works if you workaround this bug (by removing inline pragma from some nim-regex functions) and add a few ``{.nosinks.}`` annotations."""
nbSave()
