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

## Как получить доступ к Kafka UI

После запуска контейнеров, Kafka UI будет доступен по адресу:
- http://localhost:8080

В веб-интерфейсе вы сможете:
- Просматривать топики
- Создавать новые топики
- Просматривать и отправлять сообщения
- Мониторить состояние кластера
- Управлять схемами (если настроен Schema Registry)

## Топики по умолчанию

При запуске автоматически создаются следующие топики:

### Для однонодовой конфигурации:
- users (1 партиция, RF=1)
- orders (1 партиция, RF=1)
- notifications (1 партиция, RF=1)

### Для кластерной конфигурации:
- users (2 партиции, RF=2)
- orders (2 партиции, RF=2)
- notifications (2 партиции, RF=2)
