
#!/bin/bash

#grabs the location of the file we want
pathName=$(find $1 -type f -name "*failed_login_data.txt")

#grabs the infromation we want, in this case it's ip addresses
awk '{print $5}' $pathName  > intermediate.txt

#sorts the ips so a join command can be used on it
sort  intermediate.txt > failtest.txt

#This joins the first and the second file together according to their ip
join -1 1 -2 1 failtest.txt ./etc/country_IP_map.txt > results.txt

#grabs the ip addresses with the country codes
awk '{print $2}' results.txt > ips.txt

#Sorts the ips with the country codes and counts the frequencey of the countires pipes the results to a command that places the results in a javascript function. The command then write the result to a text document.
sort ips.txt | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, " $1"]);";}' > fail.txt

#wraps the text in html tags
./bin/wrap_contents.sh fail.txt ./html_components/country_dist $1/country_dist.html
#cleaning the mess
rm fail.txt
rm intermediate.txt
rm ips.txt
rm results.txt
rm failtest.txt
