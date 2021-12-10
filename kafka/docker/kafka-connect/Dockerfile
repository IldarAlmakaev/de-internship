ARG image
FROM ${image}

## Install connectors
ENV DEBEZIUM_VERSION=1.7.1.Final
RUN set -ex \
    && wget -q https://repo1.maven.org/maven2/io/debezium/debezium-connector-mysql/${DEBEZIUM_VERSION}/debezium-connector-mysql-${DEBEZIUM_VERSION}-plugin.tar.gz \
        -O /tmp/debezium-connector-mysql-${DEBEZIUM_VERSION}-plugin.tar.gz \
    && tar xzvf /tmp/debezium-connector-mysql-${DEBEZIUM_VERSION}-plugin.tar.gz -C /usr/share/java/

RUN echo "Installing MongoDB sink connector..." && confluent-hub install --no-prompt hpgrahsl/kafka-connect-mongodb:1.4.0
RUN echo "Installing S3 sink connector..." && confluent-hub install --no-prompt confluentinc/kafka-connect-s3:5.5.3