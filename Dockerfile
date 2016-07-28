FROM fedora
MAINTAINER Sasha Segal <wester.55@gamil.com>
EXPOSE 10222
RUN dnf -y update && dnf -y install openssh-server
RUN chown -R 1001 /etc/sshd
USER 1001
CMD ["/usr/sbin/sshd", "-D"]
