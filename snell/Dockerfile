FROM debian:11-slim

ARG VERSION=v4.0.1

RUN apt-get update \
  && apt-get install -y wget unzip \
  && rm -rf /var/lib/apt/lists/* \
  && wget https://github.com/a8m/envsubst/releases/download/v1.2.0/envsubst-$(uname -s)-$(uname -m) -O /usr/local/bin/envsubst \
  && chmod +x /usr/local/bin/envsubst

RUN wget https://dl.nssurge.com/snell/snell-server-${VERSION}-linux-amd64.zip -O snell.zip \
  && unzip snell.zip \
  && rm snell.zip \
  && mv snell-server /usr/bin/snell-server \
  && chmod +x /usr/bin/snell-server \
  && mkdir -p /etc/snell

COPY snell-server.conf /etc/snell/snell-server.conf

CMD envsubst -no-unset -no-empty -i /etc/snell/snell-server.conf -o /etc/snell/snell-server.conf && snell-server -c /etc/snell/snell-server.conf
