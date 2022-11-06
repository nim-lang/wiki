import std/[os, sequtils, strutils, osproc]
    
let workingDir = getCurrentDir() / "nimwiki"

proc markdownToNimib() =
  let
    # Select nimibStart instead of nimibookStart, for nimib only generation
    # nimibStart = readFile(getCurrentDir() / "nimibStart.txt")
    nimibookStart = readFile(getCurrentDir() / "nimibookStart.txt")
    nimibStop = readFile(getCurrentDir() / "nimibStop.txt")
    workingDir = getCurrentDir() / "nimwiki"
  for file in toSeq(walkFiles(workingDir / "*.md")):
    let fileContent = readFile(file)
    # .md -> .nim
    var newName = file.changeFileExt("nim")
    # Nim module doesn't accept hyphens -> replace with underscores
    newName = newName.replace('-','_')
    var f: File = nil
    if open(f, workingDir / splitPath(newName).tail, fmWrite):
      try:
        echo "writing ", newName
        # We write nimibook boilerplate
        f.write(nimibookStart)
        f.write(fileContent)
        f.write(nimibStop)
      finally:
        close(f)
    else:
      echo "Could not create file ", newName

proc nimibExecution() =
  var filenames: seq[string] = @[]
  for file in walkFiles(workingDir / "*.nim"):
    if execCmd( "nim c -r --hints:off " & file) != 0:
      filenames.add(file)
  for file in filenames:
    echo "Could not run the nimib, ", file

when isMainModule:
  # Uncomment if you want to generat nimib boilerplate instead
  markdownToNimib()
  # nimibExecution()
