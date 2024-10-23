# Use the Maven image to build the application
FROM maven:3.9.9 AS build

# Set the working directory for the build
WORKDIR /app

# Copy the pom.xml and source files to the working directory
COPY pom.xml .
COPY src ./src

# Package the application as a WAR file, skipping tests
RUN mvn clean package -DskipTests

# Use Tomcat 10.1 with OpenJDK 17 as the base image for the runtime
FROM tomcat:10.1-jdk17-openjdk-slim

# Copy the WAR file from the build stage to the Tomcat webapps directory
COPY --from=build /app/target/crudwithspringpro-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/spring-boot-ec2-starter.war

# Expose the default Tomcat port
EXPOSE 8080

# The default command to run Tomcat is already defined in the Tomcat base image






