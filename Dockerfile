FROM alpine:latest as build

RUN apk update
RUN apk add openjdk17

COPY C:/Users/RYZEN5/Documents/Tp api rest/apiRest/build/
RUN chmod +x ./gradlew
RUN ./gradlew bootJar --no-daemon

FROM openjdk:17-alpine
EXPOSE 9000
COPY --from=build ./build/libs/apiRest-0.0.1-SNAPSHOT.jar ./app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]