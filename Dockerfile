FROM openjdk:21-jdk-slim

WORKDIR /usr/app

RUN apt update && apt install curl -y

RUN curl https://piston-data.mojang.com/v1/objects/11e54c2081420a4d49db3007e66c80a22579ff2a/server.jar -o server.jar

COPY eula.txt .
COPY server.properties .

EXPOSE 25565

CMD ["java", "-Xms1024M", "-Xmx2048M", "-jar", "server.jar", "nogui"]