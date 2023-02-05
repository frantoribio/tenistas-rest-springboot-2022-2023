# Con este Dockerfile se crea una imagen de Docker que
# compila la aplicación gracias a Gradle
FROM gradle:7-jdk17 AS build
# Copiamos el codigo fuente de la aplicación, es decir, 
# lo que hay en el directorio actual
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle bootJar --no-daemon

# Con esto hacemos una imagen de Docker que ejecuta la aplicación
FROM openjdk:17-jdk-slim-buster
EXPOSE 6969:6969
EXPOSE 6963:6963
# Directorio donde se guarda la aplicación
RUN mkdir /app
# Copiamos los certificados y los recursos de la aplicación en los directorios que necesita
# ya van en resources
# RUN mkdir /cert
# COPY --from=build /home/gradle/src/cert/* /cert/
# Copiamos el JAR de la aplicación
COPY --from=build /home/gradle/src/build/libs/tenistas-rest-springboot-0.0.1-SNAPSHOT.jar /app/tenistas-rest-springboot.jar
# Ejecutamos la aplicación, y le pasamos los argumentos si tiene
ENTRYPOINT ["java","-jar","/app/tenistas-rest-springboot.jar"]