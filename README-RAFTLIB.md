## Compilation Instructions
* Once you've downloaded qthreads:
```bash
./autogen.sh && ./configure && make clean && make -j$(nproc) && make -j1 check && sudo make install
```
* Once complete, and make check is successful, go back to building/linking RaftLib
* Pass -DUSEQTHREAD=1 to cmake

