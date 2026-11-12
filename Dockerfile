# 1. Base image containing Java 17 runtime
FROM eclipse-temurin:17-jre

# 2. Set working directory inside container
WORKDIR /app

# 3. Copy executable JAR into container
COPY target/docker-spring-demo-1.0-SNAPSHOT.jar app.jar

# 4. Document the application port
EXPOSE 8080

# 5. Start Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
