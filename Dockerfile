FROM node:12.0.0

RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list
RUN apt-get update \
  && apt-get upgrade -y --force-yes \
  && apt-get install -y --force-yes git

RUN npm install -g --unsafe-perm node-red

RUN useradd -ms /bin/bash nodered

COPY ./activageas /home/nodered/activageas

WORKDIR /home/nodered

RUN chown -R nodered:nodered /home/nodered/activageas

USER nodered

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
  && npm install node-red-contrib-counter \
  && npm install node-red-contrib-play-audio \
  && npm install node-red-node-email

ADD gui .node-red/

RUN mkdir data

EXPOSE 1880

CMD ["node-red"]
