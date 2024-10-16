FROM confluentinc/cp-kafka:latest

# Switch to root to ensure we have the necessary permissions
USER root

# Copy configuration files
COPY new-server.properties /usr/bin/new-server.properties
COPY create-topics.sh /usr/bin/create-topics.sh

# Install necessary packages and tools
RUN chmod +x /usr/bin/create-topics.sh
RUN cat /usr/bin/new-server.properties >> /etc/kafka/config/server.properties

# Install ZooKeeper
RUN apt-get update && apt-get install -y zookeeper

# Configuration and verification
RUN cat /etc/kafka/config/server.properties

# Switch back to the Kafka user
USER cp-kafka

# Start ZooKeeper and Kafka, then create topics
CMD ["sh", "-c", "zookeeper-server-start /etc/kafka/zookeeper.properties & /etc/confluent/docker/run & /usr/bin/create-topics.sh"]
