#!/bin/bash

echo "Waiting for Kafka to be ready..."
sleep 30

# Создаем топики для однонодовой конфигурации
if [ "$KAFKA_CLUSTER_TYPE" = "single" ]; then
    kafka-topics --bootstrap-server kafka:9092 \
        --create --if-not-exists \
        --topic users \
        --partitions 1 \
        --replication-factor 1

    kafka-topics --bootstrap-server kafka:9092 \
        --create --if-not-exists \
        --topic orders \
        --partitions 1 \
        --replication-factor 1

    kafka-topics --bootstrap-server kafka:9092 \
        --create --if-not-exists \
        --topic notifications \
        --partitions 1 \
        --replication-factor 1

# Создаем топики для кластерной конфигурации
elif [ "$KAFKA_CLUSTER_TYPE" = "cluster" ]; then
    kafka-topics --bootstrap-server kafka1:9092 \
        --create --if-not-exists \
        --topic users \
        --partitions 2 \
        --replication-factor 2

    kafka-topics --bootstrap-server kafka1:9092 \
        --create --if-not-exists \
        --topic orders \
        --partitions 2 \
        --replication-factor 2

    kafka-topics --bootstrap-server kafka1:9092 \
        --create --if-not-exists \
        --topic notifications \
        --partitions 2 \
        --replication-factor 2
fi

echo "Default topics created!" 