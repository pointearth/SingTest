# ---------- Build stage ----------
FROM maven:3.9.11-eclipse-temurin-17 AS build
WORKDIR /workspace

COPY pom.xml .
RUN mvn -B -ntp dependency:go-offline   # cache deps

COPY src ./src
RUN mvn -B -ntp package -DskipTests     # compiles fine with JDK 17

# ---------- Runtime stage ----------
FROM eclipse-temurin:17-jre-alpine AS runtime
RUN addgroup -S spring && adduser -S spring -G spring
USER spring
WORKDIR /app

COPY --from=build /workspace/target/singtest.jar ./singtest.jar
EXPOSE 8090
ENTRYPOINT ["java","-jar","singtest.jar"]
