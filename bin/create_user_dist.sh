#!/bin/bash

files=$1

path=find $1 -name "*failed_login_data.txt"

sort $path | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, " $1"]);";}' > failed.txt



