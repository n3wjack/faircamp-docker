# syntax=docker/dockerfile:1
FROM debian:bookworm-slim as base
RUN apt-get update

FROM base as build

RUN mkdir /fc
WORKDIR /fc

RUN apt-get install curl -y
RUN curl https://simonrepp.com/faircamp/packages/faircamp_0.14.0-1+deb12_amd64.deb -o faircamp.deb

FROM base as final

COPY --from=build /fc/faircamp.deb .

# Install Faircamp & dependencies
RUN apt-get install ffmpeg libvips42 -y
RUN dpkg --install faircamp.deb
RUN rm faircamp.deb

# Setup the working folder.
RUN mkdir /data
WORKDIR /data

# Run Faircamp. Any arguments passed to docker will be passed to Faircamp.
ENTRYPOINT [ "faircamp"]
