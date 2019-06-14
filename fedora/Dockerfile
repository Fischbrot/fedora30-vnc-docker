FROM fedora:30

MAINTAINER "Stefan J. / Fischbrot"

#install main packages:

#disabling yum update can get less volume of the docker image

RUN yum -y update && yum clean all

RUN yum -y install lxde-common.noarch \
               lxterminal.x86_64 \
               lxinput.x86_64 \
               lxappearance.x86_64 \
               lxtask.x86_64 && yum clean all
RUN yum -y install liberation-fonts-common.noarch \
               liberation-mono-fonts.noarch \
               liberation-narrow-fonts.noarch \
               liberation-sans-fonts.noarch \
               liberation-serif-fonts.noarch && yum clean all
RUN yum -y install x11vnc.x86_64 \
               xorg-x11-server-Xvfb.x86_64 \
               novnc.noarch \
               midori.x86_64 && yum clean all
RUN yum -y install openssh-server \
               pwgen \
               net-tools \
               supervisor && yum clean all
RUN mkdir -p /var/run/sshd /var/log/supervisor

COPY supervisord.conf /etc/supervisord.conf
#modify some sshd configure
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN sed 's@session\srequired\spam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN useradd --create-home --shell /bin/bash --user-group fedora

ADD ./start.sh /start.sh

EXPOSE 6080
EXPOSE 5900
EXPOSE 22

CMD ["/start.sh"]
