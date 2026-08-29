FROM tomcat:9-jdk8
WORKDIR /app
RUN apt-get install -y pip3 && pip3 -r requirements.txt 
COPY target/multi-Netflix-1.2.4.war /usr/local/tomcat/Root.war
RUN useradd -r appuser
USER appuser
EXPOSE 8080 
ENTRYPOINT ["sh","catalina"]
