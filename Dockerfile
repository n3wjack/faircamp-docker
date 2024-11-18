# syntax=docker/dockerfile:1
FROM bitnami/minideb:bookworm
RUN install_packages curl ffmpeg libvips42
ARG FAIRCAMP_VERSION="0.20.1-1+deb12"
RUN curl \
  -Lvk https://simonrepp.com/faircamp/packages/faircamp_${FAIRCAMP_VERSION}_amd64.deb \
  -o /tmp/faircamp.deb; \
  dpkg -i /tmp/faircamp.deb; install_packages
SHELL ["/usr/bin/bash", "-c"]
ARG PROPER_UID=1000 PROPER_GID=1000
RUN groupadd -g $PROPER_GID faircamp
RUN useradd -u $PROPER_UID -g faircamp faircamp
RUN mkdir /music /web /data /cache
WORKDIR /data
RUN chown faircamp:faircamp /music /web /data /cache
USER faircamp
ENTRYPOINT [ "faircamp"]
