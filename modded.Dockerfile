FROM openjdk:21-jdk-slim

WORKDIR /usr/app

RUN apt update && apt install curl -y

RUN curl https://maven.minecraftforge.net/net/minecraftforge/forge/1.21-51.0.33/forge-1.21-51.0.33-installer.jar -o forge.jar
RUN curl https://piston-data.mojang.com/v1/objects/11e54c2081420a4d49db3007e66c80a22579ff2a/server.jar -o server.jar

COPY eula.txt .
COPY server.properties .

EXPOSE 25565

RUN java -jar forge.jar --installServer

RUN rm -rf forge.jar forge.jar.log run.bat

RUN echo "-Xms1024M" >> user_jvm_args.txt
RUN echo "-Xmx2048M" >> user_jvm_args.txt

CMD ["sh", "run.sh", "server.jar", "nogui"]