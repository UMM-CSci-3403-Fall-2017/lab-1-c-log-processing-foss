#!/bin/bash
logfiles=$1

cd $logfiles

#This works in the commandline but breaks in the shell file not sure why.

grep -rh "Failed password for" *  | cat > name.txt
sed -i 's/invalid user //g' name.txt

awk '{print $1, $2, substr($3, 0, 2), $9, $11 }' name.txt > failed_login_data.txt

rm name.txt
