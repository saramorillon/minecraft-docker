FROM openjdk:17-jdk-alpine

WORKDIR /usr/app

RUN apk add curl
RUN curl https://launcher.mojang.com/v1/objects/e00c4052dac1d59a1188b2aa9d5a87113aaf1122/server.jar -o server.jar
COPY eula.txt .
COPY server.properties .

EXPOSE 25565

CMD ["java", "-Xms1024M", "-Xmx2048M", "-jar", "server.jar", "nogui"]