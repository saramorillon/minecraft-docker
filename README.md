# Minecraft in Docker

Run Minecraft in Docker using `docker run`

```bash

docker run saramorillon/minecraft:latest

```

Or using docker-compose

```yaml
version: "3"
services:
  awesome_server:
    image: saramorillon/minecraft:latest
    container_name: awesome_server
    ports:
      - 25565:25565
```

## Volumes

Minecraft application is stored under `/usr/app`.

```yaml
version: "3"
services:
  awesome_server:
    image: saramorillon/minecraft:latest
    container_name: awesome_server
    ports:
      - 25565:25565
    volumes:
      - ./server.properties:/usr/app/server.properties
      - ./whitelist.json:/usr/app/whitelist.json
      - ./ops.json:/usr/app/ops.json
      - ./world:/usr/app/world
```

## Versions

`saramorillon/minecraft` tags follow minecraft versions.
