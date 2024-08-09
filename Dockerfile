# Stage 1: Build the WAR File
FROM openjdk:17-jdk-slim AS builder

# Install Maven
RUN apt-get update && \
    apt-get install -y maven && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the Maven project files
COPY pom.xml ./
COPY src ./src

# Build the project and create the WAR file
RUN mvn clean package -DskipTests

# Stage 2: Create the runtime image with Tomcat
FROM tomcat:9.0-jdk17

# Remove default webapps (optional)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file from the builder stage to Tomcat's webapps directory
COPY --from=builder /app/target/crudwithspringpro-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/

# Expose the port Tomcat is running on
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
