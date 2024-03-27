FROM openjdk:17-jdk-alpine

WORKDIR /usr/app

RUN apk add curl

RUN curl https://maven.minecraftforge.net/net/minecraftforge/forge/1.20.2-48.1.0/forge-1.20.2-48.1.0-installer.jar -o forge.jar
RUN curl https://piston-data.mojang.com/v1/objects/5b868151bd02b41319f54c8d4061b8cae84e665c/server.jar -o server.jar

COPY eula.txt .
COPY server.properties .

EXPOSE 25565

RUN java -jar forge.jar --installServer

RUN rm -rf forge.jar forge.jar.log run.bat

RUN echo "-Xms1024M" >> user_jvm_args.txt
RUN echo "-Xmx2048M" >> user_jvm_args.txt

CMD ["sh", "run.sh", "server.jar", "nogui"]