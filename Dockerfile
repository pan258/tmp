FROM gmaindol/registry.access.redhat.com-ubi8-ubi-minimal:8.4-210
USER root
WORKDIR /app
#download amazon corretto from https://docs.aws.amazon.com/corretto/latest/corretto-8-ug/downloads-list.html
COPY amazon-corretto-8.rpm  .
RUN rpm -i amazon-corretto-8.rpm \
	&& rm -rf /app/ 
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} /opt/pmadmin/app.jar
ENTRYPOINT ["java","-jar","/opt/pmadmin/app.jar"]
