#!/bin/bash

LOG_FILE="/home/chiranjeet/Custom_shell_scripts/system_monitoring/hardware_monitoring/logs/network_monitoring.log" # so here is our log file address for keeping monitoring records
BANDWIDTH_LIMIT=100000 # and here I have hardcoded the bandwidth_limit for demonstration purpose

# plan is to first calculate the no. of receiving/transmitting bytes/sec at say t0 sec and then at t0+1 sec, then use it to calculate the rate via (Final-initial) formula it will give us the bandwidth we need

while true; do
    RX_t0=$(cat /sys/class/net/eno1/statistics/rx_bytes) # initial receiving bytes/sec
    TX_t0=$(cat /sys/class/net/eno1/statistics/tx_bytes) # initial transmitting bytes/sec
    sleep 1
    RX_t1=$(cat /sys/class/net/eno1/statistics/rx_bytes) # final receiving bytes/sec
    TX_t1=$(cat /sys/class/net/eno1/statistics/tx_bytes) # final transmitting bytes/sec

    RX_rate=$(( (RX_t1 - RX_t0) / 1024 )) # dividing by 1024 to convert into kb/sec
    TX_rate=$(( (TX_t1 - TX_t0) / 1024 ))

    if (( RX_rate > BANDWIDTH_LIMIT || TX_rate > BANDWIDTH_LIMIT )); then
        echo "Date : $(date '+%d%m%Y') and Time : $(date '+%r') --> High bandwidth usage receiving_rate: ${RX_rate}kb/s and transmitting_rate: ${TX_rate}kb/s" >> "$LOG_FILE"
    fi
done
