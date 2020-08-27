## Compilation Instructions
* Once you've downloaded qthreads, for Linux use:
```bash
libtoolize && aclocal && autoconf && autoheader && automake --add-missing && ./configure --disable-internal-spinlock && make clean && make -j$(nproc) && make -j check && sudo make install
```
* you might need to run ```ldconfig``` before the shared lib is findable 
* Once complete, and make check is successful, go back to building/linking RaftLib
* Pass -DUSEQTHREAD=1 to cmake

## Tips
* On Linux, gcc/g++ seem to be the way to go, test cases fail with clang/clang++ and also exceptions
* OS X, try disabling fast context switch, haven't yet managed to build on latest version
of OS X, that being said, several of the older versions still work. 
