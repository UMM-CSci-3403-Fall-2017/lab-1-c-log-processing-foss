#!/bin/bash


pathName=$(find $1 -type f -name "*failed_login_data.txt")

awk '{print $4}' $pathName  > intermediate.txt

sort intermediate.txt | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, " $1"]);";}' > fail.txt


./bin/wrap_contents.sh fail.txt ./html_components/username_dist $1/username_dist.html

rm fail.txt
rm intermediate.txt
