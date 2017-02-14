FROM ubuntu:16.04
MAINTAINER Sinan Goo

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd

RUN sed -i 's/\#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
RUN sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config
RUN useradd foo -m -g 500 -u 500 -s /bin/bash && mkdir /home/foo/.ssh && chown foo:foo /home/foo/.ssh && chmod go-rwx /home/foo/.ssh

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]

