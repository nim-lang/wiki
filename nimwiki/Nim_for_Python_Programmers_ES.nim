import nimib, nimibook

nbInit(theme = useNimibook)

nbText:"""
# Tabla De Contenidos

|                                           |                                                         |                                  |                                               |
|:-----------------------------------------:|:-------------------------------------------------------:|:--------------------------------:|:---------------------------------------------:|
| [Comparacion](#Comparison)                 | [Objetos](#Objects)                                    | [Es necesario saber C?](#do-i-have-to-know-c)                | [Tuplas Nombradas](#named-tuple-1)                |
| [Variables](#Variables)                   | [`self.__init__()`](#self__init__)                      | [Strings](#Strings)              | [Listas](#Lists)                               |
| [Variable Naming](#variable-naming) | [Consistent Spacing](#consistent-spacing) | [Scoping](#scoping) | [Mutable arguments](#mutable-arguments) |
| [Imports](#Imports)                       | [Ranges](#Ranges)                                       | [Operaciones de String](#string-ops) | [Comprension de Lista](#List-Comprehensions)   |
| [try: import](#try-import) | [Static Bounds Checks](#static-bounds-check) | [Null Coalescing](#null-coalescing) | [`with` Context Manager](#with-context-manager) |
| [Arrays](#Arrays)                         | [Slices](#Slices)                                       | [Tuplas](#Tuples)                | [Comprension de Diccionario](#Dict-Comprehensions)   |
| [Comprension de Set](#Set-Comprehensions) | [Leer y Escribir archivos](#Reading-and-writing-files)  | [Decoradores](#Decorators)        | [Lambdas](#Lambdas)                           |
| [Sets](#Sets)                             | [JSON](#JSON)                                           | [Map & Filter](#map--filter)     | [Indentacion Opcional](#Optional-Indentation) |
| [Diccionarios](#Dictionaries)             | [CamelCase](#CamelCase)                                 | [DocStrings](#DocStrings)        | [Importar archivos Nim en Python](#Import-Nim-files-on-Python) |
| [Operador Ternario](#Ternary-operators)   | [Unittests](#Unittests)                                 | [def Vs proc / func](#def-vs-procfunc)    | [Auto-Ejecucion de Modulo Principal](#Self-Execution-of-Main-Module) |
| [Syntax Python para Nim](#Python-Syntax-for-Nim) | [Publicar a PYPI](#Publish-to-PYPI)              | [Compilacion Silenciosa](#Silent-Compilation) | [Ayuda de Compilador](#Compiler-Help)      |
| [Modos de Compilacion](#Build-Modes)               | [Abstract Base Classes](#ABC)                           | [Decoradores](#Decorators)        | [WebAssembly](https://github.com/nim-lang/Nim/wiki/Nim-for-TypeScript-Programmers#WebAssembly) |
| [Templates](#Templates) | [Nim corriendo Interpretado](https://nim-lang.org/docs/nims.html) | [Nim en el browser](https://github.com/nim-lang/Nim/wiki/Nim-for-TypeScript-Programmers#table-of-contents) | [Equivalencias de Libreria Standard](#Standard-Library-Equivalents) |
| [Instalar Paquetes Nim desde PIP](https://github.com/juancarlospaco/nimble_install#use) | [Instalar Nim desde PIP](https://github.com/juancarlospaco/choosenim_install#use) | [Cheatsheet PDF](https://www.overleaf.com/read/svnxffsjvscy) | [Arrow Functions](https://github.com/nim-lang/Nim/wiki/Nim-for-TypeScript-Programmers#Arrow-Functions) |
| [Pattern Matching](https://github.com/nim-lang/fusion/blob/master/src/fusion/matching.rst) | [Tutorial 1 en Espanol](https://github.com/nim-lang/Nim/wiki/Nim-Tutorial-1-(Spanish)) | [Tutorial 2 en Espanol](https://github.com/nim-lang/Nim/wiki/Nim-Tutorial-2-(Spanish)) | [Aprende Nim en 5 Minutos](https://github.com/nim-lang/Nim/wiki/Aprende-Nim-en-5-Minutos) |
| [Arduino, MicroPython, CircuitPython](#MicroPython) | [LiveCoding, FoxDot, SuperCollider](#SuperCollider) | [Como compartir variables entre funciones?](#How-to-share-variables-between-functions) | [Async](#Async) |

* [English Version](https://github.com/nim-lang/Nim/wiki/Nim-for-Python-Programmers#table-of-contents)
* [Spanish Version](https://github.com/nim-lang/Nim/wiki/Nim-for-Python-Programmers-ES#tabla-de-contenidos)


## Comparison

Caracteristica       | :snake: Python                       | :crown: Nim
---------------------|--------------------------------------|-----------------------------------------
Modelo de Ejecucion  | Maquina Virtual (Interprete)         | Codigo Maquina via C/C++ (Compilador)
Escrito usando       | C                                    | Nim
Licencia             | Python Software Foundation License   | MIT
Version (Mayor)      | `3.x`                                | `1.x`
Meta-programacion    | :heavy_check_mark: metaclass, eval   | :heavy_check_mark: template, macro
Manejo de Memoria    | Garbage collector                    | Estrategias de manejo de memoria multi-paradigma (garbage collectors o ARC o manual)
Tipado               | Dinamico                             | Estatico
Tipos Dependientes   | :negative_squared_cross_mark:        | :heavy_check_mark:
Genericos            | Duck typing                          | :heavy_check_mark:
Tipos int8/16/32/64  | :negative_squared_cross_mark:        | :heavy_check_mark:
Tipos float32/float64 | :negative_squared_cross_mark:       | :heavy_check_mark:
Tipo Char            | :negative_squared_cross_mark:        | :heavy_check_mark:
Tipo Subrange        | :negative_squared_cross_mark:        | :heavy_check_mark:
Tipo Enum            | :heavy_check_mark:                   | :heavy_check_mark:
Tipo Bigint          | :heavy_check_mark:                   | :heavy_check_mark:
Tipo Array           | :heavy_check_mark:                   | :heavy_check_mark:
Tipado con Inferencia | Duck typing                         | :heavy_check_mark:
Closures             | :heavy_check_mark:                   | :heavy_check_mark:
Sobrecarga de Operadores | :heavy_check_mark:               | :heavy_check_mark: en cualquier Tipo
Operadores Personalizados | :negative_squared_cross_mark:   | :heavy_check_mark:
Orientado a Objetos  | :heavy_check_mark:                   | :heavy_check_mark:
Metodos              | :heavy_check_mark:                   | :heavy_check_mark:
Excepciones           | :heavy_check_mark:                  | :heavy_check_mark:
Funciones Anonimas   | :heavy_check_mark: 1-linea solamente | :heavy_check_mark: multi-linea
Comprension de Lista  | :heavy_check_mark:                  | :heavy_check_mark:
Comprension de Diccionario | :heavy_check_mark:             | :heavy_check_mark:
Comprension de Set   | :heavy_check_mark:                   | :heavy_check_mark:
Comprension de Objetos Personalizados | :negative_squared_cross_mark:  | :heavy_check_mark:
Inmutabilidad        | Limitado (frozenset, tupla, etc)     | :heavy_check_mark:
Inmutabilidad de Argumentos de Funcion | Mutable            | Inmutable
String Literales Formateados | :heavy_check_mark: F-Strings | :heavy_check_mark: strformat
FFI                  | :heavy_check_mark: CTypes (solo C)   | :heavy_check_mark: C/C++/JS
Async                | :heavy_check_mark:                   | :heavy_check_mark:
Threads              | :heavy_check_mark: (Global Interpreter Lock) | :heavy_check_mark:
Regex                | :heavy_check_mark: No Perl-compatible | :heavy_check_mark: Perl Compatible Regular Expressions
Comentarios de Auto-Documentacion | :heavy_check_mark: Strings Texto-plano | :heavy_check_mark: ReStructuredText/Markdown
Publicacion de Paquetes | :heavy_check_mark: No integrado, requiere `twine` | :heavy_check_mark: Integrado, `nimble`
Manejador de Paquetes | :heavy_check_mark: `pip`            | :heavy_check_mark: `nimble`
AutoFormateador de Codigo | :heavy_check_mark: `black` via PIP   | :heavy_check_mark: `nimpretty` Integrado
Extensiones de Archivo | .py, .pyi, .pyd, .pyo, .pyw, .pyz, .pyx | .nim, .nims
Formato Temporario de Representacion Intermedia | .pyc | C
Usa SheBang en Archivos | :heavy_check_mark:                | :negative_squared_cross_mark:
Indentacion          | Tabuladores y Espacios               | Espacios


## Variables

Crear una nueva usa `var` o `let` o `const`.
Nim tiene inmutabilidad y ejecucion de funciones en tiempo de compilacion.
Podes asignar funciones a variables.

| Declaracion | Tiempo de Compilacion | Tiempo de Ejecucion | Inmutable | Requiere Asignacion | Auto-Inicializado |
|-------------|-----------------------|---------------------|-----------|---------------------|---------------------|
`var`         | :negative_squared_cross_mark: | :heavy_check_mark: | :negative_squared_cross_mark: |  :negative_squared_cross_mark: | :heavy_check_mark: |
`let`         | :negative_squared_cross_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
`const`       | :heavy_check_mark: | :negative_squared_cross_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |

[Para usuarios avanzados, es posible saltarse la Auto-Initializacion de variables.](https://nim-lang.github.io/Nim/manual.html#statements-and-expressions-var-statement)

Las variables pueden ser multi-linea sin "escaparlas", es util para lineas largas y operadores ternarios largos, ejemplo minimo:

```python
variable = 666 +  \
  420 *  \
  42 -   \
  9           

assert variable == 18297
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
var variable = 666 +
  420 *
  42 -
  9

assert variable == 18297
```

Funciona para las funciones tambien:
```nim
import strutils

var variable = "  12345  "
  .strip
  .parseInt

assert variable == 12345
```

Podes usar guion bajo (underscore), espacios y salto de linea en los nombres de variables:

```nim
let `this must  be
     positive`: Positive = 42

assert this_must_be_positive == 42

const `this is my nice named variable` = 42
```

[Podes usar nombres reservados como nombre de variable.](https://nim-lang.github.io/Nim/manual.html#lexical-analysis-stropping)

Si estas recien comenzando desde cero, podes usar `var` para todo cuando estas aprendiendo, no produce error por hacerlo.


## Consistent Spacing

Los espacios deben ser consistentes en el codigo, principalmente en operadores:

```nim
echo 2 - 1 # OK
echo 2-1   # OK
```

Espacios inconsistentes:
```nim
echo 2 -1 # Error
#      ^ es leido como "-1"
```

Omitir espacios en el codigo no mejora en nada.
Todos los operadores son funciones en Nim.


## Scoping

```python
for x in range(0, 9):
  if x == 6:
    print(x)

print(x)
```

Resultados:

```
6
8  # Leak!
```

:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:

```nim
for x in 0..9:
  if x == 6:
    echo x

echo x
```

Resultados:

```
Error: undeclared identifier: 'x'
```

Mas ejemplos:

```python
x = 0
y = 0

def example():
  x = 1
  y = 1
  class C:
    assert x == 0 and y == 1  # ???
    x = 2

example()
```

:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:

```nim
var x = 0
var y = 0

proc example() =
  var x = 1
  var y = 1
  type C = object
  assert x == 1 and y == 1
  x = 2

example()
```

Mas del mismo ejemplo:

```python
x = 0
y = 0

def example():
  x = 1
  y = 1
  class C:
    assert x == 0 and y == 0  # ???
    x = 2
    try:
      raise
    except Exception as y:
      pass

example()
```

:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:

```nim
var x = 0
var y = 0

proc example() =
  var x = 1
  var y = 1
  type C = object
  assert x == 1 and y == 1
  x = 2
  try:
    raise
  except Exception as y:
    discard

example()
```


## Mutable arguments

```python
def example(argument = [0]):
  argument.append(42)
  return argument

print(example())
print(example())
print(example())
```

Output:

```
[0, 42]
[0, 42, 42]
[0, 42, 42, 42]
```

:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:

```nim
func example(argument = @[0]): auto =
  argument.add 42
  return argument

echo example()
echo example()
echo example()
```

Output:

```
Error: type mismatch: got <seq[int], int literal(42)>

but expected one of: 
proc add[T](x: var seq[T]; y: sink T)
  first type mismatch at position: 1
  required type for x: var seq[T]
  but expression 'argument' is immutable, not 'var'
```


## Imports

Import                                | :snake: Python                  | :crown: Nim
--------------------------------------|---------------------------------|-----------------------------
Solo 1 simbolo, usar sin calificar    | `from math import sin`          | `from math import sin`
Todos los simbolos, usar sin calificar   | `from math import *`            | **`import math` (recomendado)**
Todos los simbolo, usar calificado    | **`import math` (recomendado)** | `from math import nil`
"import as" con otro nombre           | `import math as papota`         | `import math as papota`
Todos los simbolos excepto 1, usar sin calificar | :negative_squared_cross_mark:   | `import math except sin`
Todos los simbolos excepto 3, usar sin calificar | :negative_squared_cross_mark:   | `import math except sin, tan, PI`
Incluir otro modulo en este modulo          | :negative_squared_cross_mark:   | `include algunmodulo`

En Nim, ``import math`` importa todos los simbolos del modulo `math` (`sin()`, `cos()`, etc) entonces se pueden usar sin calificar. El equivalente en Python es ``from math import *``.

Si preferis no importar todos los simbolos, y usar los nombres calificados, en Nim es `from math import nil`. Entonces puedes llamar `math.sin()` etc. El equivalente en Python es ``import math``.

Las razon por la cual es seguro importar todos los nombres en Nim es que el compilador realmente no incluira ninguna funcion o nombre no usado (entonces no hay un costo extra),
y por que Nim es estaticamente tipado entonces puede distinguir entre dos funciones importadas con el mismo nombre basandose en los Tipos y argumentos de la funcion.
Y aun asi en casos muy raros donde los nombres y tipos y argumentos son todos iguales, puedes usar el nombre completo calificado para desambiguar.

Nim puede usar los imports en una misma linea.
De Python a Nim ejemplo *lo mas minimo posible*:
```python
import foo
import bar
import baz
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
import foo, bar, baz
```

Si tu linea queda demasiado larga, los import tambien pueden estar en un bloque indentado:

```nim
import
  foo, bar, baz, more, imports,
  here, we, split, multiple, lines

```

Si preferis 1 import por linea, por los Diff de Git, los import tambien pueden estar 1 por linea:

```nim
import
  foo,
  bar,
  baz

```

La forma con 1 `import` por linea es comun en in Python y Nim, pero en Nim la forma `import foo, bar, baz` es mas frecuente.

Mas ejemplos:

```nim
## Esto es documentacion del modulo.
#  Esto es un comentario.
include prelude
import sugar as stevia
from math import nil
from with as what import nil
```

Si estas recien comenzando desde cero, podes usar los import como en Python para todo cuando estas aprendiendo, no produce error por hacerlo.


### Programatically

```python
__import__("math")
```

:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:

```nim
template imports(s) = import s
imports math
```


### Code without imports

A veces veras ejemplos de codigo o archivos **sin** los imports pero funcionan igualmente (?).

Nim puede usar `import` desde la linea de comando de compilacion, o dese un archivo `.nims`:

- `nim c --import:sugar file.nim`
- `nim c --import:folder/mymodule file.nim`
- `nim js --import:strutils --include:mymodule file.nim`

Algunas veces los projectos o ejemplos de codigo usan esto para salvar tipear tanto.

Ver:
- [Nim Command line switches](https://nim-lang.github.io/Nim/nimc.html#compiler-usage-command-line-switches) 


### Prelude

Puede parecer que Python tiene mas simbolos disponibles por defecto sin ningun `import` comparado con Nim,
para tener una experiencia similar puedes usar
[prelude](https://nim-lang.github.io/Nim/prelude.html):

```nim
include prelude

echo now()
echo getCurrentDir()
echo "Hello $1".format("World")
```

[prelude](https://nim-lang.github.io/Nim/prelude.html) funciona para JavaScript tambien.


### Where Symbols come from?

- Si los simbolos son no calificados, como saber de donde vienen?

Si `foo()` es un simbolo:
- Python: Tipicamente tenes `object.foo()` en lugar de `module.foo()`, sin UFCS.
- Nim: Tipicamente tenes `foo()`, [con UFCS](https://en.wikipedia.org/wiki/Uniform_Function_Call_Syntax#Nim_programming_language).

Typicamente el [Editor/IDE](https://marketplace.visualstudio.com/items?itemName=kosz78.nim) 
debe mostrar de donde viene un simbolo, como cualquier otro lenguaje de programacion:

![](https://raw.githubusercontent.com/pragmagic/vscode-nim/master/images/nim_vscode_output_demo.gif)

Nim viene con [NimSuggest](https://nim-lang.org/docs/nimsuggest.html) para Editor/IDE.

Contrario a Python, el sistema de tipos de Nim tiene toda la info de los simbolos:

```nim
import macros
macro findSym(thing: typed) = echo thing.getType.lineInfo

findSym:
  echo  # De donde sale echo?.
```

`echo` viene de:
```
lib/system.nim(1929, 12)
```


#### Exports

En Python todos los simbolos en un modulo son visibles desde otro modulo que lo importa,
incluido simbolos "dunder" y cosas que no deberian ser mutadas desde afuera.

En Nim todo es privado por defecto y no es visible desde otro modulo que lo importa,
para hacer un simbolo Publico y visible desde afuera podes usar la Star `*`:

```nim
let variable* = 42
const constante* = 0.0
proc unaFuncion*() = discard
template unTemplate*() = discard
type Platipo* = object
  fufflyness*: int
```

Star hace el simbolo visible desde el mundo exterior,
hace el simbolo aparecer en la documentacion generada,
cuando importas el modulo el simbolo estara en el namespace,
pero los simbolos internos de detalles de implementacion sin `*` no son visibles,
y las cosas que no deberian ser mutadas desde afuera no seran visibles,
tiene el beneficio *visual* para humanos que es facil reconocer "la API Publica" de un modulo con solo ver el codigo.


Para entender mejor, es recomendado leer (en Ingles):
https://narimiran.github.io/2019/07/01/nim-import.html


## try: import

A veces en Python ves este tipo de construcciones:

```python
try:
  import modulo
except:  # ImportError
  pass   # Explota en run-time (?)

try:
  import modulo
except:  # ImportError
  def funcion(): # Ultimo recurso definicion de "emergencia" (duplicacion de codigo)
    return algunvalor
  # Mas codigo aca...

```

Nim resuelve todos los import en tiempo de compilacion, no hay `ImportError` en tiempo de ejecucion.

No hay necesidad de `try: import` en Nim.


## Arrays

Los Arrays son de capacidad fija, comienzan en indice `0` y contienen elementos del mismo Tipo.

Cuando pasas un array a una funcion en Nim, el argumento es una referencia inmutable.
Nim va agregar chequeos de limite de capacidad en tiempo de ejecucion en los array.

Podes usar `openarray` para aceptar un array de cualquier capacidad en argumentos de funcion,
y podes usar `low(el_array)` y `high(el_array)` para averiguar los limites de capacidad del array.

`string` es compatible con `openArray[char]` para omitir copias innecesarias por optimizacion,
`char` es compatible con `int`, entonces la manipulacion de `string` puede hacerse usando matematica transparentemente,
una funcion que toma `openArray[char]` acepta `"abcd"` *y* `['a', 'b', 'c', 'd']`.

Ver:
- [Views](https://nim-lang.github.io/Nim/manual_experimental.html#view-types)


## Objects

Los Objetos en Nim son un poco diferentes de classes en Python.
Los Objetos soportan herencia y Orientacion a Objetos. Classes son Tipos nombrados en Nim.
Las Funciones flotan sueltas libremente, no estan metidas dentro de los objetos
(igualmente, podes usarlas como en Python),
podes llamar a una funcion de objeto con `Objeto.funcion()`.
Nim no tiene un `self` o `this` implicito.

Imagina que **las funciones son "pegadas" a los objetos durante la compilacion**,
entonces podes usarlas en tiempo de ejecucion como si fueran classes y metodos de Python.

Objetos Python que internamente usan generacion de codigo son muy muy lentos,
`dataclass`, `metaclass`, Decoradores, etc pueden ser mas de 30x mas lentos que un `class` normal,
y derrota cualquier optimizacion, incluyendo un archivo `.pyc`,
Expansion de codigo en Nim es realizada en tiempo de compilacion, haciendolo costo cero en tiempo de ejecucion.


De Python a Nim ejemplo *lo mas minimo posible*:

```python
class Gatito(object):
    """ Documentacion Aca """

    def purr(self):
        print("Miau Miau")

Gatito().purr()
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
type Gatito = object  ## Documentacion Aca
proc purr(self: Gatito) = echo "Miau Miau"
Gatito().purr()
```

Ejemplo de Orientacion a Objetos estilo Python:

``` Nim
type Animal = ref object of RootObj ## Animal objeto base.
  edad: int
  nombre: string                    ## Atributos de objeto base.

type Gato = ref object of Animal    ## Gato heredado.
  jugueton: float                   ## Atributos de objeto heredado.

func incrementar_edad(self: Gato) =
  self.edad.inc()                   # Gato funcion de objeto, accede y *modifica* el objeto.

var gatito = Gato(nombre: "Tom")    # Gato instancia de objeto.
gatito.incrementar_edad()           # Gato funcion de objeto usado.

assert gatito.nombre == "Tom"       # Assert en objeto Gato.
assert gatito.edad == 1
```


## `self.__init__()`

Luego del ejemplo de Gato probablemente estas pensando como hacer un `def __init__(self, arg):`.

El `__init__()` de Python es el `newObject()` o `initObject()` de Nim, podemos hacer un `__init__()` para el Gato:

```nim
type Gato = object                # Gato objeto.
  edad: int
  nombre: string                  # Atributos de Gato.

func initGato(edad = 2): Gato =  # Gato.__init__(self, edad=2)
  result.edad = edad             # self.edad = edad
  result.nombre = "adoptame"     # self.nombre = "adoptame"

var gatito = initGato()          # Gato instancia de objeto.

assert gatito.nombre == "adoptame" # Assert en el Gato.
assert gatito.edad == 2
```

Los nombres son una convencion y mejores practicas,
cuando quieras un init para `Foo` simplemente hace `newFoo()` o `initFoo()`.
Como habras notado `initGato` es solo una funcion que retorna un `Gato`.

- `initFoo()` para `object`.
- `newFoo()` para `ref object`.

[Lee la documentation para Nombrar cosas siguiendo las mejores practicas.](https://nim-lang.org/docs/apis.html)


#### Object Attribute Default Values

El constructor de Objeto es tambien la forma de poner valores personalizados por defecto a los atributos de tus objetos:

```nim
type Cat = object
  age: int                 # AutoInicializado a 0
  name: string             # AutoInicializado a ""
  playfulness: float       # AutoInicializado a 0.0
  sleeping: bool           # AutoInicializado a false 
func initCat(): Cat =    
  result.age = 1           # Poner el valor a 1
  result.name = "Bastet"   # Poner el valor a "Bastet"
  result.playfulness = 9.0 # Poner el valor a 9.0
  result.sleeping = true   # Poner el valor a true
```


## Ranges

En Python, los bucles de enteros usan el `range`.
Para los usos de 1 y 2 argumentos de esta funcion,
El [`..` iterador](https://nim-lang.org/docs/system.html#...i%2CT%2CT) de Nim funciona igual:

``` Nim
for i in 0..10:
  echo i  # Muestra 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

for i in 5..10:
  echo i  # Muestra 5, 6, 7, 8, 9, 10
```

Nota que `..` incluye el final del rango (es inclusivo), donde en Python `range(a, b)` no incluye `b` (no inclusivo).
Si preferis la forma Python, usa el [`..<` iterador](https://nim-lang.org/docs/system.html#..%3C.i%2CT%2CT):

``` Nim
for i in 0..<10:
  echo i  # Muestra 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
```

El Python `range()` tambien tiene un tercer parametro opcional,
que es el valor de incrementacion de cada paso, que puede ser positivo o negativo.
Si necesitas este comportamiento, usa [`countup`](https://nim-lang.org/docs/system.html#countup.i%2CT%2CT%2CPositive) o
[`countdown`](https://nim-lang.org/docs/system.html#countdown.i%2CT%2CT%2CPositive):

``` Nim
for i in countup(1, 10, 2):
  echo i  # Muestra 1, 3, 5, 7, 9
```

Ver:
- [enumerate](https://nim-lang.github.io/Nim/enumerate.html#enumerate.m%2CForLoopStmt)


## Slices

La sintaxis de slice es un poco diferente. El `a[x:y]` de Python es `a[x..<y]` de Nim.

``` Nim
let variable = [1, 2, 3, 4]
assert variable[0..0] == @[1]
assert variable[0..1] == @[1, 2]
assert variable[0..<2] == @[1, 2]
assert variable[0..3] == @[1, 2, 3, 4]
```

#### Reverse Index Slices

En Nim los indices reversos usan `^` con el numero, por ejemplo `^1`,
los indices reversos tiene un Tipo especifico `BackwardsIndex`,
y tambien pueden ser "preparados" en tiempo de compilacion como un `const`:

```nim
const ultimo = ^1  # Compile-time
assert ultimo is BackwardsIndex
assert [1, 2, 3, 4, 5][2 .. ultimo] == @[3, 4, 5]
assert [1, 2, 3, 4, 5][2 .. ^1] == @[3, 4, 5]
var otro = ^3    # Run-time
assert [1, 2, 3, 4, 5][0 .. otro] == @[1, 2, 3]
assert [1, 2, 3, 4, 5][^3 .. ^1] == @[3, 4, 5]
```


## Static Bounds Check

- Nim tiene [chequeos de capacidad estaticos en tiempo de compilacion.](https://en.wikipedia.org/wiki/Static_program_analysis)

Comparemos unos ejemplos simplificados:

```python
[0, 1, 2][9]  # No existe el Indice 9
```

Explota en tiempo de ejecucion por que no existe el indice 9:

```console
$ python3 ejemplo.py
Traceback (most recent call last):
  File "ejemplo.py", line 1, in <module>
    [0, 1, 2][9]
IndexError: list index out of range

$
```

Veamos que hace Nim:

```nim
discard [0, 1, 2][9]  # No existe el Indice 9
```

Compilar y ejecutar:

```console
$ nim compile --run ejemplo.nim
ejemplo.nim(1, 19) Warning: can prove: 9 > 2  [IndexCheck]
ejemplo.nim(1, 18) Error: index 9 not in 0..2 [0, 1, 2][9]

$
```

Nim chequea en tiempo de compilacion que `[0, 1, 2]` no tiene indice `9`, por que `9 > 2`, no compila ni ejecuta.

Esto tambien funciona con Subrange, digamos que tenes una variable con un numero entero que **debe ser positivo**:

```nim
let debe_ser_positivo: Positive = -9
```

Compilar y ejecutar:

```console
$ nim compile --run ejemplo.nim
ejemplo.nim(1, 34) Warning: can prove: 1 > -9 [IndexCheck]
ejemplo.nim(1, 34) Error: conversion from int literal -9 to Positive is invalid.

$
```

Nim chequea en tiempo de compilacion que `debe_ser_positivo` no es `Positive` por que `1 > -9`, no compila ni ejecuta.

Podes controlar esto con `--staticBoundChecks:on` o `--staticBoundChecks:off`.

Con `--staticBoundChecks:off` puede lanzar error en tiempo de ejecucion como en Python.

- Para una mejor documentacion ver: https://nim-lang.github.io/Nim/drnim.html


# Null Coalescing

Python no tiene un [Null Coalescing Operator](https://en.wikipedia.org/wiki/Null_coalescing_operator) (al tiempo de escribir).

Python usa este tipo de construcciones:

```python
otro = bar if bar is not None else "valor por defecto"  # "bar" puede ser Null?, o no ?.
```

Nim tiene el  [modulo wrapnils](https://nim-lang.github.io/Nim/wrapnils.html) con el Null Coalescing Operator `?.`,
que simplifica el codigo reduciendo la necesidad de ramas de `if..elif...else` en **valores intermedios que pueden ser Null**.

```nim
assert ?.foo.bar.baz == ""  # "bar" puede ser Null?, o no ?.
```

Null es `None` en Python. Null es `nil` en Nim.

Ver https://nim-lang.github.io/Nim/wrapnils.html


## With Context Manager

Para un "With Context Manager" (Manejador de Contextos) en Nim tenes las siguientes opciones:

- https://nim-lang.github.io/Nim/with.html
- [`template`](#templates)
- [`macros`](https://nim-lang.github.io/Nim/manual.html#macros)
- [`block:`](https://nim-lang.github.io/Nim/manual.html#statements-and-expressions-block-statement)


## Strings

| Lenguaje                  | String  | Multi-line string | Raw String  | Multi-line Raw string | Formatted Literals | Quote   |
|---------------------------|---------|-------------------|-------------|-----------------------|--------------------|---------|
| :snake: Python            | `"foo"` | `"""foo"""`       | `r"foo"`    | `r"""foo"""`          | `f"""{1 + 2}"""`   | `"` `'` |
| :crown: Nim               | `"foo"` | `"""foo"""`       | `r"foo"`    | `r"""foo"""`          | `fmt"""{1 + 2}"""` | `"`     |


#### String Ops

| Ops   | :snake: Python   | :crown: Nim             |
|-------|------------------|-------------------------|
| Minuscula | `"ABCD".lower()` | `"ABCD".toLowerAscii()` |
| Desnudar | `" ab ".strip()` | `" ab ".strip()`        |
| Dividir | `"a,b,c".split(",")` | `"a,b,c".split(",")` |
| Concatenacion | `"a" + "b"` | `"a" & "b"` |
| Buscar   | `"abcd".find("c")` | `"abcd".find("c")` |
| Comienza Con | `"abc".startswith("ab")` | `"abc".startswith("ab")` |
| Termina Con | `"abc".endswith("ab")` | `"abc".endswith("ab")` |
| Dividir Lineas | `"1\n2\n3".splitlines()` | `"1\n2\n3".splitlines()` |
| Partir | `"abcd"[0:2]` | `"abcd"[0..<2]` |
| Partir 1 char | `"abcd"[2]` | `"abcd"[2]`  |
| Partir Revertido | `"abcd"[-1]` |  `"abcd"[^1]` |
| Normalizar | [`unicodedata.normalize("NFC", "Foo")`](https://docs.python.org/3/library/unicodedata.html#unicodedata.normalize "str().lower() is not the recommended way") | `"Foo".normalize()`
| Contar Lineas | `len("1\n2\n3".splitlines())` | `"1\n2\n3".countLines()` |
| Repetir | `"foo" * 9` | `"foo".repeat(9)` |
| Indentar | `textwrap.indent("foo", " " * 9)` | `"a".indent(9)` |
| Desindentar | [`textwrap.dedent("foo")`](https://docs.python.org/3/library/textwrap.html#textwrap.dedent "textwrap.dedent() Removes ALL indentation!") :question: | `"foo".unindent(9)` |
| Parsear Booleano | [`bool(distutils.util.strtobool("fALse"))`](https://stackoverflow.com/q/715417 "bool('fALse') == True") :question: | `parseBool("fALse")` |
| Parsear Entero | `int("42")` | `parseInt("42")` |
| Parsear Flotante | `float("3.14")` | `parseFloat("3.14")` |
| String Literal Formateado | `f"foo {1 + 2} bar {variable}"` | [`fmt"foo {1 + 2} bar {variable}"`](https://nim-lang.org/docs/strformat.html) |
| Distancia de Levenshtein | :negative_squared_cross_mark: | [`editDistance("Kitten", "Bitten")`](https://nim-lang.org/docs/editdistance.html) |

- **Las operaciones de string de Nim requieren [`import strutils`.](https://nim-lang.org/docs/strutils.html)**
- [Comparacion detallada.](https://scripter.co/notes/string-functions-nim-vs-python/)


#### String Efficiency

Strings con 1 sola alocacion de memoria son posibles con `newStringOfCap(capacity = 42)`,
que retorna 1 nuevo string vacio `""` pero con capacidad alocada de `42`,
pero si pasas mas alla de esa `capacity` no va a dar error (buffer overflow):

```python
variable = ""
assert variable == "" # longitud 0, capacidad 0, 1 alloc, 0 copias
variable += "a"       # longitud 1, capacidad is 1, 2 alloc, 1 copias
variable += "b"       # longitud 2, capacidad is 2, 3 alloc, 2 copias
variable += "c"       # longitud 3, capacidad is 3, 4 alloc, 3 copias
variable += "d"       # longitud 4, capacidad is 4, 5 alloc, 4 copias
assert variable == "abcd" 
# TOTAL: 5 alloc, 4 copias
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
var variable = newStringOfCap(2)
assert variable == "" # longitud 0, capacidad is 2, 1 alloc, 0 copias
variable.add "a"      # longitud 1, capacidad is 2, 1 alloc, 0 copias
variable.add "b"      # longitud 2, capacidad is 2, 1 alloc, 0 copias
variable.add "c"      # longitud 3, capacidad is 3, 2 alloc, 0 copias
variable.add "d"      # longitud 4, capacidad is 4, 3 alloc, 0 copias
assert variable == "abcd" 
# TOTAL: 3 alloc, 0 copias
```

Esta diferencia es mas grande para strings adento de bucles for o while.


### F-Strings

Nim `strformat` implementa string literales formateados inspirados de Python F-string.
`strformat` es implementado usando metaprogramming y la expansion de codigo es en tiempo de compilacion.
Funciona para JavaScript tambien.

Similar a Python F-string se puede
[debugear usando el simbolo igual](https://nim-lang.github.io/Nim/strformat.html#debugging-strings),
`fmt"{key=}"` expande a `fmt"key={value}"`:

```nim
let x = "hello"
assert fmt"{x=}" == "x=hello"
assert fmt"{x   =  }" == "x   =  hello"
```

Nim `strformat` soporta Backslash, pero Python F-string no:

```python
>>> print( f"""{ "yep\nope" }""" ) # Run-time error.
Error: f-string expression part cannot include a backslash.
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
echo fmt"""{ "yep\nope" }"""       # Nim works.

yep
ope
```

Se puede elejir los caracteres delimitadores:

```nim
import strformat
let variable = 42
assert fmt("( variable ) { variable }", '(', ')') == "42 { variable }"
assert fmt("< variable > { variable }", '<', '>') == "42 { variable }"
```

Caracteres Backtick y Space `' '` tambien funciona:

```nim
import strformat
let variable = 42
assert fmt(" variable`{variable}", ' ', '`') == "42{variable}"
```

Ver:
- [`strformat`.](https://nim-lang.github.io/Nim/strformat.html)


## Standard Library Equivalents

Uso                          | :snake: Python   | :crown: Nim
-----------------------------|------------------|------------------------------
Sistema Operativo            | os               | [os](https://nim-lang.org/docs/os.html)
Operaciones String           | string           | [strutils](https://nim-lang.org/docs/strutils.html)
Fecha y Hora                 | datetime         | [times](https://nim-lang.org/docs/times.html)
Cosas Al Azar                | random           | [random](https://nim-lang.org/docs/random.html)
Expresiones Regulares        | re               | [re](https://nim-lang.org/docs/re.html)
HTTP                         | urllib           | [httpclient](https://nim-lang.org/docs/httpclient.html)
Logs                         | logging          | [logging](https://nim-lang.org/docs/logging.html)
Ejecutar comandos            | subprocess       | [osproc](https://nim-lang.org/docs/osproc.html)
Manipulacion de ruta         | pathlib, os.path | [os](https://nim-lang.org/docs/os.html)
Matematica                   | math, cmath      | [math](https://nim-lang.org/docs/math.html)
Tipos MIME                   | mimetypes        | [mimetypes](https://nim-lang.org/docs/mimetypes.html)
SQLite SQL                   | sqlite3          | [db_sqlite](https://nim-lang.org/docs/db_sqlite.html)
Postgres SQL                 | :negative_squared_cross_mark: | [db_postgres](https://nim-lang.org/docs/db_postgres.html)
Serializacion                | pickle           | [json](https://nim-lang.org/docs/json.html), [marshal](https://nim-lang.org/docs/marshal.html)
Base64                       | base64           | [base64](https://nim-lang.org/docs/base64.html)
Abrir URL en web browser     | webbrowser       | [browsers](https://nim-lang.org/docs/browsers.html)
Async                        | asyncio          | [asyncdispatch](https://nim-lang.org/docs/asyncdispatch.html), [asyncfile](https://nim-lang.org/docs/asyncfile.html), [asyncnet](https://nim-lang.org/docs/asyncnet.html), [asyncstreams](https://nim-lang.org/docs/asyncstreams.html)
Unittests                    | unittests        | [unittest](https://nim-lang.org/docs/unittest.html)
Diff                         | difflib          | [diff](https://nim-lang.org/docs/diff.html)
Colores                      | colorsys         | [colors](https://nim-lang.org/docs/colors.html)
MD5                          | hashlib.md5      | [md5](https://nim-lang.org/docs/md5.html)
SHA1                         | hashlib.sha1     | [sha1](https://nim-lang.org/docs/sha1.html)
Servidor HTTP                | http.server      | [asynchttpserver](https://nim-lang.org/docs/asynchttpserver.html)
Lexer                        | shlex            | [lexbase](https://nim-lang.org/docs/lexbase.html)
Multi-Hilos                  | threading        | [threadpool](https://nim-lang.org/docs/threadpool.html)
URL & URI                    | urllib.parse     | [uri](https://nim-lang.org/docs/uri.html)
CSV                          | csv              | [parsecsv](https://nim-lang.org/docs/parsecsv.html)
Argumentos de linea de comando | argparse         | [parseopt](https://nim-lang.org/docs/parseopt.html)
SMTP                         | smtplib          | [smtp](https://nim-lang.org/docs/smtp.html)
Galletitas de HTTP           | http.cookies     | [cookies](https://nim-lang.org/docs/cookies.html)
Estadisticas                 | statistics       | [stats](https://nim-lang.org/docs/stats.html)
Recorte de Texto             | textwrap         | [wordwrap](https://nim-lang.org/docs/wordwrap.html)
Registro de Windows          | winreg           | [registry](https://nim-lang.org/docs/registry.html)
POSIX                        | posix            | [posix](https://nim-lang.org/docs/posix.html), [posix_utils](https://nim-lang.org/docs/posix_utils.html)
SSL                          | ssl              | [openssl](https://nim-lang.org/docs/openssl.html)
CGI                          | cgi              | [cgi](https://nim-lang.org/docs/cgi.html)
Parsear JSON                 | json             | [parsejson](https://nim-lang.org/docs/parsejson.html), [json](https://nim-lang.org/docs/json.html)
Parsear INI                  | configparser     | [parsecfg](https://nim-lang.org/docs/parsecfg.html)
Parsear XML                  | xml              | [parsexml](https://nim-lang.org/docs/parsexml.html), [xmltree](https://nim-lang.org/docs/xmltree.html)
Parsear HTML                 | html.parser      | [htmlparser](https://nim-lang.org/docs/htmlparser.html)
Parsear SQL                  | :negative_squared_cross_mark: | [parsesql](https://nim-lang.org/docs/parsesql.html)
Colores en la Terminal       | :negative_squared_cross_mark: | [terminal](https://nim-lang.org/docs/terminal.html)
Detectar Distro Linux        | :negative_squared_cross_mark: | [distros](https://nim-lang.org/docs/distros.html)
Generador HTML               | :negative_squared_cross_mark: | [htmlgen](https://nim-lang.org/docs/htmlgen.html)
Azucares de Sintaxis         | :negative_squared_cross_mark: | [sugar](https://nim-lang.org/docs/sugar.html)
JavaScript & Frontend        | :negative_squared_cross_mark: | [dom](https://nim-lang.org/docs/dom.html), [asyncjs](https://nim-lang.org/docs/asyncjs.html), [jscore](https://nim-lang.org/docs/jscore.html), [jsffi](https://nim-lang.org/docs/jsffi.html)

- No es una lista completa solo un repaso rapido. Para mas info ver https://nim-lang.org/docs/lib.html


## Tuples

Tuplas son capacidad fija, comienzan en index `0`, pueden contener tipos mixtos,
pueden ser anonimas o nombrada, named tuple no tiene costo extra sobre anonymous tuple.

#### Anonymous Tuple

```python
(1, 2, 3)
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
(1, 2, 3)
```

#### Named Tuple

- Keys con nombre, Tupla sin nombre. Python NamedTuple requiere `import collections`.

```python
collections.namedtuple("_", "key0 key1")("foo", 42)
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
(key0: "foo", key1: 42)
```

#### Named Tuple

- Keys con nombre, Tupla con nombre. Python NamedTuple requiere `import collections`.

```python
collections.namedtuple("NameHere", "key0 key1")("foo", 42)
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
type NameHere = tuple[key0: string, key1: int]
var variable: NameHere = (key0: "foo", key1: 42)
```

Tuplas Nim son similares a las Python NamedTuple.

Ver [manual](http://nim-lang.org/docs/manual.html#types-tuples-and-object-types) para mas acerca de tuplas.


## Lists

[Nim sequencias](http://nim-lang.org/docs/tut1.html#advanced-types-sequences) *no* son de capacidad fija,
pueden crecer y achicarse, comienzan en indice `0` y pueden contener elementos del mismo Tipo.

```python
["foo", "bar", "baz"]
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
@["foo", "bar", "baz"]
```


## List Comprehensions

```python
variable = [item for item in (-9, 1, 42, 0, -1, 9)]
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
let variable = collect(newSeq):
  for item in @[-9, 1, 42, 0, -1, 9]: item
```

La Comprension puede ser asignada a `const` tambien, y correra en tiempo de compilacion.

La comprehension es implementada con `macro` que es expandido en tiempo de compilacion,
podes ver la expansion de codigo usando la opcion de compilador `--expandMacro` en la terminal:

```nim
let variable =
  var collectResult = newSeq(Natural(0))
  for item in items(@[-9, 1, 42, 0, -1, 9]):
    add(collectResult, item)
  collectResult

```

Comprehension puede ser anidada, multi-linea, multi-expresion, costo cero:

```nim
import sugar

let values = collect(newSeq):
  for val in [1, 2]:
    collect(newSeq):
      for val2 in [3, 4]:
        if (val, val2) != (1, 2):
          (val, val2)
        
assert values == @[@[(1, 3), (1, 4)], @[(2, 3), (2, 4)]]
```

One-liner:

```python
print([i for i in range(0, 9)])
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
echo(block: collect newSeq: (for i in 0..9: i))
```

Python Comprehension convierte el codigo en un Generator,
pero Nim Comprehension no convierte el codigo en un Iterator:

```nim
import sugar

func example() =
  discard collect(newSeq):
    for item in @[-9, 1, 42, 0, -1, 9]: 
      if item == 0: return
      item

example()
```
:arrow_up: Nim :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Python :arrow_down:
```python
def example():
  [item for item in [-9, 1, 42, 0, -1, 9] if item == 0: return]
      
example()
```

Python se queja:
```
SyntaxError: invalid syntax.
```

Codigo que no funciona en Python funcionara en Nim, cosas como `return`, etc
por que el codigo es silenciosamente convertido a un Generador por Python, pero es expandido a codigo normal por Nim.

- Que es `collect()`?.

`collect()` toma de argumento lo que sea que tu Tipo de retorno usa como constructor.

## Dict Comprehensions

```python
variable = {key: value for key, value in enumerate((-9, 1, 42, 0, -1, 9))}
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
let variable = collect(initTable(4)):
  for key, value in @[-9, 1, 42, 0, -1, 9]: {key: value}
```

- `collect()` requiere [`import sugar`.](https://nim-lang.github.io/Nim/sugar.html#collect.m%2Cuntyped%2Cuntyped)


## Set Comprehensions

```python
variable = {item for item in (-9, 1, 42, 0, -1, 9)}
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
let variable = collect(initHashSet):
  for item in @[-9, 1, 42, 0, -1, 9]: {item}
```

- `collect()` requiere [`import sugar`.](https://nim-lang.github.io/Nim/sugar.html#collect.m%2Cuntyped%2Cuntyped)


## Sets


| Lenguaje                  | Set        | Set Ordenado                  | Bitset                        | [Bit Fields](https://en.wikipedia.org/wiki/Bit_field) | Imports       |
|---------------------------|------------|-------------------------------|-------------------------------|---------------|---------------|
:snake: Python              | `set()`    | :negative_squared_cross_mark: | :negative_squared_cross_mark: | :negative_squared_cross_mark: |               | 
:crown: Nim                 | [`HashSet()`](https://nim-lang.github.io/Nim/sets.html#HashSet) | [`OrderedSet()`](https://nim-lang.github.io/Nim/sets.html#OrderedSet)       | [`set`](http://nim-lang.org/docs/manual.html#types-set-type) | [Bit Fields](https://nim-lang.org/docs/manual.html#set-type-bit-fields) | `import sets` |

- **Python Set puede ser reemplazado con [HashSet](http://nim-lang.org/docs/sets.html).**

Python Set no es igual a [Nim Set](http://nim-lang.org/docs/manual.html#types-set-type),
el Set "por defecto" es un [Bitset](https://en.wikipedia.org/wiki/Bitset), 
que por cada posible valor contenido en el set,
guarda 1 Bit indicando si el valor esta presente,
entonces deberias usarlo para valores finitos limitados a un rango de posibles valores,
si los valores posibles son conocidos en tiempo de compilacion, podes crear un `Enum` para los valores.

El numero entero mas grande que entra en un Set por defecto es `65535` equivalente a `high(uint16)`.

Podes usar valores mas grandes usando un Subrange, si no necesitas valores mas chicos,
un ejemplo stresando un set para poner `2_147_483_647` equivalente a `high(int32)` en un set en tiempo de compilacion:

```nim
const x = {range[2147483640..2147483647](2147483647)}
assert x is set  # Equals to {2147483647}
```

Los Set de Python no son iguales a los [Set de Nim](http://nim-lang.org/docs/manual.html#types-set-type).
Se debe saber el tipo de los valores que van en el Set y deben ser finitos.
Podes imitar el Set de Python usando un [HashSet](http://nim-lang.org/docs/sets.html).
El Set de Nim es mas rapido y es muy eficiente en memoria.
De hecho, el Set de Nim esta implementado con un Bit Vector,
y HashSet esta implementado como dicionario.
Para simples Tipos bandera y sets matematicos, usa Set.

- Ver [HashSet](http://nim-lang.org/docs/sets.html).


## Dictionaries

[Tablas](http://nim-lang.org/docs/tables.html) son como los diccionarios Python.

| Lenguaje                  | Diccionario | Diccionario Ordenado       | Contador       | Import               |
|---------------------------|------------|-----------------------------|----------------|----------------------|
:snake: Python              | `dict()`   | `OrderedDict()`             | `Counter()`    | `import collections` |
:crown: Nim                 | [`Table()`](https://nim-lang.org/docs/tables.html#basic-usage-table) |  [`OrderedTable()`](https://nim-lang.org/docs/tables.html#basic-usage-orderedtable) | [`CountTable()`](https://nim-lang.org/docs/tables.html#basic-usage-counttable) | `import tables`      |

#### Table Constructors

```python
dict(clave="valor", otro="cosas")
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
to_table({"clave": "valor", "otro": "cosas"})
```

#### Ordered Dictionary
```python
collections.OrderedDict([(8, "hp"), (4, "laser"), (9, "motor")])
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
to_ordered_table({8: "hp", 4: "laser", 9: "motor"})
```

#### Counters
```python
collections.Counter(["a", "b", "c", "a", "b", "b"])
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
to_count_table("abcabb")
```

**Examples:**
``` Nim
import tables

var diccionario = to_table({"hola": 1, "ahi": 2})

assert diccionario["hola"] == 1
diccionario["hola"] = 42
assert diccionario["hola"] == 42

assert len(diccionario) == 2
assert diccionario.has_key("hola")

for clave, valor in diccionario:
  echo clave, valor
```

Tablas son solamente azucar (syntax sugar) sobre un array de tuplas:

```nim
assert {"key": "value", "k": "v"} == [("key", "value"), ("k", "v")]
assert {"key": true, "k": false} == @[("key", true),  ("k", false)]
```

#### B-Tree Tables

[B-Tree Table](https://nim-lang.github.io/Nim/btreetables.html) usando la misma API.

Ver:
- [Que es B-Tree ? (Wikipedia).](https://en.wikipedia.org/wiki/B-tree)
- [Que es B-Tree ? (Video).](https://youtu.be/coRJrcIYbF4)


### Ternary operators

```python
"resultado0" if condicional else "resultado1"
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
if condicional: "resultado0" else: "resultado1"
```

Como habras notado el *Operador Ternario* es simplemente un `if..else` en-linea.


## Reading and writing files

**Leer archivos linea por linea**
```python
with open("elarchivo.txt", "r") as f:
    for line in f:
        print(line)

```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
for linea in lines("elarchivo.txt"):
  echo linea
```

- Documentacion de `lines()` https://nim-lang.org/docs/io.html#lines.i%2Cstring

**Leer y escribir archivos:**

```nim
write_file("elarchivo.txt", "esto simula datos")
assert read_file("elarchivo.txt") == "esto simula datos"
```

**Leer archivos en tiempo de compilacion:**
```nim
const constante = static_read("elarchivo.txt")  # Retorna un string en tiempo de compilacion
```


## Change File Permissions

Cambiar permisos a archivos.

```python
import os
os.chmod("file.txt", 0o777)
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
import filepermissions
chmod "file.txt", 0o777
```

Ejemplo asume que un archivo llamado `"file.txt"` existe.
[Usa permisos tipo Unix (Octal Unix permissions).](https://en.wikipedia.org/wiki/File-system_permissions#Notation_of_traditional_Unix_permissions)

Ver https://nim-lang.github.io/fusion/src/fusion/filepermissions.html


## Temporarily Change Folder

Cambiar de carpeta temporalmente, y volver.

```python
import os

class withDir:
    # Unsafe without a __del__()

    def __init__(self, newPath):
        self.newPath = os.path.expanduser(newPath)

    def __enter__(self):
        self.savedPath = os.getcwd()
        os.chdir(self.newPath)

    def __exit__(self, etype, value, traceback):
        os.chdir(self.savedPath)


with withDir("subcarpeta"):
  print("Adentro de subcarpeta")
print("Volver fuera de subcarpeta")
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
import scripting

withDir "subcarpeta":
  echo "Adentro de subcarpeta"
echo "Volver fuera de subcarpeta"
```

Ver https://nim-lang.github.io/fusion/src/fusion/scripting.html


## Map & Filter

```python
def isPositive(arg: int) -> bool:
  return arg > 0

map(isPositive, [1, 2,-3, 5, -9])
filter(isPositive, [1, 2,-3, 5, -9])
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
proc esPositivo(arg: int): bool =
  return arg > 0

echo map([1, 2,-3, 5, -9], esPositivo)
echo filter([1, 2,-3, 5, -9], esPositivo)
```

- Map y Filter requiere [`import sequtils`.](https://nim-lang.org/docs/sequtils.html)


## Lambdas

```python
variable: typing.Callable[[int, int], int] = lambda var1, var2: var1 + var2
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
var variable = proc (var1, var2: int): int = var1 + var2
```

Multi-linea:

```nim
var anon = func (x: int): bool =
             if x > 0:
               result = true
             else: 
               result = false

assert anon(9)
```

[Funciones Anonimas en Nim](https://nim-lang.org/docs/manual.html#procedures-anonymous-procs)
es basicamente una funcion sin nombre.


## Decorators

- Templates y Macros pueden ser usados como Decoradores Python.

```python
def decorator(argument):
  print("This is a Decorator")
  return argument

@decorator
def function_with_decorator() -> int:
  return 42

print(function_with_decorator())

```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
template decorador(argumento: untyped) =
  echo "Esto imita un Decorador"
  argumento

func funcion_con_decorador(): int {.decorador.} =
  return 42

echo funcion_con_decorador()
```

- Por que Nim no usa `@decorator`?.

Nim usa `{.` y `.}` por que puede tener muchisimos decoradores juntos.

Ademas los de Nim funcionan en variables y Tipos:

```nim
func funcion_con_decorador(): int {.discardable, inline, compiletime.} =
  return 42

let variable {.compiletime.} = 1000 / 2

type Colores {.pure.} = enum Rojo, Verde, Azul
```


## JSON

Python usa strings multi-linea con JSON adentro, Nim usa JSON literal directamente en el codigo.

```python
import json

variable = """{
    "key": "value",
    "other": true
}"""
variable = json.loads(variable)
print(variable)
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
import json

var variable = %*{
  "key": "value",
  "other": true
}
echo variable
```

- `%*` convertira todo dentro de los corchetes a JSON, JSON es de Tipo `JsonNode`.
- `%*` puede tener variables y literales adentro.
- JSON puede tener comentarios adentro de `%*`, comentarios de Nim.
- Si el JSON no es JSON valido el codigo no compila.
- `JsonNode` puede ser muy util en Nim por que es un Tipo que puede tener Tipos mezclados y crecer/achicarse.
- Podes leer JSON en tiempo de compilacion, y guardarlo en una constante.
- Para parsear JSON desde string usa `parseJson("{}")`.
- Para parsear JSON desde archivo usa `parseFile("file.json")`.
- [Documentacion de JSON](https://nim-lang.org/docs/json.html)


## Self-Execution of Main Module

```python
if __name__ == "__main__":
  main()
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
when is_main_module:
  main()
```


## Unittests

```python
import unittest

def setUpModule():
    """Setup: Ejecuta una sola vez antes de todos los tests."""
    pass

def tearDownModule():
    """Teardown: Ejecuta una sola vez despues de todos los tests."""
    pass


class TestName(unittest.TestCase):

    """Nombre del Test"""

    def setUp(self):
        """Setup: Ejecuta una sola vez antes de cada test."""
        pass

    def tearDown(self):
        """Teardown: Ejecuta una sola vez despues de cada test."""
        pass

    def test_ejemplo(self):
        self.assertEqual(42, 42)


if __name__ == "__main__":
    unittest.main()

```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
import unittest

suite "Nombre del Test":

  echo "Setup: Ejecuta una sola vez antes de todos los tests."

  setup:
    echo "Setup: Ejecuta una sola vez antes de cada test."

  teardown:
    echo "Teardown: Ejecuta una sola vez despues de cada test."

  test "ejemplo":
    assert 42 == 42

  echo "Teardown: Ejecuta una sola vez despues de todos los tests."
```

- [Documentacion de Unittest.](https://nim-lang.org/docs/unittest.html)
- [Nimble el manejador de paquetes puede tambien ejecutar Unittests.](https://github.com/nim-lang/nimble#nimble-tasks)
- [NimScript puede tambien ejecutar Unittests.](https://nim-lang.org/docs/nims.html)
- [Podes ejecutar la documentation como si fueran Unittests con `runnableExamples`](https://nim-lang.org/docs/system.html#runnableExamples%2Cuntyped).

#### Assert with customized messages

- `assert` puede tomar como argumento un `block`, podes personalizar el mensaje para una mejor experiencia de usuario:

```nim
let a = 42
let b = 666
doAssert a == b, block:
  ("\nCustom Error Message!:" &
   "\n  a equals to " & $a &
   "\n  b equals to " & $b)
```


### Testament

Alternativa a `unittest`, preparado para proyectos grandes.

- https://nim-lang.github.io/Nim/testament.html **(Recomendado)**


## DocStrings

DocStrings en Nim son comentarios en ReSTructuredText *y* MarkDown comenzando con `##`,
ReSTructuredText y MarkDown pueden estar mezclados juntos si queres.

Genera HTML, Latex (PDF) y JSON desde el codigo fuente Nim con `nim doc archivo.nim`.

Nim puede generar un grafico de dependencias internas DOT `.dot` con `nim genDepend archivo.nim`.

[Podes ejecutar la documentation como si fueran Unittests con `runnableExamples`](https://nim-lang.org/docs/system.html#runnableExamples%2Cuntyped).

```python
""" Documentation of Module """

class Kitten(object):
    """ Documentation of Class """
    age: int

    def purr(self):
        """ Documentation of function """
        print("Purr Purr")
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
## Documentacion del Modulo *ReSTructuredText* y **MarkDown**

type Gatito = object ## Documentacion del Tipo *ReSTructuredText* y **MarkDown**
  edad: int  ## Documentacion del Atributo *ReSTructuredText* y **MarkDown**

proc purr(self: Gatito) =
  ## Documentacion de Funcion *ReSTructuredText* y **MarkDown**
  echo "Miau Miau"
```


## Optional Indentation

Para lineas cortas, podes escribir el codigo en una sola linea.

```nim
let a = try: 1 + 2 except: 42 finally: echo "Inline Try"

let b = if true: 2 / 4 elif false: 4 * 2 else: 0

for i in 0..9: echo i

proc foo() = echo "Funcion"

(proc   () = echo "Funcion Anonima")()

template bar() = echo "Template"

macro baz() = echo "Macro"

var i = 0
while i < 9: i += 1

when is_main_module: echo 42
```


## CamelCase

- Por que Nim es CamelCase en vez de snake_case?.

Realmente no es, Nim es Agnostico de Estilos.

```nim
let camelCase = 42      # Declara como camelCase
assert camel_case == 42 # Usa como snake_case

let snake_case = 1      # Declara como snake_case
assert snakeCase == 1   # Usa como camelCase

let `free style` = 9000
assert free_style == 9000
```

**Esta caracteristica le permite a Nim interoperar transparentemente con muchisimos lenguajes de programacion con diferentes estilos.**

Para un codigo mas homogeneo existe una forma por defecto, y puedes inclusive forzarla si quieres,
para forzar la forma por defecto en el estilo de codigo puedes agregar al comando de compilacion `--styleCheck:hint`,
Nim va a *chequear estilos* para tu codigo antes de compilar, similar a `pycodestyle` o `black` de Python,
si quieres aun mas estricto usa `--styleCheck:error`.
Nim viene con un auto-formateador de codigo llamado Nimpretty.

Muchos lenguajes de programacion tienen algun tipo de Case Insensitivity, como:
PowerShell, SQL, PHP, Lisp, Assembly, Batch, ABAP, Ada, Visual Basic, VB.NET, Fortran, Pascal, Forth, Cobol, Scheme, Red, Rebol.

Si estas recien comenzando desde cero, podes usar los estilos como en Python para todo, no produce error por hacerlo.


## def Vs proc/func

- Por que Nim no usa `def` en vez de `proc`?.

Nim usa `proc` para funciones del nombre "Procedimiento" (Procedure).

Usa `func` para [Programacion Funcional](https://en.wikipedia.org/wiki/Functional_programming) [Libre de side-effects](https://en.wikipedia.org/wiki/Side_effect_(computer_science)) funciones de "funcion matematica".

[Nim tiene seguimiento de side-effects.](https://nim-lang.github.io/Nim/manual.html#procedures-func)

No se puede usar `echo` dentro de `func`, por que `echo` muta `stdout`, es un Side-Effect, usa `debugEcho`.

Si estas recien comenzando desde cero, podes usar `proc` para todo, no produce error por hacerlo.


# Async

Nim tiene Async integrado desde hace mucho tiempo, funciona como esperas con `async`, `await`, `Future`, etc.

[asyncdispatch](https://nim-lang.org/docs/asyncdispatch.html) es el modulo para escribir codigo concurrente usando sintaxis `async`/`await`.

`Future` es un Tipo (como Future en Python, como Promise en JavaScript).

`{.async.}` es el Pragma que transforma funciones a Async (como `async def` en Python).

Hagamos el *Hola Mundo* official de Python Asyncio en Nim:

```python
async def main():
    print("Hello ...")
    await asyncio.sleep(1)
    print("... World!")

asyncio.run(main())
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
proc main() {.async.} =
  echo("Hello ...")
  await sleep_async(1)
  echo("... World!")

wait_for main()
```

Internamente Async esta implementado usando metaprogramacion (Macros, Templates, Pragmas, etc).

| Descripcion                      | [asyncCheck](https://nim-lang.org/docs/asyncfutures.html#asyncCheck%2CFuture%5BT%5D) | [waitFor](https://nim-lang.org/docs/asyncdispatch.html#waitFor%2CFuture%5BT%5D) | [await](https://nim-lang.org/docs/asyncdispatch.html#await%2CT) |
|----------------------------------|------------|---------|-------|
| Espera que el Future este completo | :negative_squared_cross_mark: | :heavy_check_mark: | :heavy_check_mark: |
| Ignora el Future               | :heavy_check_mark: | :negative_squared_cross_mark: | :negative_squared_cross_mark:  |
| Retona el resultado dentro del Future     | :negative_squared_cross_mark: | :heavy_check_mark: | :heavy_check_mark: |
| Solo disponible dentro de async      | :negative_squared_cross_mark: | :negative_squared_cross_mark: | :heavy_check_mark: |

- Por que Nim no usa `async def`?.

Async es simplemente un `macro` en Nim, no hay necesidad de cambiar la sintaxis de todo el lenguaje, es como un Decorator en Python.

Ademas la misma funcion puede ser Async Y Sync al mismo tiempo, con el mismo codigo, con el mismo nombre.

En Python cuando tenes una libreria *"foo"*, tal vez tenes `foo` (Sync) y `aiofoo` (Async),
usualmente proyectos, repos, devs, APIs completamente diferentes,
esto no es necesario en Nim, gracias a esa caracteristica.

Ver tambien [asyncfile](https://nim-lang.org/docs/asyncfile.html),
[asyncnet](https://nim-lang.org/docs/asyncnet.html),
[asyncstreams](https://nim-lang.org/docs/asyncstreams.html),
[asyncftpclient](https://nim-lang.org/docs/asyncftpclient.html),
[asyncfutures](https://nim-lang.org/docs/asyncfutures.html).


# Do I have to know C?

Nunca tenes realmente que manualmente editar C,
de la misma manera que en Python nunca tenes que manualmente editar PYC.

En Nim programas escribiendo Nim, de la misma manera que en Python programas escribiendo Python.


## Templates

Templates reemplazan su invocacion con su contenido en tiempo de compilacion.

Imagina que **el compilador va a copiar&pegar un pedazo de codigo por vos**.

Template permite tener construcciones como funcion pero sin costos extra de performance,
permite partir funciones gigantes en construcciones mas diminutas.

Demasiados nombres de funciones y variables pueden contaminar y saturar el namespace local,
variables dentro de templates no existen afuera del template,
templates no existen en el namespace en tiempo de ejecucion (si no lo exportas),
templates pueden optimizar ciertos valores si son conocidos en tiempo de compilacion.

Templates no pueden hacer `import` or `export` de librerias automaticamente implicitamente,
templates no pueden hacer "auto-import" de simbolos usandos dentro de si mismo,
si usas alguna libreria importada en el cuerpo de un template,
debes importar esa libreria cuando llamas ese template.

Adentro de los templates no se puede usar `return` por que no es una funcion.

Templates te permiten implementear una bonita API de muy alto nivel para uso habitual,
mientras mantienen las cosas de optimizaciones y de bajo nivel fuera de tu cabeza y [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself).

Python `with open("file.txt", mode = "r") as file:` implementado usando 1 template:

[![Template explanation animation](https://raw.githubusercontent.com/juancarlospaco/nim-presentation-slides/master/templates.gif "Template explanation animation")](https://github.com/juancarlospaco/nim-presentation-slides/blob/master/templates.xcf)

GIF no es perfecto, pero es una aproximacion simplificada!.

Esta no es la manera de leer y escribir archivos en Nim, es solo un ejercicio.

Template no es perfecto, pero es una aproximacion simplificada!, ejercicio para el lector el tratar de mejorarlo ;P

```nim
template with_open(name: string, mode: char, body: untyped) =
  let flag = if mode == 'w': fmWrite else: fmRead  # "flag" No existe fuera de este template
  let file {.inject.} = open(name, flag)   # Crea e injecta variable "file", "file" existe fuera de este template por {.inject.}
  body                                     # El codigo "body" es pasado como argumento
  file.close()                             # Codigo luego de body

with_open("testin.nim", 'r'): # Imita Python with open("file", mode='r') as file
  echo "Hello Templates"      # Codigo dentro del template, estas 2 lineas son "body" del template
  echo file.read_all()        # Esta linea usa la variable "file"
```

Si estas recien comenzando desde cero, podes usar Funciones como en Python para todo, no produce error por hacerlo.


## How to share variables between functions?

Compartir variables entre funciones es similar a Python.

**Variable Global:**

```python
global_variable = ""

def function0():
    global global_variable
    global_variable = "cat"

def function1():
    global global_variable
    global_variable = "dog"

function0()
assert global_variable == "cat"
function1()
assert global_variable == "dog"
function0()
assert global_variable == "cat"
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
var global_variable = ""

proc function0() =
  global_variable = "cat"

proc function1() =
  global_variable = "dog"

function0()
assert global_variable == "cat"
function1()
assert global_variable == "dog"
function0()
assert global_variable == "cat"
```

**Object Attribute:**

```python
class IceCream:

  def __init__(self):
    self.object_attribute = None

def function_a(food):
    food.object_attribute = 9

def function_b(food):
    food.object_attribute = 5

food = IceCream()
function_a(food)
assert food.object_attribute == 9
function_b(food)
assert food.object_attribute == 5
function_a(food)
assert food.object_attribute == 9
```
:arrow_up: Python :arrow_up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :arrow_down: Nim :arrow_down:
```nim
type IceCream = object
  object_attribute: int

proc functiona(food: var IceCream) =
  food.object_attribute = 9

proc functionb(food: var IceCream) =
  food.object_attribute = 5

var food = IceCream()
functiona(food)
assert food.object_attribute == 9
functionb(food)
assert food.object_attribute == 5
functiona(food)
assert food.object_attribute == 9
```

Podes pasar funciones como argumento de funciones como en Python tambien.


## Import Nim files on Python

- https://github.com/Pebaz/nimporter#nimporter


## Python Syntax for Nim

- https://github.com/Yardanico/nimpylib#nimpylib


## Publish to PYPI

- https://github.com/yglukhov/nimpy/wiki#publish-to-pypi
- https://github.com/sstadick/ponim/blob/master/README.md#nim--python--poetry--
- https://github.com/sstadick/nython#nython

## Silent Compilation

Si queres la compilacion completamente silenciosa (vas a perder errores y consejos importantes),
podes agregar al comando de compilacion ` --hints:off --verbosity:0 `.


## Compiler Help

La ayuda del compilador es larga, para hacerla mas amigable al usuario solo las cosas mas frecuentes se muestran con `--help`,
para ver la ayuda completa usa `--fullhelp`.


## Build Modes

Cuando tu codigo esta listo para produccion debes usar el Release build,
podes agregar al comando de compilacion ` -d:release `.

Caracteristica | Release Build                 | Debug Build                   |
-----------|-------------------------------|-------------------------------|
Velocidad  | Rapido                        | Lento
Archivo    | Chico                         | Grande
Optimizado | :heavy_check_mark:            | :negative_squared_cross_mark:
Tracebacks | :negative_squared_cross_mark: | :heavy_check_mark:
Chequeos Run-time | :heavy_check_mark:       | :heavy_check_mark:
Chequeos Compile-time | :heavy_check_mark:   | :heavy_check_mark:
`assert`   | :negative_squared_cross_mark: | :heavy_check_mark:
[`doAssert`](https://nim-lang.org/docs/assertions.html#doAssert.t%2Cuntyped%2Cstring) | :heavy_check_mark:  | :heavy_check_mark:


# MicroPython

Nim compila a C, puede correr en Arduino y hardware similar.

Nim tiene varios tipos de manejo de memoria para satisfacer tu necesidad, incluido manejo de memoria manual.
Binarios Nim son chicos cuando se compilan en Release Build y pueden entrar en poco espacio de disco.

- https://github.com/zevv/nim-arduino
- https://gitlab.com/endes123321/nimcdl/tree/master#nimcdl-nim-circuit-design-language
- https://github.com/cfvescovo/Arduino-Nim#arduino-nim
- https://gitlab.com/nimbed/nimbed#nimbed
- https://gitlab.com/endes123321/led-controller-frontend#led-controller-frontend
- https://ftp.heanet.ie/mirrors/fosdem-video/2020/AW1.125/nimoneverything.webm


# SuperCollider

SuperCollider es C++ entonces puede ser re-utilizado con Nim.

Teoricamente, plugins Nim de SuperCollider son rapidos como codigo C.
La metaprogramacion de Nim permite hacer DSL amigables para LiveCoding.

Algunos proyectos para Nim LiveCoding:

- https://github.com/vitreo12/omni#omni
- https://github.com/capocasa/scnim#scnim---writing-supercollider-ugens-using-nim


#### ABC

[Ver](http://rosettacode.org/wiki/Abstract_type#Nim)


[ :arrow_up: :arrow_up: :arrow_up: :arrow_up: ](#tabla-de-contenidos "Ir arriba")
"""
nbSave()
