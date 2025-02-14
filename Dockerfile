# syntax=docker/dockerfile:1
FROM bitnami/minideb AS base
# Install Faircamp dependencies
RUN install_packages ffmpeg libvips42 curl

RUN mkdir /fc
WORKDIR /fc

ARG VERSION

RUN curl -Lvk https://simonrepp.com/faircamp/packages/faircamp_$VERSION-1+deb12_amd64.deb -o faircamp.deb

# Install Faircamp & dependencies
RUN dpkg --install /fc/faircamp.deb
RUN install_packages
RUN rm /fc/faircamp.deb

# Setup the working folder.
RUN mkdir /data
WORKDIR /data

# Run Faircamp. Any arguments passed to docker will be passed to Faircamp.
ENTRYPOINT ["faircamp"]
