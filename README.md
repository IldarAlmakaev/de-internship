# How To

## Prerequisites
* Linux/Unix-like OS  (x86 architecture)
* [Docker](https://docs.docker.com/engine/install/ubuntu/)
* [docker-compose](https://docs.docker.com/compose/) or just enable _**Docker Compose v2**_
* [jq](https://stedolan.github.io/jq/download/) for pretty formatting of JSON
* Fork this Github repository

## Deployment
* Build Docker images using `docker-compose`
```shell
docker-compose build
```

* Deploy services in detached mode (background) 
```shell
docker-compose up -d
```
* To check the progress of deployment, please use the following:
```shell
docker-compose ps
```


## Kafka Connect
* Validate status of deployed connectors by running the following command:
```shell
curl -XGET "http://localhost:8083/connectors?expand=status" | jq
```

## ksqlDB
* Once you deploy services, connect to ksqldb-cli
```shell
docker-compose exec ksqldb ksql http://ksqldb:8080
```
* Make sure that you established connection with ksqlDB server and see the following **Server Status: RUNNING**
```text
CLI v0.22.0, Server v0.22.0 located at http://ksqldb:8088
Server Status: RUNNING
```
* By default, the ksqlDB is configured to consume messages from the latest offset. So, you need to run the following command to 
get messages from the beginning
```shell
SET 'auto.offset.reset'='earliest';
```

## Stopping 
* To stop services use `down` command
```shell
docker-compose down
```
