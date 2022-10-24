FROM adoptopenjdk/openjdk11:ubi
ARG JAR_FILE=target/*.jar

ENV DB_USERNAME=user
ENV DB_PASSWORD=password

COPY ${JAR_FILE} app.jar

ENTRYPOINT ["java", "-Dspring.datasource.username=${DB_USERNAME}", "-Dspring.datasource.password=${DB_PASSWORD}","-jar","/app.jar"]