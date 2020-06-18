FROM ubuntu:latest
WORKDIR /root
ENV COW_INSTALLDIR = /root
RUN apt update
RUN apt install -y curl
RUN curl -L git.io/cow | bash
VOLUME ["/root/.ssh/id_rsa","/root/.cow/rc"] 
RUN echo 'listen http://127.0.0.1:7777\n \
sshServer = ${ssh-host}}:7779\n' > /root/.cow/rc
ENTRYPOINT [ "/root/cow" ]