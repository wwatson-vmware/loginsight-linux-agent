#! /bin/bash

docker run -d -v /var/lib/loginsight-agent:/var/lib/loginsight-agent -v /var/log:/var/log --hostname=`hostname` --name liagent  -e "LI_SERVER=192.168.1.17" ww4vmware/vmware-liagent

