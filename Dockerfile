# Build backend + frontend
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY backend ./backend
COPY frontend ./frontend
RUN mvn -f backend/pom.xml -B clean package -DskipTests


# Run
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/backend/target/*.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
