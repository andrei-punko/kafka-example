# Kafka in Docker: single-node / cluster configurations

[![Test Kafka Configurations](https://github.com/andrei-punko/kafka-example/actions/workflows/test.yml/badge.svg?branch=master)](https://github.com/andrei-punko/kafka-example/actions/workflows/test.yml)

Based on [article](https://www.baeldung.com/ops/kafka-docker-setup)

## Prerequisites

- Docker
- [Kafka Tool](https://kafkatool.com/download.html) (if want to use custom UI instead of embedded UI)

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

## Default Topics

The following topics are automatically created on startup:

### For single-node configuration:
- users (1 partition, RF=1)
- orders (1 partition, RF=1)
- notifications (1 partition, RF=1)

### For cluster configuration:
- users (2 partitions, RF=2)
- orders (2 partitions, RF=2)
- notifications (2 partitions, RF=2)

## Kafka UI

Kafka UI is available at http://localhost:8080 after starting the containers.

## GitHub Actions

This project includes GitHub Actions workflow that automatically tests both configurations:
- Runs on push to master branch
- Runs on pull requests to master branch
- Can be triggered manually with choice of configuration to test (all/single-node/cluster)

To run tests manually:
1. Go to Actions tab
2. Select "Test Kafka Configurations"
3. Click "Run workflow"
4. Choose configuration to test
5. Click "Run workflow"
