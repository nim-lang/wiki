import nimib, nimibook

nbInit(theme = useNimibook)

nbText:"""
This is a rough guide on how to make nim source files behave like scripts.  This document targets debian/ubuntu-likes; you may have to adjust for other systems.

## Prequisites
* Install tcc (optional, but recommended): `sudo apt install tcc`
* Make sure binfmt_misc support is available: `ls /proc/sys/fs/binfmt_misc/register`

## The script runner

Create `/usr/local/bin/nimtcc`, like so:

```bash
#!/bin/bash

if [[ "$#" -eq 0 ]]; then
	echo "at least 1 argument required" >&2
	exit 1
fi

if [[ ! -e "$1" ]]; then
	echo "not found: $1" >&2
	exit 1
fi

umask u+rwx
out=$(mktemp ${TMPDIR:-/tmp/}$(basename $1).XXXXXXXXXXXX)

function finish() {
	rm -- "$out"
}
trap finish EXIT

nim compile \
	--verbosity:0 \
	'--hint[Processing]:off' \
	--cc:tcc \
	"-o:$out" \
	-r $@
```

The script creates a temp file (in /tmp) to write the compiled program to, and immediately removes it thereafter again.

* Make sure nim is available on PATH, or change the path to the binary in the script.
* Mark it as executable: `sudo chmod +x /usr/local/bin/nimtcc`
* .. and test it: `$ nimtcc my_script.nim`. If it doesn't work, fix it.

**N.B.:**
- This still creates a `nimcache` in the current directory.  I've left it in as a compromise to speed up iterative script development.  If this is not desired, you will have to adjust the script to create an additional directory (with mktemp -d), pass that to the compiler; and then remove it afterwards.
- Similarily, you can get rid of the whole mktemp to write the script binary to the current directory.

## binfmt_misc

Now, optionally, make it so you can mark scripts as executable and run them directly. This requires binfmt_misc support in your kernel. Most modern kernels have this enabled by default.

* `$ echo ':nimtcc:E::nim::/usr/local/bin/nimtcc:' | sudo tee -a /proc/sys/fs/binfmt_misc/register`
* `$ chmod +x my_script.nim`
* `$ ./my_script.nim`
"""
nbSave()
