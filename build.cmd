@echo off 
docker build -t saramorillon/minecraft .
docker image tag saramorillon/minecraft saramorillon/minecraft:%1
docker push -a saramorillon/minecraft

docker build -t saramorillon/minecraft-forge -f modded.Dockerfile .
docker image tag saramorillon/minecraft-forge saramorillon/minecraft-forge:%1
docker push -a saramorillon/minecraft-forge