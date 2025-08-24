FROM openjdk:21-jdk-slim

WORKDIR /usr/app

RUN apt update && apt install curl -y

RUN curl https://maven.minecraftforge.net/net/minecraftforge/forge/1.21-51.0.33/forge-1.21-51.0.33-installer.jar -o forge.jar
RUN curl https://piston-data.mojang.com/v1/objects/6bce4ef400e4efaa63a13d5e6f6b500be969ef81/server.jar -o server.jar

COPY eula.txt .
COPY server.properties .

EXPOSE 25565

RUN java -jar forge.jar --installServer

RUN rm -rf forge.jar forge.jar.log run.bat

RUN echo "-Xms1024M" >> user_jvm_args.txt
RUN echo "-Xmx2048M" >> user_jvm_args.txt

CMD ["sh", "run.sh", "server.jar", "nogui"]