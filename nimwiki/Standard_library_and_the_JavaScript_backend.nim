import nimib, nimibook

nbInit(theme = useNimibook)

nbText:"""
The JavaScript backend can use only _some_ modules from the Standard Library. Here a list of modules known to work with the JS backend:

* [strutils](https://nim-lang.org/docs/strutils.html)
* [math](https://nim-lang.org/docs/math.html)
* [times](https://nim-lang.org/docs/times.html)

Furthermore all module working in [NimScript](https://nim-lang.org/docs/nims.html) should be available. Here the additional modules from the ones listed [in the NimScript documenation](https://nim-lang.org/docs/nims.html):

* [macros](https://nim-lang.org/docs/macros.html)
* [os](https://nim-lang.org/docs/os.html)
* [distros](https://nim-lang.org/docs/distros.html)
* [sugar](https://nim-lang.org/docs/sugar.html)
* [algorithm](https://nim-lang.org/docs/algorithm.html)
* [base64](https://nim-lang.org/docs/base64.html)
* [bitops](https://nim-lang.org/docs/bitops.html)
* [chains](https://nim-lang.org/docs/chains.html)
* [colors](https://nim-lang.org/docs/colors.html)
* [complex](https://nim-lang.org/docs/complex.html)
* [htmlgen](https://nim-lang.org/docs/htmlgen.html)
* [httpcore](https://nim-lang.org/docs/httpcore.html)
* [lenientops](https://nim-lang.org/docs/lenientops.html)
* [mersenne](https://nim-lang.org/docs/mersenne.html)
* [options](https://nim-lang.org/docs/options.html)
* [parseutils](https://nim-lang.org/docs/parseutils.html)
* [punycode](https://nim-lang.org/docs/punycode.html)
* [random](https://nim-lang.org/docs/random.html)
* [stats](https://nim-lang.org/docs/stats.html)
* [strformat](https://nim-lang.org/docs/strformat.html)
* [strmisc](https://nim-lang.org/docs/strmisc.html)
* [strscans](https://nim-lang.org/docs/strscans.html)
* [unicode](https://nim-lang.org/docs/unicode.html)
* [uri](https://nim-lang.org/docs/uri.html)
* [std/editdistance](https://nim-lang.org/docs/editdistance.html)
* [std/wordwrap](https://nim-lang.org/docs/wordwrap.html)
* [std/sums](https://nim-lang.org/docs/sums.html)

See also:

- [JavaScript modules on Fusion.](https://github.com/nim-lang/fusion/tree/master/src/fusion/js)
- [NodeJS standard library for Nim.](https://github.com/juancarlospaco/nodejs#modules-supported)
- [Karax for web Frontend.](https://github.com/pragmagic/karax)
"""
nbSave()
