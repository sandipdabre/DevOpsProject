FROM tomcat:latest
RUN echo 'JAVA_OPTS="$JAVA_OPTS $JSSE_OPTS -Djava.security.egd=file:/dev/./urandom"' >> /usr/local/tomcat/bin/catalina.sh
COPY target/sampleapp.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
#
