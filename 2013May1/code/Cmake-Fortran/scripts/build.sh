#!/bin/sh

cd ../build/
rm -rf *
cmake -G "Eclipse CDT4 - Unix Makefiles"  ../src/
make
sudo chmod -R 777 bin/
