From tomcat:latest-slim
WORKDIR /app
RUN pip -r requirements.txt 
COPY target/multi-Netflix-1.2.4.war /usr/local/tomcat/Root.war
RUN useradd -r appuser
USER appuser
EXPOSE 8080 
ENTRYPOINT ["sh","catalina"]
