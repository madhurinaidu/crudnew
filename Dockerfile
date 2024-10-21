
# Use a base image with JDK 17
FROM maven:3.9.9-eclipse-temurin-17 as builder

# Set the working directory inside the container for the build stage
WORKDIR /app

# Copy the pom.xml and source code to the container
COPY pom.xml .
COPY src ./src

# Run Maven to clean, compile, and package the WAR file
RUN mvn clean package -DskipTests

# Use Tomcat 10.1 as the runtime environment
FROM tomcat:10.1

# Set the working directory (optional)
WORKDIR /usr/local/tomcat

# Copy the generated WAR file from the builder stage to Tomcat's webapps directory
COPY --from=builder /app/target/crudwithspringpro-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/

# Install curl for health checks
RUN apt-get update && apt-get install -y curl

# Expose the port Tomcat will run on
EXPOSE 8080

# Run the Tomcat server
CMD ["catalina.sh", "run"]
