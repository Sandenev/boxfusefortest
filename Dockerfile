#Using base image Tomcat9 with AdoptOpenJDK11
#образ прода для боксфьюза
#запускается внутри сборочного контейнера и пушится в репозиторий
#откуда позже подтягивается для самостоятельного запуска
FROM tomcat:9.0.43-jdk11-adoptopenjdk-openj9
COPY target/hello-1.0.war /usr/local/tomcat/webapps