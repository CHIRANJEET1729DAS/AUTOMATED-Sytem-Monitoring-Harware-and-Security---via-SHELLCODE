#!/bin/bash

LOG_FILE="/home/chiranjeet/Custom_shell_scripts/system_monitoring/hardware_monitoring/logs/disk_monitoring.log"  #so here is our log file path for monitored details
DISK_THRESHOLD=90 # and I have hardcoded the threshold for demonstration purposes

# in this we have used one while loop to monitor and second to search through the partitions

while true; do
    # we are using "df -h" for getting the data for each partition and we need to loop through them to get the partition exploiting memory over threshold
    df -h | awk -v threshold="$DISK_THRESHOLD" '$5+0 > threshold {print $1, $5}' | while read -r disk usage; do
        echo "Date : $(date '+%d%m%Y') Time : $(date '+%r') high disk usage on $disk of $usage" >> "$LOG_FILE"
    done # end of partitions' loop
    sleep 10 # next monitoring after 10 sec break
done # end of the first loop
