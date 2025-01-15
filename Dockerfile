FROM ubuntu:16.04
RUN  sed -i.bak -r 's!(deb|deb-src) \S+!\1 mirror://mirrors.ubuntu.com/mirrors.txt!' /etc/apt/sources.list \
    && apt-get update  -y \
    && apt-get install -y software-properties-common \
    && add-apt-repository ppa:openjdk-r/ppa \
    && apt-get install -y openjdk-8-jdk \
    && rm -rf /var/lib/apt/lists/*

# java
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV MICRO_FOCUS_JAVA_PATH /usr/lib/jvm/java-8-openjdk-amd64


RUN mkdir -p /usr/Install/ALM
COPY ./installation /usr/Install/ALM
COPY ./script/install_run.sh /usr/Install/ALM
RUN apt-get update  -y \
    && apt-get install -y zip unzip
WORKDIR /usr/Install/ALM
RUN chmod -R 777 /usr/Install/ALM
EXPOSE 8080
CMD ["tail", "-f", "/dev/null"]


#RUN mkdir ./Install
#RUN mkdir ./Install/ALM
#COPY ./installation /usr/Install/ALM
#COPY ./script/install_run.sh /usr/Install/ALM
#RUN apt-get update  -y \
#    && apt-get install -y zip unzip
#WORKDIR /usr/Install/ALM
#RUN  chmod -R 777 /usr/Install/ALM
#EXPOSE 8080
#CMD tail -f /dev/null
