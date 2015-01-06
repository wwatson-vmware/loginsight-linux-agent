#!/bin/bash
#Script for installing LIAGENT within Ubuntu Container

echo "Log Insight Server is $LI_SERVER"
echo "Running agent install..."

# 1. Install liagent using LI_SERVER environment variable to set server location.
SERVERHOST=$LI_SERVER /tmp/vmware-liagent-250.bin

echo "Agent is running"
echo "Read in any additional configs"

#2. Add logging configs if liagent-add.ini is present in /var/lib/loginsight-agent
if [ -e /var/lib/loginsight-agent/liagent-add.ini ]
then
	echo "File is present, adding configs to liagent.ini"
	(echo -e "\n\n"; cat /var/lib/loginsight-agent/liagent-add.ini) >> /var/lib/loginsight-agent/liagent.ini
	mv /var/lib/loginsight-agent/liagent-add.ini /var/lib/loginisght-agent/liagent-add.used
else
	echo "File not accessible, moving on"
fi

# 3. Restart the agent using the supervisord process
supervisord -c /etc/supervisor.conf

exit
