VMware LogInsight Linux Agent
======================

VMware Log Insight linux agent container available on Docker index as ww4vmware/vmware-liagent.

The Log Insight Linux Agent collects events from log files on Linux machines and forwards them to the Log Insight server.
In a Linux system, applications can store log data in flat text files on the file system. The Log Insight Linux Agent can monitor directories and collect events from flat text log files.
The Log Insight Linux Agent runs as a daemon and starts immediately after installation. After installation, you can configure the following options:

■  Select the target Log Insight server to which the Log Insight Linux Agent forwards events.

■  Configure which directories the Log Insight Linux Agent monitors. By default the Log Insight Linux Agent is configured to collect messages and syslog files from the /var/log directory.

[filelog|messages] 
directory=/var/log 
include=messages;messages.? 

[filelog|syslog] 
directory=/var/log 
include=syslog;syslog.? 

The container is based on ubuntu 14.04 and uses supervisor to manage the agent daemon.  

The recommended docker run command for the container:

docker run -d  \ 
   -v /var/lib/loginsight-agent:/var/lib/loginsight-agent \ 
   -v /var/log:/var/log  \ 
   --hostname=\`hostname\`   \ 
   --name liagent  \ 
   -e "LI_SERVER=\<YOUR LOGINSIGHT SERVER\>"  \ 
   ww4vmware/vmware-liagent
   

Details:
-v /var/lib/loginsight-agent:/var/lib/loginsight-agent  <br>Mounts the agent configuration directory from the docker host, this provides easy access for updating or changing the config.  If you want to add additional logfile configurations to the agent, you can create a file called liagent-add.ini in this location on the host prior to running the container, these configs will automatically be added to the configuration file at runtime.  The format of the file will be as shown above.

-v /var/log:/var/log <br>Mounts the docker host /var/log directory from the docker host, all other containers on this host will also have to mount /var/log from the host for the agent to pick them up. Another option is to create a volume and use this --volumes-from option with the other containers.

--hostname=\`hostname\` <br>Will force the container to use the hostname of the docker host so that management of the agent in the UI is easier.

--e "LI_SERVER=\<YOUR LOGINSIGHT SERVER\>" <br>Will set the agent to point to the Log Insight Server

There is no need to specify a command as it is already configured in the Dockerfile.
