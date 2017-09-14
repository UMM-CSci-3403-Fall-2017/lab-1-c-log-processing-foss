#!/bin/bash

pathName=$(find $1 -type f -name "*username_dist.html")
pathName2=$(find $1 -type f -name "*hours_dist.html")
pathName3=$(find $1 -type f -name "*country_dist.html")
cat $pathName3 $pathName2 $pathName > test.txt

./bin/wrap_contents.sh test.txt ./html_components/summary_plots $1/failed_login_summary.html
