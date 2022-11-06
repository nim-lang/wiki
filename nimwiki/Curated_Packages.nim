import nimib, nimibook

nbInit(theme = useNimibook)

nbText:"""
# Table of contents

|                |                |                |                |
| :------------: | :------------: | :------------: | :------------: |
| [Standard library](#standard-library) | [Nim distribution](#nim-distribution) | [Metapackages](#metapackages) |
| [Algorithms & data structures](#algorithms--data-structures) | [Text](#text) | [Language](#language) | [Development](#development) |
| [System](#system) | [Database](#database) | [Multimedia](#multimedia) | [Web](#web) |
| [Internet](#internet) | [Specific targets](#specific-targets) | [IoT & Embedded](#iot--embedded) | [Cloud](#cloud) |
| [GUI](#gui) | [Games](#games) | [Science](#science) | [Vertical Domains](#vertical-domains) |

This list is fairly outdated. See instead: [Awesome Nim](https://github.com/xflywind/awesome-nim) and the [Nimble package directory](https://nimble.directory/) 

# Curated list of Nim packages

A common problem with Nim is finding packages as the search feature in Nimble is limited and package authors don't always make their package descriptors easily searchable. Here is a classified list of packages. The taxonomy can be improved: you can use it to find packages in some categories, but also to find categories without packages. This list favours *pure* Nim packages. Bindings and wrappers for external libraries or services could be added to another page eventually. Another limitation is that it does not specify with which version of Nim these packages can be used. This list has been curated to include *quality* packages well written and with supporting documentation.

## Standard library
  * [The standard library](https://nim-lang.org/docs/lib.html) already includes many optimized algorithms.

## Nim distribution
  * [Fusion has modules that aren't part of the standard library but are bundled with Nim](https://github.com/nim-lang/fusion).

<!--
## Metapackages
* [Fision](https://github.com/juancarlospaco/fision/blob/master/fision.nimble): A "metapackage" with all [important_packages](https://github.com/nim-lang/Nim/blob/devel/testament/important_packages.nim) with 0 dependencies and all unittests passing.
  Automatically updated once a month by GitHub Actions to be neutral to opinions and keep always fresh.
-->

## Algorithms & data structures
  * Cryptography
    - nimcrypto: https://github.com/cheatfate/nimcrypto
    - RollingHash: https://marcazar.github.io/RollingHash
    - bslcurve: https://github.com/status-im/nim-blscurve
    - fletcher: https://github.com/Akito13/nim-fletcher
    - xxtea: https://github.com/xxtea/xxtea-nim
    - des: https://github.com/LucaWolf/des.nim
    - ed25519: https://github.com/niv/ed25519.nim
    - murmurhash: https://github.com/cwpearson/nim-murmurhash
    - NiMPC: https://github.com/markspanbroek/nimpc
    - shimsham: https://github.com/apense/shimsham
    - Constantine: https://github.com/mratsim/constantine
  * Random
    - drand: https://github.com/JeffersonLab/drand48
    - random: https://github.com/oprypin/nim-random
    - sysrandom: https://github.com/euantorano/sysrandom.nim
    - gimei: https://github.com/mkanenobu/nim-gimei
    - faker: https://github.com/jiro4989/faker
  * Maths
    * Numerical methods
      - numericalnim: https://github.com/HugoGranstrom/numericalnim/
    * Tensors, matrix
      - Arraymancer: https://github.com/mratsim/Arraymancer
      - neo: https://github.com/andreaferretti/neo
      - Flambeau: https://github.com/SciNim/flambeau
    * Statistics
      - alea: https://github.com/unicredit/alea
    * Sets
      - isl: https://github.com/mratsim/nim-isl
    * Miscellaneous
      - stint: https://github.com/status-im/nim-stint
      - seqmath: https://github.com/jlp765/seqmath
      - sequtils: http://htmlpreview.github.io/?https://github.com/Michedev/sequtils2/blob/master/sequtils2.html
      - spills: https://github.com/andreaferretti/spills
  * Compression
    * Zip
      - zip: https://github.com/nim-lang/zip
      - zippy: https://github.com/guzba/zippy
    * Tar
  * Data structures
    - rbtree: https://github.com/Nycto/RBTreeNim
    - BipBuffer: https://marcazar.github.io/BipBuffer
    - BitVector: https://marcazar.github.io/BitVector
    - bloom: https://www.github.com/boydgreenfield/nimrod-bloom
    - binaryheap: https://github.com/bluenote10/nim-heap
    - cdt: https://github.com/StefanSalewski/cdt
    - faststack: https://github.com/Vladar4/FastStack
    - minmaxheap: https://github.com/stefansalewski/minmaxheap
    - quadtree: https://github.com/Nycto/QuadtreeNim
    - k-d tree: https://github.com/jblindsay/kdtree
    - RTree: https://github.com/StefanSalewski/RTree
    - sorta: https://github.com/narimiran/sorta
    - StashTable: https://github.com/olliNiinivaara/StashTable
  * Collections
  * Sorts
  * Regular expressions
    - npeg: https://github.com/zevv/npeg
    - regex: https://github.com/nitely/nim-regex
  * Search and comparison
    - astar: https://github.com/Nycto/AStarNim
    - lapper: https://github.com/brentp/nim-lapper
    - negamax: https://github.com/JohnAD/negamax
    - syphus: https://github.com/makingspace/syphus-nim
    - ulid: https://github.com/adelq/ulid
  * Patterns
    - citadino: https://github.com/makingspace/cittadino
    - nimobserver: https://github.com/Tangdongle/nimobserver
  * Graphics algorithms
    - delaunay: https://github.com/Nycto/DelaunayNim
    - rect_packer: https://github.com/yglukhov/rect_packer
  * States machine and automata
    - Synthesis: https://github.com/mratsim/Synthesis


## Text
  * Text algorithms
    - cello: https://github.com/andreaferretti/cello
    - porter: https://github.com/iourinski/porter
    - strslice: https://github.com/PMunch/strslice
    - alignment: https://github.com/jiro4989/alignment
  * Enhanced Unicode support
    - unicodedb: https://github.com/nitely/nim-unicodedb
    - unicodeplus: https://github.com/nitely/nim-unicodeplus
    - strunicode: https://github.com/nitely/nim-strunicode
  * Calendar, date, time
    - timezones: https://github.com/GULPF/timezones
    - chrono: https://github.com/treeform/chrono
  * Internationalization
  * Rich text
    - hastyscribe: https://h3rald.com/hastyscribe
    - markdown: https://github.com/soasme/nim-markdown
  * Typography
    - typography: https://github.com/treeform/typography


## Language
  * C/C++ interop
    - c2nim: https://github.com/nim-lang/c2nim
    - nimterop: https://github.com/nimterop/nimterop
    - futhark: https://github.com/PMunch/futhark
  * Python interop
    - nimpy: https://github.com/yglukhov/nimpy
  * Java interop
    - jnim: https://github.com/yglukhov/jnim
  * Regular Expression
    - regex: https://github.com/nitely/nim-regex
  * Pattern matching
    - ast_pattern_match: https://github.com/krux02/ast-pattern-matching
    - patty: https://github.com/andreaferretti/patty
    - gara: https://github.com/alehander92/gara
  * With context
    - subfield: https://github.com/jyapayne/subfield
    - tuples: https://github.com/MasonMcGill/tuples
    - with: https://github.com/zevv/with
  * Contracts
    - contracts: https://github.com/Udiknedormin/NimContracts
    - contra: https://github.com/juancarlospaco/nim-contra
  * Functional programming
    - nimfp: https://github.com/vegansk/nimfp
    - zero-functional: https://github.com/zero-functional/zero-functional
    - cascade: https://github.com/citycide/cascade
  * Formatter
    - strfmt: https://lyro.bitbucket.org/strfmt
  * Memory management
  * Optimization
    - memo: https://github.com/andreaferretti/memo
  * Error handling
    - optionsutils: https://github.com/PMunch/nim-optionsutils
    - ur: https://github.com/JohnAD/ur
  * Control structures
    - itertools: https://github.com/narimiran/itertools
    - loopfusion: https://github.com/numforge/loopfusion
    - looper: https://github.com/b3liever/looper
  * Metaprogramming
    - nesm: https://xomachine.gitlab.io/NESM/
  * Object orientation
    - classy: https://github.com/nigredo-tori/classy
    - interfaced: https://github.com/andreaferretti/interfaced
    - protocoled: https://github.com/b3liever/protocoled
    - oop_utils: https://github.com/bluenote10/oop_utils
  * Toy languages
    - MiNiM: https://h3rald.com/minim
    - spry: https://github.com/gokr/spry
    - spryvm: https://github.com/gokr/spryvm
    - ad: https://github.com/subsetpark/ad
    - awk: https://github.com/greencardamom/awk
    - brainfuck: https://github.com/def-/nim-brainfuck
    - nim0: https://gitlab.com/pmetras/nim0
  * Compiler
    - nlvm: https://github.com/arnetheduck/nlvm
  * Miscellaneous
    - pykot: https://github.com/jabbalaci/nimpykot
    - pylib: https://github.com/Yardanico/nimpylib
  

## Development
  * Editor, IDE, & plugins
    - nimlsp: https://github.com/PMunch/nimlsp
    - nim.nvim: https://github.com/alaviss/nim.nvim
    - vscode-nim: https://github.com/saem/vscode-nim
  * REPL
    - inim: https://github.com/inim-repl/INim
  * Parser:
    - lilt: https://github.com/quelklef/lilt
    - binaryparse: https://github.com/PMunch/binaryparse
    - argparse: https://github.com/iffy/nim-argparse
    - binarylang: https://github.com/sealmove/binarylang
  * Lex, Yacc:
    - nimly: https://github.com/loloiccl/nimly
  * AST tools
  * Serializer
    - serialization: https://github.com/status-im/nim-serialization
    - protobuf: https://github.com/PMunch/protobuf-nim
    - yaml: http://flyx.github.io/NimYAML/
    - samson: https://github.com/GULPF/samson
    - unpack: https://github.com/technicallyagd/unpack
    - cbor: https://github.com/ehmry/nim-cbor
    - nimpb: https://github.com/oswjk/nimpb
    - packedjson: https://github.com/Araq/packedjson
    - tnetstring: https://github.com/mahlonsmith/nim-tnetstring
    - nimjson: https://github.com/jiro4989/nimjson
    - msgpack4nim: https://github.com/jangko/msgpack4nim
  * Command line
    * Arguments parser
      - docopt: https://github.com/docopt/docopt.nim
      - cligen: https://github.com/c-blake/cligen
    * Line-oriented command interpreter
      - Loki: https://github.com/beshrkayali/loki
    * Text entry
  * Config parser
    - confutils: https://github.com/status-im/nim-confutils
    - dotenv: https://github.com/euantorano/dotenv.nim
    - parseini: https://github.com/lihf8515/parseini
    - parsetoml: https://github.com/NimParsers/parsetoml
    - envconfig: https://github.com/jiro4989/envconfig
  * Useful Macros
  * Documentation
    - ntangle: https://github.com/OrgTangle/ntangle
  * Tests
    - einheit: https://github.com/jyapayne/einheit
  * Installer
  * Resource bundler
  * Build system
    - nake: https://github.com/fowlmouth/nake
  * Package management
    - nifty: https://github.com/h3rald/nifty
    - plz: https://github.com/juancarlospaco/nim-pypi
  * Continuous integration
  * DSL
  * Version control
    - p4ztag_to_json: https://github.com/kaushalmodi/p4ztag_to_json
    - semver: https://github.com/euantorano/semver.nim
    - spdx_licenses: https://github.com/euantorano/spdx_licenses.nim
    - [parseLicense](https://github.com/juancarlospaco/parselicense#parselicense) Parse SPDX Licenses from string to Enum at compile-time
  * Input validation
    - validateip: https://github.com/Akito13/nim-validateip
  * Code analysis
    - coco: https://github.com/samuelroy/coco
  * Scripting
    - nimr: https://github.com/Jeff-Ciesielski/nimr
    - nimcr: https://github.com/PMunch/nimcr
  * Benchmarking
    - criterion: https://github.com/disruptek/criterion
    - nimbench: https://github.com/ivankoster/nimbench
    - stopwatch: https://gitlab.com/define-private-public/stopwatch
    - timeit: https://github.com/xflywind/timeit
    - timespec_get: https://github.com/Matceporial/nim-timespec_get
    - golden: https://github.com/disruptek/golden
  * External libraries integration
    - nimgen: https://github.com/genotrance/nimgen


## System
  * Platform
    - psutil: https://github.com/johnscillieri/psutil-nim
  * Logs & syslog
    - chronicles: https://github.com/status-im/nim-chronicles
  * Concurrent
    - chronos: https://github.com/status-im/nim-chronos
    * Threading
      - weave: https://github.com/mratsim/weave
      - shared: https://github.com/genotrance/shared
      - timerpool: https://github.com/mikra01/timerpool
    * Process
    * Multiplexing
    * Routines
    * Scheduler
      - nim-schedules: https://github.com/soasme/nim-schedules
    * Message passing
  * Publisher/Consumer
    - cittadino: https://github.com/makingspace/cittadino
  * Message Queues, pipes
    - beanstalk: https://github.com/tormaroe/beanstalkd.nim
  * Globbing
    - glob: https://github.com/citycide/glob
  * IO
    - serial: https://github.com/euantorano/serial.nim
    - nimbluez: https://github.com/Electric-Blue/NimBluez
    * Async
      - asyncpythonfile: https://github.com/fallingduck/asyncpythonfile-nim
    * Sync
  * Networking
    - stomp: https://github.com/mahlonsmith/nim-stomp
  * Debugging
  * Profiler, benchmarks
  * Users, groups and passwords management
  * RPC
  * Containers
    - asyncdocker: http://tulayang.github.io/asyncdocker.html
  * Miscellaneous
    - stew: https://github.com/status-im/nim-stew
    - tempdir: https://github.com/euantorano/tempdir.nim


## Database
  * JSON parser, generator
  * CSV parser
    - csvtools: https://github.com/unicredit/csvtools
  * SQL parser
  * Drivers
    * SQLite
      - SQLiteral: https://github.com/olliNiinivaara/SQLiteral
    * MySQL
      - asyncmysql: https://github.com/tulayang/asyncmysql
    * PostgreSQL
    * Others
      - db_clickhouse: https://github.com/leonardoce/nim-clickhouse
  * XML parser, generator
    - xmltools: https://github.com/vegansk/xmltools
    - xml.nim: https://github.com/ba0f3/xml.nim
  * ORM
    - norm: https://github.com/moigagoo/norm
    - allographer: https://github.com/itsumura-h/nim-allographer
    - [Gatabase](https://github.com/juancarlospaco/nim-gatabase#gatabase)
  * NoSQL
    - litestore: https://h3rald.com/litestore
    - nimongo: https://github.com/SSPkrolik/nimongo
    - redis: https://github.com/nim-lang/redis
  * Search
    - sonic: https://github.com/xmonader/nim-sonic-client


## Multimedia
  * Magic file detection
    - imghdr: https://github.com/achesak/nim-imghdr/blob/master/imghdr.nim
  * Audio and music
    * Files/stream formats
    * Midi
    * WAV:
      - wave: https://github.com/jiro4989/wave
  * Image
    * Colors:
      - chroma: https://github.com/treeform/chroma
    * Formats: BMP, GIF, JPEG, PNG, SVG
      - nimBMP: https://github.com/jangko/nimBMP
      - nimSvg: https://github.com/bluenote10/NimSvg
      - nimPNG: https://github.com/jangko/nimPNG
      - pnm: https://github.com/jiro4989/pnm
      - [X-Pixmap, NetPBM (PGM, PBM)](https://github.com/juancarlospaco/xpm#x-pixmap--netpbm) 
    * Filters and effects
      - imageman: https://github.com/SolitudeSF/imageman
      - perlin: https://github.com/Nycto/PerlinNim
      - blurhash: https://github.com/SolitudeSF/blurhash
  * Video
    - srt: https://github.com/achesak/nim-srt
    - subviewer: https://github.com/achesak/nim-subviewer
    - VapourSynth.nim: https://github.com/mantielero/VapourSynth.nim
  * Raytracing
    - trace of radiance: https://github.com/mratsim/trace-of-radiance
  * 3D, VR
    - @see: Algorithms > Graphics algorithms
  * EBook
    - biblioteca_guarrilla: https://github.com/juancarlospaco/biblioteca-guarrilla


## Web
  * Single page applications
    - react: https://github.com/andreaferretti/react.nim
    - karax: https://github.com/karaxnim/karax
  * HTML and CSS helpers
    - random_font_color: https://github.com/juancarlospaco/nim-random-font-color
    * Parsing
      - nimquery: https://github.com/GULPF/nimquery
      - [Q](https://github.com/OpenSystemsLab/q.nim)
    * Generator
      - Gen: https://github.com/Adeohluwa/gen
    * Generating
      - rosencrantz: https://github.com/andreaferretti/rosencrantz
  * HTTP tools: Request, Response, Encodings, Authentication, Status, Cookies
    - httpauth: https://github.com/FedericoCeratto/nim-httpauth
    - biscuits: https://github.com/achesak/nim-biscuits
    * Websockets
      - websocket: https://github.com/niv/websocket.nim
      - ws: https://github.com/treeform/ws
  * Templating
    - emerald: https://flyx.github.io/emerald/
    - moustachu: https://github.com/fenekku/moustachu
    - mustache: https://github.com/soasme/nim-mustache
    - templates: https://github.com/onionhammer/nim-templates
  * CGI?
  * Frameworks
    - jester: https://github.com/dom96/jester
    - prologue: https://github.com/planety/prologue
    - Nexus: https://github.com/jfilby/nexus
    - [NimWC](https://nimwc.org/login) https://github.com/ThomasTJdev/nim_websitecreator
    - Basolato: https://github.com/itsumura-h/nim-basolato
    - Starlight: https://github.com/planety/starlight
    - Akane: https://github.com/Ethosa/akane


## Internet
  * URI, URL
    - Urlly: https://github.com/treeform/urlly
  * MIME
  * Email
  * SMTP
    - easymail: https://github.com/coocheenin/easymail
  * IMAP
  * IRC
  * SSL
  * Telnet
  * Authentication, OAuth
  * Bot building
    - telebot: https://github.com/ba0f3/telebot.nim
  * Web services
  * Webdav
    - webdavclient: https://github.com/beshrkayali/webdavclient


## Specific targets
  * JavaScript
    * Websockets


## IoT & Embedded
  * Hardware
    - boneIO: https://github.com/xyz32/boneIO
  * Microcontrollers
    - MSP430f5510 (6kB): https://gitlab.com/jalexander8717/msp430f5510-nim
    - STM32F3 (16 kB): https://github.com/mwbrown/nim_stm32f3
    - Arduino + Mediatek LinkIt ONE SDK: https://github.com/gokr/ardunimo
    - Arduino ESP8266 + Flashing Nim into Arduino: https://gitlab.com/NetaLabTek/Arduimesp

## Cloud
  * Distributed systems
  * Map, reduce
  * Streams
    - mangle: https://github.com/baabelfish/mangle
  * HyperLogLog and family


## GUI
  * Cross-platform
    - nimx: https://github.com/yglukhov/nimx
    - nigui: https://github.com/trustable-code/NiGui
    - libui: https://github.com/nim-lang/ui
    - imgui: https://github.com/nimgl/imgui
  * MacOS
  * Windows
    - wnim: https://github.com/khchen/wNim
    - winim: https://github.com/khchen/winim
  * GTK
    - gintro (GTK): https://github.com/StefanSalewski/gintro
  * QT
    - nimqml: https://github.com/filcuc/nimqml
  * Web
    - fidget: https://github.com/treeform/fidget
    - webgui: https://github.com/juancarlospaco/webgui
  * Console/Terminal
    - progress: https://github.com/euantorano/progress.nim
    - NimCx: https://github.com/qqtop/NimCx
    - dashing: https://github.com/FedericoCeratto/nim-dashing
    - illwill: https://github.com/johnnovak/illwill
    * Curses
  * Forms
  * Reports
    - foliant: https://github.com/foliant-docs/foliant-nim
    - nimtomd: https://github.com/ThomasTJdev/nimtomd
    - pager: https://git.sr.ht/~reesmichael1/nim-pager
  * Tabular
    - terminaltables: https://github.com/xmonader/nim-terminaltables
  * Plots
    - nimgraphviz: https://github.com/QuinnFreedman/nimgraphviz
    - ggplotnim: https://github.com/Vindaar/ggplotnim
    - nim-plotly: https://github.com/brentp/nim-plotly
    - matplotnim: https://github.com/ruivieira/matplotnim
    - gnuplotnim: https://github.com/dvolk/gnuplot.nim
    - graph: https://github.com/stisa/graph
    - nimetry: https://github.com/benjif/nimetry
    - gr.nim: https://github.com/mantielero/gr.nim
  * Formats: PDF, Tex, RST, ePub...
    - nimPDF: https://github.com/jangko/nimpdf
  * Editor
    - NEd: https://github.com/StefanSalewski/NEd


## Games
  * Games
    - nim-chess4: https://github.com/StefanSalewski/nim-chess4
    - tetris: https://github.com/Joco223/Tetris-In-Nim
  * Engines
    - nimgame2: https://github.com/Vladar4/nimgame2
    - nimgl: https://github.com/lmariscal/nimgl
    - rapid: https://github.com/liquid600pgm/rapid
    - tinamou: https://github.com/Double-oxygeN/tinamou
    - rod: https://github.com/yglukhov/rod
  * Frameworks
    - nico: https://github.com/ftsf/nico
    - c4: https://github.com/c0ntribut0r/cat-400
    - turn_based_game: https://github.com/JohnAD/turn_based_game
  * Emulation
    - nimes: https://github.com/def-/nimes
  * Miscellaneous
    - nasher: https://github.com/squattingmonk/nasher.nim
    - neverwinter: https://github.com/niv/neverwinter.nim

## Science
  * Science
    - @see: Algorithms > Graphics algorithms
    - units: https://github.com/Udiknedormin/NimUnits
    - metric: https://github.com/mjendrusch/metric
  * Astronomy
    - orbits: https://github.com/treeform/orbits
  * Mathematics
    - @see Algorithms & data structures > Maths
    - ski: https://github.com/jiro4989/ski
    - chebyshev: https://github.com/jxy/chebyshev
    - mathexpr: https://github.com/Yardanico/nim-mathexpr
    - [Constants](https://github.com/juancarlospaco/nim-constants#constants) Mathematical named static constants useful for different disciplines
    - linear algebra: https://github.com/planetis-m/manu
  * Biology
    - falas: https://brentp.github.io/falas/falas.html
    - nimna: https://github.com/mjendrusch/nimna
    - polypbren: https://github.com/guibar64/polypbren
    * Genomic
      - nim-hts: https://github.com/brentp/hts-nim
      - nim-hts-tools: https://github.com/brentp/hts-nim-tools
      - slivar: https://github.com/brentp/slivar
  * Data science
    - @see GUI > Reports > Plots
    - arraymancer: https://mratsim.github.io/Arraymancer/
    - NimData: https://github.com/bluenote10/NimData
    - nimdataframe: https://github.com/qqtop/nimdataframe
    - Datamancer: https://github.com/SciNim/Datamancer
    - laser: https://github.com/numforge/laser
    - nimhdf5: https://github.com/Vindaar/nimhdf5
    - pipelines: https://github.com/calebwin/pipelines
    - mentat: https://github.com/ruivieira/nim-mentat
    - mpfit: https://github.com/Vindaar/nim-mpfit
    - teafiles: https://github.com/unicredit/nim-teafiles
  * Machine Learning
    - arraymancer_vision: https://github.com/edubart/arraymancer-vision
    - nlopt: https://github.com/Vindaar/nimnlopt
    - torch: https://github.com/fragcolor-xyz/nimtorch
    - flambeau: https://github.com/SciNim/flambeau
    - nimfastText: https://github.com/genotrance/nimfastText
    - lda: https://github.com/unicredit/lda
    - libsvm: https://github.com/genotrance/libsvm
    - opencv: https://github.com/dom96/nim-opencv


## Vertical domains
  * Blockchain
    - eth: https://github.com/status-im/nim-eth
    - nimbus: https://github.com/status-im/nimbus
  * Geo / GIS
    - [OpenStreetMap](https://github.com/juancarlospaco/nim-openstreetmap#nim-openstreetmap)
    - [OpenStreetMap Nominatim](https://github.com/juancarlospaco/nim-nominatim#nim-nominatim)
    - [OpenStreetMap Overpass](https://github.com/juancarlospaco/nim-overpass#nim-overpass)
    - [Open Source Routing Machine for OpenStreetMap](https://github.com/juancarlospaco/nim-osrm#nim-osrm)
    - [OpenWeatherMap](https://github.com/juancarlospaco/nim-openweathermap#nim-openweathermap)
    - [OpenElevation](https://github.com/juancarlospaco/nim-open-elevation#nim-open-elevation)
    - [GeoRef Argentina](https://github.com/juancarlospaco/nim-georefar#nim-georefar)
    - [USIG Argentina](https://github.com/juancarlospaco/nim-usigar#nim-usigar)
    - [OpenStreetCams](https://github.com/juancarlospaco/nim-openstreetcam#nim-openstreetcam) (WIP)
  * Office applications
  * Natural language processing
  * Security
  * Platform specific
    * Linux & *nix
    * Windows
    * OS X
  * Tools
  * Servers
  * Intelligent Home
    - nimha: https://github.com/ThomasTJdev/nim_homeassistant


[ :arrow_up: :arrow_up: :arrow_up: :arrow_up: ](#table-of-contents "Go to top")
"""
nbSave()
