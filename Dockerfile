FROM debian:bookworm-slim

ARG DEBIAN_FRONTEND=noninteractive
ARG POSTFIX_VERSION=3.7.5-2


RUN apt-get update && apt-get upgrade -y && apt-get install -y \
  postfix=${POSTFIX_VERSION}

RUN mkdir /config
RUN mv /etc/postfix/main.cf /etc/postfix/master.cf /config
CMD postfix -v -c /config start-fg
EXPOSE 25/tcp 587/tcp 993/tcp

