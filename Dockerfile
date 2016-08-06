FROM fedora:latest
MAINTAINER Sasha Segal <wester.55@gamil.com>
EXPOSE 22 8080
RUN dnf -y update && dnf -y install openssh-server openssh-clients python python2-dnf psmisc
# Debug tools, comment if not needed
RUN dnf -y install procps-ng net-tools
RUN sshd-keygen && ssh-keygen -f /root/.ssh/id_rsa -q -P "" && echo "PubkeyAcceptedKeyTypes=+ssh-dss" >> /etc/ssh/sshd_config
RUN echo 'root:fedora' | chpasswd
CMD ["/usr/sbin/sshd", "-D", "-E", "/var/log/sshd.log"]
