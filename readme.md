# Microservices Demo with Docker

In this demo, we will make use of 3 docker containers. One docker container (app-web) will be accessible by enduser. The other two containers will be running NodeJS REST web services. To reach these services we will be making use of path-based routing, i.e., if the user requests for URL `http://localhost:8080/`, then the app0 container will serve the request, but, if the user requests for `http://localhost:8080/s1/`, app1 container will serve the request. 

The app-web container is a ngnix proxy that maps the URLs to the containers (app0 and app1). app0 and app1 are web servers running nodeJS and they may be running on different domains/servers. 

To achieve this, we will make use of docker networking, specifically a bridge network. Bridge networks are used when your applications run in standalone containers that need to communicate. In terms of Docker, a bridge network uses a software bridge which allows containers connected to the same bridge network to communicate, while providing isolation from containers which are not connected to that bridge network. The Docker bridge driver automatically installs rules in the host machine so that containers on different bridge networks cannot communicate directly with each other (source: [1](https://docs.docker.com/network/bridge/)). User-defined bridges provide automatic DNS resolution between containers.

## List of containers 

- app0 -> this is a microservice that will run at GET /
- app1 -> this is a microservice that will run at GET /s1
- app-web -> this will be a ngnix proxy at localhost:8000

## Create a docker bridge network

- `docker network create my-network`

## Build and start app0

- `cd service0`
- `docker build -t demo/app0 .`
- `docker run -d --network my-network --name service0 demo/service0`

## Build and start app1

- `cd service1`
- `docker build -t demo/app1 .`
- `docker run -d --network my-network --name service1 demo/service1`

## Build and start app-web

- `cd app-web`
- `docker build -t demo/app-web .`
- `docker run --network my-network -p 8000:80 demo/app-web`