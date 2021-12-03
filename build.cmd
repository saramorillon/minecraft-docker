@echo off 
docker build -t saramorillon/minecraft .
docker image tag saramorillon/minecraft saramorillon/minecraft:%1
docker push -a saramorillon/minecraft