FROM node:14-alpine AS builder

WORKDIR /app

RUN npm install -g @angular/cli

COPY service-app-web/package.json .

RUN npm install

#COPY service-app-web .

#CMD ["ng", "serve", "--host", "0.0.0.0"]
CMD ["tail", "-f", "/dev/null"]


FROM node:14-alpine AS production

WORKDIR /app

COPY --from=builder /app .

COPY service-app-web .

# Dont use ng serve
CMD ["ng", "serve", "--host", "0.0.0.0"]

