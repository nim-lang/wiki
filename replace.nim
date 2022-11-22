import std/[os, sequtils, strutils, osproc]

let workingDir = getCurrentDir() / "nimwiki"

type
  fmtSelection = enum
    nimib, nimibook

proc markdownTo(fmt: fmtSelection = nimibook) =
  var header: string
  if fmt == nimib:
    header = readFile(getCurrentDir() / "nimibStart.txt")
  if fmt == nimibook:
    header = readFile(getCurrentDir() / "nimibookStart.txt")
  let
    footer = readFile(getCurrentDir() / "nimibStop.txt")
    workingDir = getCurrentDir() / "nimwiki"
  for file in toSeq(walkFiles(workingDir / "*.md")):
    let fileContent = readFile(file)
    # .md -> .nim
    var newName = file.changeFileExt("nim")
    # Nim module doesn't accept hyphens -> replace with underscores
    newName = newName.multiReplace({
      "-":"_",
      "(":"",
      ")":"",
      ":":"_"
    })
    newName = newName.strip(leading = true, trailing = true, chars = {'_'})
    writeFile(workingDir / splitPath(newName).tail, header & fileContent & footer)

proc nimibExecution() =
  var filenames: seq[string] = @[]
  for file in walkFiles(workingDir / "*.nim"):
    if execCmd( "nim r --hints:off " & file) != 0:
      filenames.add(file)
  for file in filenames:
    echo "Could not run the nimib, ", file

when isMainModule:
  # Uncomment if you want to generat nimib boilerplate instead
  markdownTo(nimibook)
  discard execShellCmd("cp nimwiki/Aprende-Nim-en-5-Minutos.nim nimwiki/Aprende_Nim_en_5_Minutos.nim")

  # nimibExecution()
