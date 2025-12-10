FROM eclipse-temurin:21-jdk-alpine

WORKDIR /usr/app

RUN wget https://maven.minecraftforge.net/net/minecraftforge/forge/1.21.11-61.0.1/forge-1.21.11-61.0.1-installer.jar -O forge.jar
RUN wget https://piston-data.mojang.com/v1/objects/64bb6d763bed0a9f1d632ec347938594144943ed/server.jar -O server.jar

COPY eula.txt .
COPY server.properties .

EXPOSE 25565

RUN java -jar forge.jar --installServer

RUN rm -rf forge.jar forge.jar.log run.bat

RUN echo "-Xms1024M" >> user_jvm_args.txt
RUN echo "-Xmx2048M" >> user_jvm_args.txt

CMD ["sh", "run.sh", "server.jar", "nogui"]