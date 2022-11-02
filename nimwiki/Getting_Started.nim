import strformat, strutils
import nimib
import nimoji

nbInit

nbText:"""
To get the source code you need either of these:

* A working web browser + tar(or equivalent): https://github.com/nim-lang/Nim/tarball/master
* wget + tar: `wget --no-check-certificate "https://github.com/nim-lang/Nim/tarball/master"`
* git: `git clone --depth 1 git://github.com/nim-lang/Nim.git`

### Bootstrapping

After downloading the source (and extracting it), you need to extract build/csources.zip then you can bootstrap with:

* `./bootstrap.sh`
* Put Nim on your PATH
  * For Linux, you only need a symlink: `ln -s $PWD/bin/nim /home/user/bin`

#### A simple script
```
git clone git://github.com/nim-lang/Nim.git
cd Nim
./bootstrap.sh
```
### Nimble

Nimble is Nim's package manager
* Download the source from https://github.com/nim-lang/nimble using one of the above methods.
* `cd nimble/src`
* `nim c nimble`
* `ln -s $PWD/nimble /home/user/bin`
* `nimble update`"""
nbSave()
