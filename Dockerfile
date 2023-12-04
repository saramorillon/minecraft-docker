FROM openjdk:17-jdk-alpine

WORKDIR /usr/app

RUN apk add curl
RUN curl https://piston-data.mojang.com/v1/objects/5b868151bd02b41319f54c8d4061b8cae84e665c/server.jar -o server.jar
COPY eula.txt .
COPY server.properties .

EXPOSE 25565

CMD ["java", "-Xms1024M", "-Xmx2048M", "-jar", "server.jar", "nogui"]