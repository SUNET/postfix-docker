FROM debian:bookworm-slim

ARG DEBIAN_FRONTEND=noninteractive
ARG POSTFIX_VERSION=3.7.5-2


RUN apt-get update && apt-get upgrade -y && apt-get install -y \
  postfix=${POSTFIX_VERSION}

RUN mkdir /config
RUN mv /etc/postfix/main.cf /etc/postfix/master.cf /config
RUN ln -s /config/main.cf /etc/postfix/main.cf
RUN ln -s /config/master.cf /etc/postfix/master.cf
EXPOSE 25/tcp 587/tcp 993/tcp

