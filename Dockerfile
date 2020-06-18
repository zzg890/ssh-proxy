FROM ubuntu:latest
ENV COW_INSTALLDIR = /usr/local/bin
RUN apt update
RUN apt install -y curl
RUN curl -L git.io/cow | bash
VOLUME /root/.ssh/id_rsa
ARG host
ARG user
RUN echo 'listen http://127.0.0.1:7777\n \
sshServer = ${user}@${host}:7779\n' > root/.cow/rc
ENTRYPOINT [ "/usr/local/bin/cow" ]