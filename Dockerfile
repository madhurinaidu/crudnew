# Use the Tomcat base image
FROM tomcat:10.1-jdk17

# Set working directory inside the container
WORKDIR /usr/local/tomcat

# Copy the WAR file to the container's Tomcat webapps directory and rename it to ROOT.war
COPY target/ crudwithspringpro-0.0.1-SNAPSHOT.war  /usr/local/tomcat/webapps/ROOT.war

# Expose the Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
