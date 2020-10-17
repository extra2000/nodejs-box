FROM ubuntu:20.04
MAINTAINER extra2000 <https://github.com/extra2000>

USER root

ENV HOME /root
WORKDIR ${HOME}

ENV NODE_VERSION 12.18.4
ENV NVM_DIR /usr/local/nvm
ENV NODE_PATH ${NVM_DIR}/versions/node/v{$NODE_VERSION}/lib/node_modules
ENV PATH ${NVM_DIR}/versions/node/v${NODE_VERSION}/bin:${PATH}
RUN mkdir ${NVM_DIR}

# Install NVM which automatically install NodeJS with version specified by ${NODE_VERSION}
RUN apt update && apt install -y curl
RUN curl -o /opt/nvm-installer.sh -L https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh
RUN bash /opt/nvm-installer.sh

COPY ./project /srv/project
WORKDIR /srv/project
RUN npm install
ENTRYPOINT npm run dev
