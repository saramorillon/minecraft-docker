FROM openjdk:17-jdk-alpine

WORKDIR /usr/app

RUN apk add curl
RUN curl https://launcher.mojang.com/v1/objects/125e5adf40c659fd3bce3e66e67a16bb49ecc1b9/server.jar -o server.jar
COPY eula.txt .
COPY server.properties .

EXPOSE 25565

CMD ["java", "-Xms1024M", "-Xmx2048M", "-jar", "server.jar", "nogui"]