FROM node:14.21-slim

RUN apt-get update \
  && apt-get install -y --no-install-recommends bzip2 pigz


COPY ./dynamic_modules /app/dynamic_modules
COPY ./cloud-npm-downloader /app/cloud-npm-downloader
COPY ./dynamic-modules.sh /app/dynamic-modules.sh
COPY ./PACK_VERSION /app/PACK_VERSION
COPY ./MAJOR_NODE_VERSION /app/MAJOR_NODE_VERSION


WORKDIR /app
RUN sh ./dynamic-modules.sh
