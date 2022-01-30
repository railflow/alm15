FROM alpine:latest
RUN apk --no-cache add openjdk8-jre 
RUN java -version
RUN export PATH=$PATH:/usr/lib/jvm/java-1.8-openjdk
RUN export JAVA_PATH=/usr/lib/jvm/java-1.8-openjdk
WORKDIR /usr
RUN mkdir ./Install
RUN mkdir ./Install/ALM
COPY ./installation /usr/Install/ALM
RUN apk add zip
WORKDIR /usr/Install/ALM
RUN : chmod -R 777 /usr/Install/ALM
CMD tail -f /dev/null