#!/bin/bash
#saving the given text file as a variable
text=$1
#grabbing the html stuff
bits=$2
#target file name
target=$3

cat $2_header.html $1 $2_footer.html > $target
