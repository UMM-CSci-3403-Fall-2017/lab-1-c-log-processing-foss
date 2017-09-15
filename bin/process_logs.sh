#!/bin/bash


for var in "$@"
do
    string="$var"
   string=${string%_*}
    #var= awk'{ }'
    #ext="${$var%%*_}"
    mkdir $string && tar -xf "$var" -C $string --strip-components 1
done


