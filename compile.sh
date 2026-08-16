#!/bin/bash

mkdir -p build

gcc -fPIC -c lib/string.s -o build/string_so.o
gcc -fPIC -c lib/start.s -o build/start.o

gcc -fPIC -c -fno-builtin -fno-stack-protector source/main.c -o build/main.o

gcc -shared -nostdlib build/string_so.o build/start.o build/main.o -o build/libfhss.so
