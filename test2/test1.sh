#!/bin/bash

logfiles=$1

cd $logfiles

#This works in the commandline but breaks in the shell file not sure why.

grep -rh "Failed password" *  | cat > name.txt

awk '{print $1, $2, substr($3, 0, 2), $11, $13 }' name.txt > failed_login_data.txt


#regexp notes: ^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}, ^\d{1,2} 
#$rm name.txt

#echo "12345" | awk '{gsub("^[0-9][0-9]", ","); print $0}'



#regular expresion for ips addresses
#^\d{0,3}*\.\d{0,3}*\.\d{0,3}*\.\d{0,3}*
#for dates
#^\d{0,2}*
