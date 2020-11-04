FROM openjdk:16-jdk-alpine

WORKDIR /usr/app

RUN apk add curl
RUN curl https://launcher.mojang.com/v1/objects/35139deedbd5182953cf1caa23835da59ca3d7cd/server.jar -o server.jar
COPY eula.txt .
COPY server.properties .

EXPOSE 25565

CMD ["java", "-Xms1024M", "-Xmx2048M", "-jar", "server.jar", "nogui"]