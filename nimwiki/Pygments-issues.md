If you see any issues with the Pygments syntax highlighting for Nimrod (what github uses) please list them here so that somebody can fix them at some point.

## Generics + Operators

```nimrod
proc `[]`[T](x: int, args: varargs[T, `$`]) =
  for arg in args:
    echo arg

1[1, "x", 3]
```

The `` `[]` `` should only be red.

## Numerical type with suffix

```nimrod
proc suspend(p: Process) =
  if kill(p.id, SIGSTOP) != 0'i32: raiseOsError(osLastError())
```

```nimrod
proc terminate(p: Process) =
  if kill(p.id, SIGTERM) != 0'i32:
    raiseOsError(osLastError())

proc kill(p: Process) =
  if kill(p.id, SIGKILL) != 0'i32:
    raiseOsError(osLastError())
```

`'i32` and after should not be red.

See also https://github.com/nim-lang/Nim/blob/2297a1aa6048fcbcffca4e2c2e4ede275261e83d/lib/pure/osproc.nim