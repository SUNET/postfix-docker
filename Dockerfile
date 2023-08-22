FROM debian:bookworm-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
  postfix postfix-mysql

RUN mkdir /config
RUN mv /etc/postfix/main.cf /etc/postfix/master.cf /config
RUN ln -s /config/master.cf /etc/postfix/master.cf
CMD postfix -v -c /config start-fg
EXPOSE 25/tcp 587/tcp

