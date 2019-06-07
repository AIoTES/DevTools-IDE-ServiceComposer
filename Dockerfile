FROM node:8.0.0

RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list
RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y git

RUN npm install -g --unsafe-perm node-red

RUN useradd -ms /bin/bash nodered

WORKDIR /home/nodered

USER nodered

RUN git clone https://noder:noder@git.activageproject.eu/noder/activageas.git && cd activageas && git checkout activage

RUN git clone https://github.com/interiot/RedMap

RUN mkdir ~/.node-red

RUN cd ~/.node-red \
  && npm install ~/activageas/node-red-contrib-as2as-ipsm \
  && npm install ~/activageas/node-red-contrib-as2as-position-simu \
  && npm install ~/activageas/node-red-contrib-as2as-proton-fiware-cep \
  && npm install ~/activageas/node-red-contrib-as2as-sth/node-red-contrib-as2as-STH \
  && npm install ~/activageas/node-red-contrib-as2as-pcs \
  && npm install ~/activageas/mw2mw-api \
  && npm install ~/activageas/ipsm-api \
  && npm install ~/activageas/influxdb-api \
  && npm install ~/activageas/fiware-orion \
  && npm install ~/activageas/universaal \
  && npm install ~/activageas/mwtranslatoractivage \
  && npm install ~/activageas/mwtranslatoractivageconfig \
  && npm install ~/RedMap \
  && npm install node-red-dashboard \
  && npm install node-red-contrib-counter

ADD gui .node-red/

RUN mkdir data

EXPOSE 1880

CMD ["node-red"]
