
#!/bin/bash

#grabs the location of the file we want
pathName=$(find $1 -type f -name "*failed_login_data.txt")

#grabs the infromation we want, in this case it's users
awk '{print $5}' $pathName  > intermediate.txt

#sorts the data lexographically and counts the frequencey of the users and prints the data to a javascript fucntion and finally write it to a document.
sort  intermediate.txt > failtest.txt

join -1 1 -2 1 failtest.txt ./etc/country_IP_map.txt > results.txt

awk '{print $2}' results.txt > ips.txt


uniq -c ips.txt | awk '{print "data.addRow([\x27"$2"\x27, " $1"]);";}' > fail.txt

#wraps the text in html tags
./bin/wrap_contents.sh fail.txt ./html_components/country_dist $1/country_dist.html
#cleaning the mess
rm fail.txt
rm intermediate.txt
rm ips.txt
rm results.txt
