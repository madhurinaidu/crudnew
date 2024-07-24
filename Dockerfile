# Dockerfile
FROM openjdk:17-jdk-slim
COPY target/crudwithspringpro-0.0.1-SNAPSHOT.jar /app/crudwithspringpro.jar
WORKDIR /app
CMD ["java", "-jar", "crudwithspringpro.jar"]
