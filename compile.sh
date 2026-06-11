#!/bin/sh
ASM=fasm
IN=main.s
DEBUG_OUT=main.i 
OUT=main 

#fasm $IN -s $DEBUG_OUT 
rm $OUT
fasm $IN $OUT
chmod +x $OUT

if [ "$1" = "run" ]; then
  ./$OUT
fi
