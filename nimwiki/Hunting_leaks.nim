import nimib, nimibook

nbInit(theme = useNimibook)

nbText:"""
- Compile with ``-d:nimTypeNames``
- At strategic places in your program call ``dumpNumberOfInstances`` to see what the GC heap contains.
"""
nbSave()
