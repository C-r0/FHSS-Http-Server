gcc -I../../include -L../../build -o example example.c -lfhss

LD_LIBRARY_PATH=../../build ./example
