#!/bin/bash
# This shell script sends alerts from the log files in a concatenated form to the given email.

#!/bin/bash
EMAIL="chiranjeetdas73@gmail.com"  # your email
SUBJECT="System Monitoring Data"   # subject of the mail
LOGS_DIR="/home/chiranjeet/Custom_shell_scripts/system_monitoring/hardware_monitoring/logs/"  # logs directory

cat "$LOGS_DIR"/*.log | mailx -s "$SUBJECT" "$EMAIL"  # send the logs as email
echo "Alerts sent to the email: $EMAIL"
