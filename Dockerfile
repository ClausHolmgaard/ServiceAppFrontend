FROM node:14-alpine

WORKDIR /app

RUN npm install -g @angular/cli

COPY service-app-web/package.json .

RUN npm install

COPY service-app-web .

CMD ["ng", "serve", "--host", "0.0.0.0"]