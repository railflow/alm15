# Instructions

1. Installing Git Client
2. Installing Docker and Docker Compose
3. Cloning the repo :  ``` git clone https://github.com/railflow/alm15.git``` 
5. Building docker image
4. Starting docker-compose ( silence mode)
a
## Installing Git Client

[Installing Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)


## Installing docker

Please follow the instruction on the links

[Installing Docker](https://docs.docker.com/engine/install/)

for Windows user make sure that your version is professional one.

For Linux user you need to install also docker compose

[Installing Docker-compose](https://docs.docker.com/compose/install/)

## Building docker image

To build docker image run:

```shell
docker build -t railflow/alm15 .
```

## Strarting the docker compose

The docker compose file contains the configuration for the alm image that the mssql 2017 image
to start the docker composer use the command 

```shell 
docker-compose up
``` 
if you running in this mode you can see the output the of the containers  to access the container as described under you need to open a new termina 

or in silent mode (favorite)

```shell 
docker-compose up -d
``` 
Once the docker-compose is up, it will install ALM automatically, you can examine installation logs in `/var/opt/Micro Focus/ALM/log/` directory

to stop the execution

```shell 
docker-compose down
``` 
this will remove the container you will loose all the data.

## Accessing to the alm container

To access the running container to start the installation of alm 

```shell 
docker exec -it AlmService  bash
```

Accessing to the application

http://localhost:8080/qcbin/SiteAdmin.jsp

or

http://yourmachineip:8080/qcbin/SiteAdmin.jsp

user: almadmin

password:  password8931
