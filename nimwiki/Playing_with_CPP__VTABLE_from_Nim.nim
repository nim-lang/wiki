import strformat, strutils
import nimib
import nimoji

nbInit

nbText:"""
### Precautions
This method has been tested to be interoperable between MS-VCC and GCC (MINGW) on Windows, and should be compatible with LLVM-clang too. But for other C++ compilers, there is no guarantee this method will work. So use it with caution. Generally this is a really unsafe assumption about how C++ compilers work. Don't rely on this explanation if you are not sure what really happened under the hood. It is better to wrap the virtual function call in an extern "C" function and call that from Nim if you want to be sure the compiler generated a correct virtual function call.

### The Situation
Imagine you are trying to communicate with a C++ app from Nim, and the C++ interface only provide a bunch of pure virtual functions classes, and a pointer to the class instance. Only a few `extern "C"` functions to initialize the communication, all other communications must be done via that pointer. What will you do?

### Example case, notepad++ plugin:
The notepad++ plugin is a normal dll with a normal interface. A standard notepad++ plugin requires the normal cdecl calling convention for its binary interface, which is not a big problem, and the Nim FFI can handle that perfectly. But things get more interesting when we want to make an external lexer for the notepad++ editor engine: Scintilla.

Although that external lexer we want to create must also reside in the same dll with our notepad++ plugin, it has a different calling convention. Scintilla requires the "stdcall" calling convention for all functions it uses. Again, this is not a problem for Nim, just use the {.stdcall.} pragma. But there is another requirement for notepad++ plugin: all exported function names must not be decorated ala normal stdcall, so we need to activate the `-Wl,--kill-at` switch when we compile the plugin project, and the C/C++ compiler will handle that.

OK, so far no C++ features we already met. But wait, that's not the real interface to Scintilla, it's only the entry point for a more complicated interface.

### The C++ interface
```C++
class IDocument {
public:
	virtual int SCI_METHOD Version() const = 0;
	virtual void SCI_METHOD SetErrorStatus(int status) = 0;
	virtual Sci_Position SCI_METHOD Length() const = 0;
	virtual void SCI_METHOD GetCharRange(char *buffer, Sci_Position position, Sci_Position lengthRetrieve) const = 0;
	virtual char SCI_METHOD StyleAt(Sci_Position position) const = 0;
	virtual Sci_Position SCI_METHOD LineFromPosition(Sci_Position position) const = 0;
	virtual Sci_Position SCI_METHOD LineStart(Sci_Position line) const = 0;
	virtual int SCI_METHOD GetLevel(Sci_Position line) const = 0;
	virtual int SCI_METHOD SetLevel(Sci_Position line, int level) = 0;
	virtual int SCI_METHOD GetLineState(Sci_Position line) const = 0;
	virtual int SCI_METHOD SetLineState(Sci_Position line, int state) = 0;
	virtual void SCI_METHOD StartStyling(Sci_Position position, char mask) = 0;
	virtual bool SCI_METHOD SetStyleFor(Sci_Position length, char style) = 0;
	virtual bool SCI_METHOD SetStyles(Sci_Position length, const char *styles) = 0;
	virtual void SCI_METHOD DecorationSetCurrentIndicator(int indicator) = 0;
	virtual void SCI_METHOD DecorationFillRange(Sci_Position position, int value, Sci_Position fillLength) = 0;
	virtual void SCI_METHOD ChangeLexerState(Sci_Position start, Sci_Position end) = 0;
	virtual int SCI_METHOD CodePage() const = 0;
	virtual bool SCI_METHOD IsDBCSLeadByte(char ch) const = 0;
	virtual const char * SCI_METHOD BufferPointer() = 0;
	virtual int SCI_METHOD GetLineIndentation(Sci_Position line) = 0;
};

class ILexer {
public:
	virtual int SCI_METHOD Version() const = 0;
	virtual void SCI_METHOD Release() = 0;
	virtual const char * SCI_METHOD PropertyNames() = 0;
	virtual int SCI_METHOD PropertyType(const char *name) = 0;
	virtual const char * SCI_METHOD DescribeProperty(const char *name) = 0;
	virtual Sci_Position SCI_METHOD PropertySet(const char *key, const char *val) = 0;
	virtual const char * SCI_METHOD DescribeWordListSets() = 0;
	virtual Sci_Position SCI_METHOD WordListSet(int n, const char *wl) = 0;
	virtual void SCI_METHOD Lex(Sci_PositionU startPos, Sci_Position lengthDoc, int initStyle, IDocument *pAccess) = 0;
	virtual void SCI_METHOD Fold(Sci_PositionU startPos, Sci_Position lengthDoc, int initStyle, IDocument *pAccess) = 0;
	virtual void * SCI_METHOD PrivateCall(int operation, void *pointer) = 0;
};
```

### How Nim emulates the C++ VTABLE

**As a side note:**

> For every class that contains virtual functions, the compiler constructs a virtual table (vtable). The vtable contains an entry for each virtual function accessible by the class and stores a pointer to its definition.

That means that VTABLE is only an array of pointers to functions, we can handle that easily.


ILexer is the real interface to external lexer that we must provide from our dll. IDocument is the interface we need to communicate with Scintilla. Both of them are pure virtual functions classes. Nim does not support C++ classes nor virtual functions, really? yes, there is no C++ equivalent class in Nim, and no virtual functions in Nim. That's why this wiki page exists, to overcome this kind of problem.

First, we will look at how Scintilla obtains a pointer to the ILexer instance from our dll.

```nimrod
type
  VTABLE* = array[0..25, pointer]

  ILexer* {.pure, final.} = object
    vTable*: ptr VTABLE

  LexerFactoryProc* = proc(): ptr ILexer {.stdcall.}

proc GetLexerFactory(idx: int): LexerFactoryProc {.stdcall, exportc, dynlib.} =
  if idx == 0: 
    result = lexFactory
  else:
    result = nil
```

Scintilla will call our GetLexerFactory, and the factory is a function returning a pointer to ILexer. You can see how we can simulate ILexer from Nim and then exporting correct instance to be called by Scintilla.

From the above snippet, we can see that C++ virtual functions is implemented via a pointer to array of pointers. That is the very basic concept of how C++ compilers implement virtual functions classes.

Now let's write Nim code that can emulate this behavior

```nimrod
proc Version(x: ptr ILexer): int {.stdcall.} = lvOriginal
proc Release(x: ptr ILexer) {.stdcall.} = discard
proc PropertyNames(x: ptr ILexer): cstring {.stdcall.} = nil
proc PropertyType(x: ptr ILexer, name: cstring): int {.stdcall.} = -1
proc DescribeProperty(x: ptr ILexer, name: cstring): cstring {.stdcall.} = nil
proc PropertySet(x: ptr ILexer, key, val: cstring): int {.stdcall.} = -1
proc DescribeWordListSets(x: ptr ILexer): cstring {.stdcall.} = nil
proc WordListSet(x: ptr ILexer, n: int, wl: cstring): int {.stdcall.} = -1
proc Lex(x: ptr ILexer, startPos, docLen: int, initStyle: int, pAccess: IDocument) {.stdcall.} = discard
proc Fold(x: ptr ILexer, startPos, docLen: int, initStyle: int, pAccess: IDocument) {.stdcall.} = discard
proc PrivateCall(x: ptr ILexer, operation: int, ud: pointer): pointer {.stdcall.} = nil

var lex: ILexer
var vTable: VTABLE

proc lexFactory(): ptr ILexer {.stdcall.} =
  vTable[0] = Version
  vTable[1] = Release
  vTable[2] = PropertyNames
  vTable[3] = PropertyType
  vTable[4] = DescribeProperty
  vTable[5] = PropertySet
  vTable[6] = DescribeWordListSets
  vTable[7] = WordListSet
  vTable[8] = Lex
  vTable[9] = Fold
  vTable[10] = PrivateCall
  lex.vTable = vTable.addr
  result = lex.addr
```

See, VTABLE is only an array of pointers to functions, Nim can handle that easily.

### How to call pure virtual functions from Nim

Now, we already know how to provide ILexer implementation from our dll, but what about IDocument? IDocument implementation is provided by Scintilla, how can we call IDocument member functions from Nim?

Armed with knowledge that C++ virtual functions tables is no more than an array of pointers. we can do something like this:

```nimrod
type
  IDocument* {.pure, final.} = ptr object
    vTable: ptr VTABLE

proc nvVersion*(dv: IDocument): int =
  type dvt = proc(x: IDocument): int {.stdcall.}
  result = cast[dvt](dv.vTable[0])(dv)

proc nvSetErrorStatus*(dv: IDocument, status: int) =
  type dvt = proc(x: IDocument, status: int) {.stdcall.}
  cast[dvt](dv.vTable[1])(dv, status)
  
proc nvLength*(dv: IDocument): int =
  type dvt = proc(x: IDocument): int {.stdcall.}
  result = cast[dvt](dv.vTable[2])(dv)

proc nvGetCharRange*(dv: IDocument, buf: cstring, pos, len: int) =
  type dvt = proc(x: IDocument, buf: cstring, pos, len: int) {.stdcall.}
  cast[dvt](dv.vTable[3])(dv, buf, pos, len)

#...and so on
```

Again, we can see how actually C++ compilers translate `->` operator when calling virtual functions, it will use the right index to the vtable and call the function via pointer, that what we also do in Nim, cast the typeless pointer to proc pointer and call it, don't forget that the first argument is also a pointer to the class instance.

### Conclusion
That's it, not too difficult heh? It's not too difficult because we are not dealing with C++ name mangling here, only dealing with pointers and calling convention, Nim can handle that perfectly, although a bit verbose compared to C++ style.

What about C++ ordinary [member] functions, constructor, and destructor?, well that's another story, C++ name mangling can be a nightmare if you try to solve that in Nim, because every C++ compiler have their own flavor/style of name mangling, but if you know the exact formula of C++ name mangling, please write another wiki!"""
nbSave()
