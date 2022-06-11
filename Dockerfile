FROM tomcat:latest

LABEL maintainer="Suresh M"

ADD ./target/LoginWebApp-1.war /usr/local/tomcat/webapps/

EXPOSE 8080

EXPOSE 3306

CMD ["catalina.sh", "run"]
