# Use OpenJDK base image
FROM openjdk:17-jdk-slim

# Copy the JAR file into the container
COPY target/crudwithspringpro-0.0.1-SNAPSHOT.war.jar /app.jar

# Specify the command to run the JAR
ENTRYPOINT ["java", "-jar", "/app.jar"]

# Expose the port your application runs on
EXPOSE 8080
