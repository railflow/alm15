FROM ubuntu:16.04
RUN  sed -i.bak -r 's!(deb|deb-src) \S+!\1 mirror://mirrors.ubuntu.com/mirrors.txt!' /etc/apt/sources.list \
    && apt-get update  -y \
    && apt-get install -y software-properties-common \
    && add-apt-repository ppa:openjdk-r/ppa \
    && apt-get install -y openjdk-8-jdk \
    && apt-get install -y wget \
    && rm -rf /var/lib/apt/lists/*

# java
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV MICRO_FOCUS_JAVA_PATH /usr/lib/jvm/java-8-openjdk-amd64

RUN mkdir ./Install
RUN mkdir ./Install/ALM
RUN mkdir ./Install/ALM/installation
RUN apt-get update  -y \
    && apt-get install -y zip unzip
WORKDIR /usr/Install/ALM
RUN wget https://shit.sfo3.digitaloceanspaces.com/ALM_16.0_Linux_English.zip && unzip ALM_16.0_Linux_English.zip
COPY ./validations.xml /usr/Install/ALM/
COPY ./qcConfigFile.properties /usr/Install/ALM/
COPY ./script/install_run.sh /usr/Install/ALM/
COPY ./wait-for-it.sh /usr/Install/ALM/
RUN chmod -R 777 /usr/Install/ALM/*
EXPOSE 8080
CMD tail -f /dev/null
