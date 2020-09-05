# Microservices Demo with Docker

This is a demo on the concept of microservices using docker. In this demo we make use of 3 docker containers. In these containers, only one is accessable by end user, while the rest of the containers will serve on a specific restAPI base path. The user will request for url `http://localhost:8080/`, and app0 container will serve the request. When the url changes to `http://localhost:8080/s1/`, app1 container will serve the request. Each container doing a specific service. In this case app-web mapping the url to the container services acting as web servers from user side, but is a nginx proxy service technically. Similarly, app0 and app1 being web services to user, but are web servers based on nodeJS running on different domains/servers technically. 

## List of containers 

- app0 -> this is a microservice that will run at GET /
- app1 -> this is a microservice that will run at GET /s1
- app-web -> this will run a linking microservice that runs at localhost:8080

## Start app0

- `docker build --target app0 -t app0 .`
- `docker run -d --name service0 app0`

## Start app1

- `docker build --target app1 -t app1 .`
- `docker run -d --name service1 app1`

## Start app-web

- `docker build --target proxy -t app-web .`
- `docker run -d -p 8080:80 --link service0:service0 --link service1:service1 --name proxy app-web`