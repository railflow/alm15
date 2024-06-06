FROM adoptopenjdk/openjdk8 as alm-source

WORKDIR /usr/Install/ALM/installation
RUN apt-get update -y \
    && apt-get install -y unzip wget
RUN wget --quiet https://railflow.sfo3.digitaloceanspaces.com/downloads/alm-24.zip \
    && unzip alm-24.zip \
    && rm alm-24.zip

FROM adoptopenjdk/openjdk8 as alm-install

ENV JAVA_HOME /opt/java/openjdk
ENV MICRO_FOCUS_JAVA_PATH /opt/java/openjdk

COPY --from=alm-source /usr/Install/ALM/installation/ALM_24.1_Linux_English /usr/Install/ALM/installation
WORKDIR /usr/Install/ALM/installation
COPY validations.xml ./script/install_run.sh wait-for-it.sh qcConfigFile.properties ./
RUN chmod +x ALM_installer.bin install_run.sh run_silent.sh

EXPOSE 8080
CMD ["bash", "./install_run.sh"]
