FROM quintenk/supervisor
MAINTAINER Wayne Watson - VMware "wwatson@vmware.com"
ADD pkgs/vmware-liagent-250.bin /tmp/vmware-liagent-250.bin
RUN /tmp/vmware-liagent-250.bin
ADD conf/liagent.sv.conf /etc/supervisor/conf.d/liagent.sv.conf
CMD supervisord -c /etc/supervisor.conf && logger service liagentd status 
