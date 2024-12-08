#!/bin/bash

LOG_FILE="/home/chiranjeet/Custom_shell_scripts/system_monitoring/hardware_monitoring/logs/memory_monitoring.log" # So this our log file path to store the alert data
MEMORY_THRESHOLD=3072 # and this our predefined memory threshold for now

while true; do
    # and we are using "free -m" to extract memory details and pull the data at the 7th index (i.e. free memory data)
    FREE_MEM=$(free -m | awk '/^Mem:/ {print $7}')
    if (( FREE_MEM < MEMORY_THRESHOLD )); then
        # here we have again pushed the data into log files in correct format
        echo "Date : $(date '+%d%m%Y') Time : $(date '+%r') --> Low memory :: $FREE_MEM MB" >> "$LOG_FILE"
    fi
    sleep 5 # used a time break of 5 sec between each monitoring
done
