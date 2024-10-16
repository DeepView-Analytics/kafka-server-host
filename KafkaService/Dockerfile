FROM confluentinc/cp-kafka:latest

# Switch to root to ensure we have the necessary permissions
USER root

COPY new-server.properties /usr/bin/new-server.properties
COPY create-topics.sh /usr/bin/create-topics.sh

RUN chmod +x /usr/bin/create-topics.sh
RUN cat /usr/bin/new-server.properties >> /etc/kafka/server.properties

# Output the combined server.properties to verify its contents
RUN cat /etc/kafka/config/server.properties


# Switch back to the Kafka user
USER cp-kafka

CMD ["sh", "-c", "/etc/confluent/docker/run & /usr/bin/create-topics.sh"]
