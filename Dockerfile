FROM tomcat:latest

# Install haveged to increase entropy
RUN apt-get update \
    && apt-get install -y haveged \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Add the JAVA_OPTS line before copying the WAR file
RUN echo 'JAVA_OPTS="$JAVA_OPTS $JSSE_OPTS -Djava.security.egd=file:/dev/./urandom"' >> /usr/local/tomcat/bin/catalina.sh

COPY target/sampleapp.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
