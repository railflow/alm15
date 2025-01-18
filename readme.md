# Instructions

This is for running alm16 in docker on an Ubuntu machine.

1. Installing Git Client
2. Installing Docker
3. Cloning the repo :  ``` git clone https://github.com/railflow/alm16.1.git``` 
4. Accessing to the alm container
5. Execute the installation script

## Note mssql 2017 requires lower kenrnel version of Linux, like [Ubuntu 20.04] (https://releases.ubuntu.com/focal/ubuntu-20.04.6-live-server-amd64.iso)


## Installing Git Client

[Installing Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)


## Installing docker

Install an old docker version for running mssql 2017

### Delete already installed docker if any. Skip if no existing docker installed
```shell 
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get purge docker-ce docker-ce-cli containerd.io
sudo rm -rf /var/lib/docker
``` 

### Intall specific old docker version
```shell 
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-cache madison docker-ce
sudo apt-get install docker-ce=5:26.0.2-1~ubuntu.20.04~focal
``` 

## Build docker image
```shell 
docker build -t railflow/alm16 .
``` 

## Strarting the docker compose

The docker compose file contains the configuration for the alm image that the mssql 2017 image
to start the docker composer use the command 

```shell 
docker compose up
``` 
if you running in this mode you can see the output the of the containers  to access the container as described under you need to open a new termina 

or in silent mode (favorite)

```shell 
docker compose up -d
``` 

to stop the esecution

```shell 
docker compose down
``` 
this will remove the container you will loose all the data.

## Accessing to the alm container

Accessing to the application

http://localhost:8080/qcbin/SiteAdmin.jsp

or

http://yourmachineip:8080/qcbin/SiteAdmin.jsp

user: admin

password:  DAG1YKdQFbwn80sA
