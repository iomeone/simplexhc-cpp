#!/usr/bin/env bash
set -e
SIMPLEXHC=../build/sxhc
LIBSTGPATH=../build/
LLC=llc
CC=clang

OUTO=$1".out.o"

$SIMPLEXHC  $1 -o $OUTO
$CC $OUTO -L $LIBSTGPATH -lstgruntime -o $1.out
rm $OUTO

# If this is at the CWD, then we need to execute it with `./` prepended
# to the path. Otherwise, we can directly execute it.
if [  $(dirname $1)  == $(dirname $0) ]; then
    # need to figure out how to set STG programs's exit code :)
    ./$1.out || true
else
    $1.out || true
fi;

exit 0

