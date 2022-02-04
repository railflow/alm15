# Instructions

## Buildind the docker image

to build the docker image plese execute this command

```shell 
docker build -t railflow/alm15 .
``` 

## Strarting the docker compose

The docker compose file contains the configuration for the alm image that the mssql 2017 image
to start the docker composer use the command 

```shell 
docker-compose up
``` 
or in silent mode

```shell 
docker-compose up -d
``` 

to stop the esecution

```shell 
docker-compose down
``` 
this will remove the container you will loose all the data.

## Accessing to the alm container

To access the running container to start the installation of alm 

```shell 
docker exec -it AlmService  bash
```
once inside 

```shell 
root@1a7a7a55d5cd:/usr/Install/ALM# ./install_run.sh
```
this operation has to be done each time the docker-compose is restarted 

Accessing to the application

http://localhost:8080/qcbin/SiteAdmin.jsp

user: admin

password:  DAG1YKdQFbwn80sA
