FROM ubuntu:24.04

RUN apt-get update && apt-get install -y wget unzip ca-certificates gettext \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

ARG VERSION=v4.0.1

RUN wget https://dl.nssurge.com/snell/snell-server-${VERSION}-linux-amd64.zip -O snell.zip \
  && unzip snell.zip \
  && rm snell.zip \
  && mv snell-server /usr/local/bin/snell-server

COPY snell-server.conf.tmpl snell-server.conf.tmpl
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
