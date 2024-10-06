# Use the official Tomcat 10 image as the base image
FROM tomcat:10.1-jdk17

# Set the environment variables for the container
ENV TZ=UTC

# Remove the default webapps to avoid conflicts
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file to the Tomcat webapps directory
COPY target/crudwithspringpro-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/crudwithspringpro.war

# Expose the default Tomcat port
EXPOSE 8080

# Start the Tomcat server
CMD ["catalina.sh", "run"]