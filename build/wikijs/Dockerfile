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

COPY config/* ./

EXPOSE 80

ENTRYPOINT ["/usr/bin/supervisord", "-c", "supervisord.conf"]
