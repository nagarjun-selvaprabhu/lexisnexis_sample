# Build backend + frontend
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app

# Copy backend
COPY backend ./backend

# Copy frontend (correct path)
COPY frontend/lexisnexis-front-end ./frontend

# Build backend (frontend build handled by Maven plugin or backend)
RUN mvn -f backend/pom.xml -B clean package -DskipTests


# Run final image
FROM eclipse-temurin:17-jre
WORKDIR /app

COPY --from=build /app/backend/target/*.jar app.jar

EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
