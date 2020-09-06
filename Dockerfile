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
