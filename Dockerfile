FROM node:14-alpine AS app0
WORKDIR /usr/src/app
COPY /service0/package.json .
COPY /service0/package-lock.json .
RUN npm install
COPY /service0/. .
EXPOSE 3000
CMD ["node", "index.js"]

FROM node:14-alpine AS app1
WORKDIR /usr/src/app
COPY /service1/package.json .
COPY /service1/package-lock.json .
RUN npm install
COPY /service1/. .
EXPOSE 3001
CMD ["node", "index.js"]

FROM nginx AS proxy
COPY /app-web/default.conf /etc/nginx/conf.d/
