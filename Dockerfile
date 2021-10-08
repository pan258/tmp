FROM gmaindol/registry.access.redhat.com-ubi8-ubi-minimal:8.4-210
USER root
WORKDIR /app
#download amazon corretto from https://docs.aws.amazon.com/corretto/latest/corretto-8-ug/downloads-list.html
RUN appt-get install wget -y
RUN wget https://corretto.aws/downloads/latest/amazon-corretto-8-x64-linux-jdk.rpm
RUN rpm -i java-1.8.0-amazon-corretto-devel-1.8.0_302.b08-1.x86_64.rpm \
	&& rm -rf /app/ 
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} /opt/pmadmin/app.jar
ENTRYPOINT ["java","-jar","/opt/pmadmin/app.jar"]
