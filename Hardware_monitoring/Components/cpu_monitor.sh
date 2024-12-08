#!/bin/bash

LOG_FILE="/home/chiranjeet/Custom_shell_scripts/system_monitoring/hardware_monitoring/logs/cpu_hardware.log" #so here is our log file_path
CPU_THRESHOLD=90 #and here we have hardcoded the threshold to be 90 for demonstration purposes

while true; do
    # we are using mpstat for gathering cpu idle percentage then subtracting it from 100 to get cpu active percentage (once every 5 seconds)
    CPU_USAGE=$(mpstat 1 5 | awk '/all/ {print 100 - $NF}')
    if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
        # here we logged the message successfully
        echo "Date : $(date '+%d%m%Y') , Time : $(date '+%r') --> High CPU Usage: $CPU_USAGE%" >> "$LOG_FILE"
    fi
done
