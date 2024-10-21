# Use the latest Maven image for building
FROM maven:latest AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml and source files
COPY pom.xml .
COPY src ./src

# Package the application as a WAR file
RUN mvn clean package -DskipTests

# Use a lightweight OpenJDK image with Java 17 to run the application
FROM openjdk:17-jdk-alpine

# Copy the WAR file from the previous build stage
COPY --from=build /app/target/crudwithspringpro-0.0.1-SNAPSHOT.war /spring-boot-ec2-starter.war

# Set the entry point to run the WAR file
ENTRYPOINT ["java", "-jar", "/spring-boot-ec2-starter.war"]






