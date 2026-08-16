#!/bin/bash

mkdir -p build

gcc -fPIC -c lib/string.s -o build/string.o
gcc -fPIC -c lib/start.s -o build/start.o

gcc -fPIC -c -fno-builtin -fno-stack-protector source/main.c -o build/main.o

gcc -shared -nostdlib build/string.o build/start.o build/main.o -o build/libfhss.so

# EXAMPLE C
# gcc -I./include -L./build -o build/exampleC examples/C/example.c -lfhss
# LD_LIBRARY_PATH=./build ./build/exampleC
