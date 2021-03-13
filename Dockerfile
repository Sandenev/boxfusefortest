#Using base image Tomcat9 with AdoptOpenJDK11
#образ прода для боксфьюза
#запускается внутри сборочного контейнера и пушится в репозиторий
#откуда позже подтягивается для самостоятельного запуска
FROM adoptopenjdk/openjdk11:alpine-slim
RUN apk update
RUN apk add wget
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME
RUN wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.44/bin/apache-tomcat-9.0.44.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.44/* /usr/local/tomcat/
EXPOSE 8080
COPY target/hello-1.0.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]
