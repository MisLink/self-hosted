FROM debian:11-slim

ARG VERSION=v4.0.1

RUN apt-get update \
  && apt-get install -y wget unzip \
  && rm -rf /var/lib/apt/lists/*

RUN wget https://dl.nssurge.com/snell/snell-server-${VERSION}-linux-amd64.zip -O snell.zip \
  && unzip snell.zip \
  && rm snell.zip \
  && mv snell-server /usr/bin/snell-server \
  && chmod +x /usr/bin/snell-server \
  && mkdir -p /etc/snell

CMD ["snell-server", "-c", "/etc/snell/snell-server.conf"]
