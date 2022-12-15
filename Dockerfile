FROM adoptopenjdk/openjdk11
ARG JAR_FILE=target/hc-service-registry.jar
ADD ${JAR_FILE} hc-service-registry.jar
EXPOSE 8761
ENTRYPOINT ["java","-Dspring.profiles.active=prod","-jar", "hc-service-registry.jar"]
