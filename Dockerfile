FROM openjdk:16-jdk-alpine

WORKDIR /usr/app

RUN apk add curl
RUN curl https://launcher.mojang.com/v1/objects/fc87ef4c3cf1c815809249cc00ccade233b22cf5/server.jar -o server.jar
COPY eula.txt .
COPY server.properties .

EXPOSE 25565

CMD ["java", "-Xms1024M", "-Xmx2048M", "-jar", "server.jar", "nogui"]