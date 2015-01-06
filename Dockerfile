FROM quintenk/supervisor
MAINTAINER Wayne Watson - VMware "wwatson@vmware.com"
ENV LI_SERVER loginsight
ADD pkgs/vmware-liagent-250.bin /tmp/vmware-liagent-250.bin
ADD pkgs/run.sh /tmp/run.sh
ADD conf/liagent.sv.conf /etc/supervisor/conf.d/liagent.sv.conf
CMD /tmp/run.sh 
