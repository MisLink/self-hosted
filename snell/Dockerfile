FROM ubuntu:24.04

RUN apt-get update && apt-get install -y wget unzip ca-certificates \
  && wget https://github.com/a8m/envsubst/releases/download/v1.2.0/envsubst-Linux-x86_64 -O /usr/local/bin/envsubst \
  && chmod +x /usr/local/bin/envsubst

WORKDIR /app

ARG VERSION=v4.0.1

RUN wget https://dl.nssurge.com/snell/snell-server-${VERSION}-linux-amd64.zip -O snell.zip \
  && unzip snell.zip \
  && rm snell.zip \
  && mv snell-server /usr/local/bin/snell-server

COPY snell-server.conf snell-server.conf
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
