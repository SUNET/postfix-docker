FROM debian:bookworm-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
  postfix postfix-mysql postfix-ldap

RUN mkdir /config
RUN mv /etc/postfix/main.cf /etc/postfix/master.cf /config
COPY start.sh /start.sh
CMD /start.sh
EXPOSE 25/tcp 587/tcp
