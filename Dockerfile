FROM openjdk:21-jdk-slim

WORKDIR /usr/app

RUN apt update && apt install curl -y

RUN curl https://piston-data.mojang.com/v1/objects/6bce4ef400e4efaa63a13d5e6f6b500be969ef81/server.jar -o server.jar

COPY eula.txt .
COPY server.properties .

EXPOSE 25565

CMD ["java", "-Xms1024M", "-Xmx2048M", "-jar", "server.jar", "nogui"]