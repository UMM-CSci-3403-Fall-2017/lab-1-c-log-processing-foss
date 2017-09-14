#!/bin/bash
#this set of find commands will look for the paths for the files we want
pathName=$(find $1 -type f -name "*username_dist.html")
pathName2=$(find $1 -type f -name "*hours_dist.html")
pathName3=$(find $1 -type f -name "*country_dist.html")
#this combines all the files into one file
cat $pathName3 $pathName2 $pathName > test.txt
#this wraps our files in html tags and writes the result as failed_login_summary.html
./bin/wrap_contents.sh test.txt ./html_components/summary_plots $1/failed_login_summary.html
