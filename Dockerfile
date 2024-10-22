FROM openjdk:17-jdk-alpine

# Copy the WAR file from the previous build stage
COPY target/crudwithspringpro-0.0.1-SNAPSHOT.war /spring-boot-ec2-starter.war

# Set the entry point to run the WAR file
ENTRYPOINT ["java", "-jar", "/spring-boot-ec2-starter.war"]






