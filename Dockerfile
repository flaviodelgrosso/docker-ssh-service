FROM ubuntu:latest

ARG SSH_USER
ARG SSH_PWD

RUN apt update && apt install openssh-server sudo -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ${SSH_USER} 

RUN  echo "${SSH_USER}:${SSH_PWD}" | chpasswd

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]