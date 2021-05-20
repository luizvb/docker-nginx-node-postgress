FROM node:carbon
WORKDIR /usr/src/app
COPY application/package*.json ./
RUN npm install
COPY ./application/ .
RUN npm install -g bower
COPY application/bower.json ./
RUN bower install --allow-root
EXPOSE 3090
CMD ["node", "server.js"]