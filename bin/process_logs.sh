#!/bin/bash
SCRATCH="SCRATCH"
mkdir $SCRATCH

Current=$(pwd)
for var in "$@"
do
  
    string="$var"
    string=${string#*/}
   string=${string%_*}
   mkdir $SCRATCH/$string
  tar -xf "$var" -C $SCRATCH/$string
 bin/process_client_logs.sh $SCRATCH/$string
   
done

bin/create_username_dist.sh $SCRATCH

bin/create_hours_dist.sh $SCRATCH

bin/create_country_dist.sh $SCRATCH

bin/assemble_report.sh $SCRATCH

mv SCRATCH/failed_login_summary.html $Current

#rm -rf SCRATCH
