FROM tomcat:9-jdk8

RUN useradd -r -m appuser

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/multi-Netflix-1.2.4.war \
     /usr/local/tomcat/webapps/multi-Netflix-1.2.4.war

RUN chown -R appuser:appuser /usr/local/tomcat

USER appuser

EXPOSE 8080

ENTRYPOINT ["catalina.sh", "run"]
