FROM nginx AS proxy
COPY /app-web/default.conf /etc/nginx/conf.d/
