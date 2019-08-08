FROM node:10-alpine
RUN mkdir -p /var/nodeapp/node_modules && chown -R node:node /var/nodeapp
WORKDIR /var/nodeapp/
COPY package*.json ./
USER node
RUN npm install
COPY --chown=node:node . .
EXPOSE 8080
CMD [ "node", "src/app.js" ]
