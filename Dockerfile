# # 1. Base image containing Java 17 runtime
# FROM eclipse-temurin:17-jre

# # 2. Set working directory inside container
# WORKDIR /app

# # 3. Copy executable JAR into container
# COPY target/docker-spring-demo-1.0-SNAPSHOT.jar app.jar

# # 4. Document the application port
# EXPOSE 8080

# # 5. Start Spring Boot application
# ENTRYPOINT ["java", "-jar", "app.jar"]








# Stage 1: Build
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

# Stage 2: Runtime
FROM eclipse-temurin:17-jre

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]