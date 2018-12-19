FROM node:8.0.0

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y git

RUN npm install -g --unsafe-perm node-red

RUN useradd -ms /bin/bash nodered

WORKDIR /home/nodered

USER nodered

RUN git clone https://noder:noder@git.activageproject.eu/noder/activageas.git && cd activageas && git checkout stable-demo-geneva

RUN git clone https://github.com/interiot/RedMap

RUN mkdir ~/.node-red

RUN cd ~/.node-red \
  && npm install ~/activageas/node-red-contrib-position-simu \
  && npm install ~/activageas/node-red-contrib-proton-fiware-cep \
  && npm install ~/activageas/node-red-contrib-PRO/Fiware-sth \
  && npm install ~/activageas/node-red-PCS \
  && npm install ~/RedMap \
  && npm install node-red-dashboard \
  && npm install node-red-contrib-counter

ADD gui .node-red/

RUN mkdir data

EXPOSE 1880

CMD ["node-red"]
