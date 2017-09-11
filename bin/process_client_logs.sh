#!/bin/bash
logfiles=$1

#Change into the directory we want to work in
cd $logfiles


#Use the grep command for all the log files and write to a txt file
grep -rh "Failed password for" *  | cat > name.txt
#This command replaces invalid user with an empty string
sed -i 's/invalid user //g' name.txt
#write the columns we ant to a file
awk '{print $1, $2, substr($3, 0, 2), $9, $11 }' name.txt > failed_login_data.txt
#remove this file
rm name.txt
