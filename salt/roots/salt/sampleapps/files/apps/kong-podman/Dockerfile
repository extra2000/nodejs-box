FROM ubuntu:18.04
MAINTAINER extra2000 <https://github.com/extra2000>

USER root

# Install NodeJS
RUN apt update && apt install -y curl \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt update && apt install -y nodejs

# Copy source
COPY ./webservice /srv/webservice
WORKDIR /srv/webservice

# Build source
RUN npm install

EXPOSE 10000
ENV HOME=/srv/webservice
ENTRYPOINT npm run webservice
