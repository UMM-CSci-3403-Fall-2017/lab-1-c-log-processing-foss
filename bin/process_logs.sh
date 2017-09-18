#!/bin/bash

#making a temp directory
SCRATCH="SCRATCH"
mkdir $SCRATCH

#saving the current directory for later
Current=$(pwd)

#loop the takes out log_files/ and _secure.tgz. This will make a new directory withn the SCRATCH directory named after the computers and contain their log files. The log file will then be processed into a text file by process_client_logs.sh
for var in "$@"
do
  
    string="$var"
    string=${string#*/}
   string=${string%_*}
   mkdir $SCRATCH/$string
  tar -xf "$var" -C $SCRATCH/$string
 bin/process_client_logs.sh $SCRATCH/$string
   
done
#grabs the username data and writes the results to an html file.
bin/create_username_dist.sh $SCRATCH

#grabs the hours of the loginsand writes the results to an html file.
bin/create_hours_dist.sh $SCRATCH

#grabs the ip address and the country of the ip address and writes the results to an html file.
bin/create_country_dist.sh $SCRATCH

#grabs all three html files and wraps them in the overall header and footer and writes the results to an html file.
bin/assemble_report.sh $SCRATCH

#moves the file 'failed_login_summary.html' to the directory the script is run from
mv SCRATCH/failed_login_summary.html $Current

#cleans the mess
rm -rf SCRATCH
