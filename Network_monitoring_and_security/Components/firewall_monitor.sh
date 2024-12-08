#!/bin/bash

# this is not kind of monitoring service it is for saving the firewall rules

LOG_FILE="/home/chiranjeet/Custom_shell_scripts/system_monitoring/hardware_monitoring/logs/firewall_rules.log"  #here, this is the path to log file
# using iptables service to list the rules in verbose mode
iptables -L -v > "$LOG_FILE"
echo "Date : $(date '+%d%m%Y') and time : $(date '+%r')" >> "$LOG_FILE"
