FROM tomcat:9-jdk8
WORKDIR /app
COPY target/multi-Netflix-1.2.4.war /usr/local/tomcat/Root.war
RUN useradd -r appuser
USER appuser
EXPOSE 8080 
ENTRYPOINT ["catalina","run"]
