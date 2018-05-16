# Alpine Python 2.7
FROM jfloff/alpine-python:2.7-slim

RUN mkdir -p /opt /config && \
    echo 'http://dl-cdn.alpinelinux.org/alpine/v3.7/community' >> /etc/apk/repositories && \
    apk update && \
    apk add --no-cache \
      docker \
      git \
      gcc \
      python-dev \
      linux-headers \
      musl-dev && \
    git clone https://github.com/l3uddz/plex_autoscan /opt/plex_autoscan && \
    cd /opt/plex_autoscan && \
    pip install -r requirements.txt && \
    apk del \
      git \
      gcc \
      python-dev \
      linux-headers \
      musl-dev

COPY startup.sh /opt/startup.sh
EXPOSE 3467
ENTRYPOINT ["/bin/bash", "/opt/startup.sh"]
