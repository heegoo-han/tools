#!/bin/sh
rm -rf cscope.*
find $1  \( -name '*.c' -o -name '*.cpp' -o -name '*.cc' -o -name '*.h' -o -name '*.s' -o -name '*.S' -o -name '*.js' \) -print > cscope.files
cscope -i cscope.files
