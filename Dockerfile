FROM adoptopenjdk/openjdk11
VOLUME /tmp
ARG JAR_FILE=build/libs/hc-service-registry.jar
ADD ${JAR_FILE} hc-service-registry.jar
EXPOSE 8761
ENTRYPOINT ["java","-Dspring.profiles.active=prod","-jar", "hc-service-registry.jar"]
