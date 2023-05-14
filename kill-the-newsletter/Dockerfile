FROM debian:11-slim

RUN apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

ARG VERSION=v1.0.1

RUN wget https://github.com/leafac/kill-the-newsletter/releases/download/${VERSION}/kill-the-newsletter--linux--${VERSION}.tgz -O kill-the-newsletter.tgz \
  && tar xzvf kill-the-newsletter.tgz \
  && rm kill-the-newsletter.tgz \
  && mv kill-the-newsletter /usr/bin/kill-the-newsletter \
  && chmod +x /usr/bin/kill-the-newsletter \
  && mkdir -p /etc/kill-the-newsletter

COPY config.js /etc/kill-the-newsletter/config.js

CMD ["kill-the-newsletter", "/etc/kill-the-newsletter/config.js"]
