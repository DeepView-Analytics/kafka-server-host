FROM confluentinc/cp-kafka:latest

# Switch to root to ensure we have the necessary permissions
USER root

COPY new-server.properties /etc/kafka/config/new-server.properties
COPY create-topics.sh /usr/bin/create-topics.sh

RUN chmod +x /usr/bin/create-topics.sh
RUN cat /etc/kafka/config/new-server.properties >> /etc/kafka/config/server.properties

# Switch back to the Kafka user
USER cp-kafka

CMD ["sh", "-c", "/etc/confluent/docker/run & /usr/bin/create-topics.sh"]
