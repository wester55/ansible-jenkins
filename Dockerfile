FROM fedora
MAINTAINER Sasha Segal <wester.55@gamil.com>

RUN dnf -y update && dnf -y install openssh-server
EXPOSE 10222
CMD ["/usr/sbin/sshd", "-D"]
