import nimib, nimibook

nbInit(theme = useNimibook)

nbText:"""
If you add more editor support, don't forget to add it to the [FAQ](https://nim-lang.org/faq.html) as well. 

The following editors have some Nim support:

### Visual Studio Code aka VSCode (and VSCodium)

* Nim extension written in the Nim language
* Available on [Visual Studio Market Place](https://marketplace.visualstudio.com/items?itemName=nimsaem.nimvscode) and [OpenVSX](https://open-vsx.org/extension/nimsaem/nimvscode) (Nim Extension)

 * Syntax Highlight (nim, nims, nimble, nim.cfg)
 * Code Completion
 * Signature Help
 * Goto Definition
 * Find References
 * File outline
 * Lint-on-save (optional)
 * Build-on-save and / or hotkey (optional)
 * Workspace symbol search
 * Quick info
 * Nim check result reporting (macro development)

* Related extensions and information for Nim with VSCode

  * https://code.visualstudio.com (editor homepage)
  * https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow (indent visualizer)
  * https://marketplace.visualstudio.com/items?itemName=mattn.Runner (code runner)
  * https://marketplace.visualstudio.com/items?itemName=webfreak.debug (debugger)
  * https://forum.nim-lang.org/t/6862#42899 (Nim forum )
  * Original Nim extension written in TypeScript:
    * https://marketplace.visualstudio.com/items?itemName=kosz78.nim
    * http://forum.nim-lang.org/t/2061 (Nim Forum Thread)

### IntelliJ IDEA, CLion, etc. (Jetbrains IDEs)

* https://plugins.jetbrains.com/plugin/15128-nim (JetBrains Official Nim Plugin)

 * Syntax highlighting - token-based and semantic
 * Syntax errors highlighting
 * Code completion, find usages and refactoring of unqualified symbols
 * Import and include resolution to relative files
 * Code folding
 * Structure view
 * Different forms of the same identifier are recognised properly, e.g. foo, f_O_O, fOO or even `f oo` 

 * Coming soon:

    - Import resolution to standard Nim symbols and Nimble packages
    - Code completion, find usages and refactoring of qualified symbols
    - Compiler errors in editor
    - Support for run/debug configurations
    - Nimscript and nimble files syntax highlighting
    - Quick documentation 

* ~~https://plugins.jetbrains.com/plugin/14520-nimatron/ (Nimatron plugin):~~ **DEPRECATED**

   * ~~Syntax-highlighting.~~
   * ~~Nim routines (funcs, procs, etc) listed in Structure View.~~
   * ~~Folding of Nim statements.~~

### Emacs
* https://github.com/nim-lang/nim-mode (requires emacs 24.4)
* https://github.com/jameshfisher/nimrod-mode (works with emacs 23 too, as of 2014-02-15)

### Vim
* https://github.com/zah/nim.vim/

  * Syntax Highlighting
  * Auto-indent
  * Build/Jump to errors within Vim
  * Project Navigation and Jump to Definition (using the Ctags support listed below or [Nim's idetools](https://nim-lang.org/docs/idetools.html) command)

* https://github.com/alaviss/nim.nvim

  An experimental plugin targeting Neovim (no Vim support) featuring:

  * Semantic syntax highlighting
  * Go to definition
  * Auto-completion
  * Section movements
  * Auto-indent
  * Code folding
  * Find references
  * File outline

* http://gradha.github.io/articles/2014/02/invoking-dash-from-the-command-line-vim.html

  Instructions to map Vim's ``K`` letter to look up documentation under MacOSX using [Dash](http://forum.nim-lang.org/t/330).

* https://github.com/w0rp/ale (Asynchronous Lint Engine)
  * General lint/syntax-check plugin
  * Supports running `nim check` on save by default
  * Only works with Vim8 and neovim since it uses async features

* https://github.com/baabelfish/nvim-nim

  A plugin for Vim and Neovim, not updated in a few years.

### Textadept
* https://github.com/xomachine/textadept-nim

  A plugin for [Textadept](https://foicica.com/textadept/)

### LiClipse
* http://www.liclipse.com

LiClipse is a plugin for Eclipse (which also provides a standalone version for convenience) which provides Nim support providing syntax-highlighting, outline, comment/uncomment (ctrl+/), select/deselect scope (Shift+Alt+Up/Down), auto-indent, mark occurrences, user templates, multiple cursors (Ctrl+K or Ctrl+Alt+mouse select) and indent guides.

### Scite
Recent versions of Scite have out-of-the-box support for Nim. For older versions: <br />
http://sourceforge.net/p/scintilla/scite/ci/default/tree/src/nimrod.properties?format=raw

To enable syntax highlighting, edit the global config file: *(from http://forum.nim-lang.org/t/312)*
   * remove `nimrod` from the list in  `imports.exclude=(...lots of stuff)` 

To add _*.nim_ to Scite's "All Source" filter (tell Scite to treat _.nim_ files as source code):

 * _nimrod.properties_ : after `file.patterns.nimrod=*.nim`, add one more line : `*source.patterns.nimrod=$(file.patterns.nimrod);`
 * _SciTEGlobal.properties_ : if _source.files_ line already looks like `source.files=$(star *source.patterns.)`, we're done ;
   * otherwise, edit _source.files_ to make scintilla recognise .nim -- e.g. add .nim directly to the list, etc



### Aporia
Aporia is a Nim IDE written in Nim.

https://github.com/nim-lang/Aporia/

### Visual Studio

https://github.com/Gravityzwell/NimStudio

### LightTable
https://github.com/zah/nim.lt/

### Atom
* https://github.com/russpowers/nim-atom
  * Autocomplete
  * Linting/Error Checking (on file save or on-the-fly)
  * Jump-to-definition
  * Syntax highlighting

* https://github.com/zah/nim.atom/

### Gedit/Other GtkSourceView editors
There is a .lang file for gedit [here](https://github.com/nim-lang/Aporia/blob/master/share/gtksourceview-2.0/language-specs/nim.lang)

### Geany
[Geany](http://www.geany.org) is a lightweight GUI text editor using Scintilla and GTK+, including basic IDE features. It supports syntax highlighting for Nim since [Geany 1.36](https://github.com/geany/geany/releases/tag/1.36.0).

### Ctags
Basic ```~/.ctags``` rules for Nim code (Feel free to improve and contribute)
Don't use this if possible, [Nim idetools](http://nim-lang.org/docs/idetools.html) provides better results.

```
--langdef=nim
--langmap=nim:.nim
--regex-nim=/(\w+)\*?\s*=\s*object/\1/t,class/
--regex-nim=/(\w+)\*?\s*=\s*enum/\1/t,enum/
--regex-nim=/(\w+)\*?\s*=\s*tuple/\1/t,tuple/
--regex-nim=/(\w+)\*?\s*=\s*range/\1/t,subrange/
--regex-nim=/(\w+)\*?\s*=\s*proc/\1/t,proctype/
--regex-nim=/proc\s+(\w+)/\1/f,procedure/
--regex-nim=/method\s+(\w+)/\1/f,method/
--regex-nim=/proc\s+`([^`]+)`/\1/o,operator/
--regex-nim=/template\s+(\w+)/\1/t,template/
--regex-nim=/macro\s+(\w+)/\1/m,macro/
```

Alternatively, there's a native tags generator specifically for Nim: https://bitbucket.org/nimcontrib/ntags

### jEdit
https://github.com/exhu/nimrod-misc/tree/master/jedit

### Sublime
* https://github.com/vanyle/SublimeNim

  **SublimeNim** is a Sublime Text 4 plugin for Nim. Some features:
    * Syntax highlighting
    * Highlight errors (Using `nim check`)
    * Show tooltips with type information
    * Goto Definition (link inside tooltip)
    * Autocompletion (based on `nimsuggest`)
    * Shows your documentation
    * Keyshortcuts for building and generation documentation

* https://github.com/Varriount/NimLime

  **NimLime** is a Sublime Text plugin that supports:
    * Syntax highlighting
    * Go to definition
    * Error checking and highlighting through the compiler
    * Completion suggestions though the compiler
    * Babel package manager interaction

* https://github.com/leonardoce/nimrod-sublime

### Kate

Syntax highlighting:

https://github.com/PhilipWitte/NimKate  

### TextMate

Available from the bundle installer in preferences ([repository](https://github.com/textmate/nim.tmbundle)).

### QtCreator
Enable the experimental plugin 'Nim' from the menu Help -> About Plugin..
Support
* Syntax Highlighting
* Debugging
* Simple project handling

### KDevelop
https://github.com/xyz32/KDevelop-template

Demo: https://vimeo.com/135918228

KDevelop templates for Nim project and Nim file:

* Project management (build/run configuration)
* New nim file
* Debug with gdb (You will need to uncomment the debug flag in the nim.cfg file)
* Syntax Highlighting (Needs [Kate syntax highlighting](https://github.com/nim-lang/Nim/wiki/Editor-Support#kate)).

Make sure you have both Nim and Nimble installed.

### Howl

http://howl.io

Recent versions of Howl have built-in Nim syntax highlighting.

### Micro

https://github.com/zyedidia/micro

Has built-in Nim syntax highlighting

### Notepad++
Support Nim syntax highlighting and code folding via a plugin written entirely in Nim.

* Download available [here](https://github.com/jangko/nppnim/releases)
* Source code available [here](https://github.com/jangko/nppnim)

### Code::Blocks
[Pull request](https://sourceforge.net/p/codeblocks/tickets/657/) with the description of how to apply the attached settings locally to enable the Nim syntax highlighting.

### Kakoune

http://kakoune.org/

Has built-in Nim syntax highlighting and external linting support using Nim check with this [hook](https://gist.github.com/Clyybber/8861110a55f63ef1c255b26dbabfec1c)

### CudaText

Nim lexer is present in addons. To install it, use menu item "Plugins / Addons Manager / Install".

Plugin "LSP Client" supports Nim LSP server good: https://wiki.freepascal.org/CudaText_plugins#LSP_server_for_Nim

### Language Server Protocol (LSP)

https://github.com/PMunch/nimlsp

Partial implementation including completion and definitions. Will require separate syntax and indenting plugin."""
nbSave()
