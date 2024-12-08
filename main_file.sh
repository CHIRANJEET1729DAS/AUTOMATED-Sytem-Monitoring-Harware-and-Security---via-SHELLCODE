#!/bin/bash

# Run all hardware monitoring scripts
bash /home/chiranjeet/Custom_shell_scripts/system_monitoring/hardware_monitoring/Components/cpu_monitor.sh &
bash /home/chiranjeet/Custom_shell_scripts/system_monitoring/hardware_monitoring/Components/memory_monitor.sh &
bash /home/chiranjeet/Custom_shell_scripts/system_monitoring/hardware_monitoring/Components/disk_monitor.sh &
bash /home/chiranjeet/Custom_shell_scripts/system_monitoring/hardware_monitoring/Components/network_monitor.sh &

# Run all security monitoring scripts
bash /home/chiranjeet/Custom_shell_scripts/system_monitoring/hardware_monitoring/Components/firewall_monitor.sh &
bash /home/chiranjeet/Custom_shell_scripts/system_monitoring/hardware_monitoring/Components/security_monitor.sh &

echo "System monitoring started. Logs are in the logs/ directory."
