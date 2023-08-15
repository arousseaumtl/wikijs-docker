FROM debian:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install --no-install-recommends -y \
        ca-certificates \
        curl \
        nodejs \
        supervisor \
    && groupadd wikijs \
    && useradd -g wikijs -m wikijs

WORKDIR /home/wikijs
USER wikijs

RUN curl -sL https://github.com/Requarks/wiki/releases/latest/download/wiki-js.tar.gz \
        -o wiki-js.tar.gz \
    && tar xzf wiki-js.tar.gz

COPY config/config.yml .
COPY config/supervisord.conf /etc/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
