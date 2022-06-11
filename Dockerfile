FROM tomcat:latest

LABEL maintainer="Suresh M"

ADD ./target/LoginWebApp-1.war /usr/local/tomcat/webapps/

RUN export CLASSPATH=/usr/share/java/mysql-connector-java-5.1.30.jar:$CLASSPATH

EXPOSE 8080

EXPOSE 3306

CMD ["catalina.sh", "run"]
