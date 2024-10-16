# Use the official Tomcat 10.1 image
FROM tomcat:10.1

# Copy your WAR file to the webapps directory
COPY target/crudwithspringpro.war /usr/local/tomcat/webapps/

# Set the working directory (optional)
WORKDIR /usr/local/tomcat

# Health check command
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD curl --fail http://localhost:8080/crudwithspringpro/ || exit 1

# Expose the port
EXPOSE 8080

# Run the Tomcat server
CMD ["catalina.sh", "run"]
