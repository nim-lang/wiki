import nimib, nimibook

nbInit(theme = useNimibook)

nbText:"""
# Bioconda
## Installing nim

    conda install nim

We've started with nim-1.0.2, but that can be updated at any time.

For now, we are using a source-distribution rather than the overnight pre-built.

## Details
The **nim-feedstock** now comes from the `conda-forge` "channel". It seems to work, but it still need improvement.

We are not yet able to "test" `nim` as part of the **nim-feedstock** recipe because of [how compilers are consumed in **conda**](https://docs.conda.io/projects/conda-build/en/latest/resources/compiler-tools.html). Suggestions are appreciated.

### Linux
We hard-code the expected name of the compiler in `$PREFIX/config/nim.cfg` (where nim itself lives at `$PREFIX/bin/nim`):
```ini
gcc.exe = "x86_64-conda_cos6-linux-gnu-gcc"
gcc.cpp.exe = "x86_64-conda_cos6-linux-gnu-gcc"
gcc.linkerexe = "x86_64-conda_cos6-linux-gnu-gcc"
clang.exe = "x86_64-conda_cos6-linux-gnu-gcc"
clang.linkerexe = "x86_64-conda_cos6-linux-gnu-gcc"
```
This is problematic, but it works for now.

### OSX
Not yet supported.

### Windows
Not yet supported.

## References
* https://github.com/conda-forge/nim-feedstock
* https://github.com/conda-forge/staged-recipes/pull/10046
* https://github.com/conda-forge/staged-recipes/pull/10045
* https://conda-forge.org/docs/maintainer/adding_pkgs.html
* https://docs.conda.io/projects/conda-build/en/latest/resources/compiler-tools.html"""
nbSave()
