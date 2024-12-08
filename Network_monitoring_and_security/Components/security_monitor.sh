#!/bin/bash
# This is a simple intrusion detection system for Garuda Linux

LOG_FILE="/home/chiranjeet/Custom_shell_scripts/system_monitoring/hardware_monitoring/logs/intrusion_monitoring.log" # This is the path to log files
NUM_OF_ATTEMPTS=5 # This is the maximum number of failed login attempts allowed for a specific IP

# Use journalctl to find failed login attempts
sudo journalctl -u sshd -o cat | grep "Failed password" | awk '{print $(NF-3)}' | sort | uniq -c | while read count ip; do
    if [ "$count" -gt "$NUM_OF_ATTEMPTS" ]; then
        # Block IP using iptables
        sudo iptables -A INPUT -s "$ip" -j DROP
        echo "Date: $(date '+%d%m%Y') Time: $(date '+%r') --> Blocked IP: $ip" >> "$LOG_FILE"
    fi
done

