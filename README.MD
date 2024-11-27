# Kafka in Docker: single-node / cluster configurations

Based on [article](https://www.baeldung.com/ops/kafka-docker-setup)

## Prerequisites

- Docker
- [Kafka Tool](https://kafkatool.com/download.html)

## How to start Kafka in single-node configuration

```
cd single-node
docker compose up
```

## How to start Kafka in cluster configuration

```
cd cluster
docker compose up
```

## How to set up connection in Kafka Tool to single-node kafka

- Zookeeper Host: `localhost`
- Zookeeper Port: `22181`
- Bootstrap servers: `localhost:29092`

## How to set up connection in Kafka Tool to cluster Kafka

- Zookeeper Host: `localhost`
- Zookeeper Port: `22181`
- Bootstrap servers: `localhost:29092;localhost:39092`

## How to clean up created Docker containers

Run from folder where `docker compose up` was used:

```
docker compose down
```
