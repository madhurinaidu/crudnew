# Use Tomcat base image
FROM tomcat:10.1-jdk17-corretto

# Copy the WAR file into the webapps directory of Tomcat
COPY target/crudwithspringpro-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/

# Expose the port on which Tomcat runs
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]
