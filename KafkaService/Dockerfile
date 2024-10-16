FROM confluentinc/cp-kafka:latest

# Switch to root to ensure we have the necessary permissions
USER root

# Copy configuration files
COPY new-server.properties /etc/kafka/config/new-server.properties
COPY topics-creation-commands.sh /usr/bin/topics-creation-commands.sh

# Install necessary packages and tools
RUN chmod +x /usr/bin/topics-creation-commands.sh

# Append to the existing server.properties
RUN cat /etc/kafka/config/new-server.properties >> /etc/kafka/server.properties

# Install ZooKeeper directly using yum
RUN yum install -y wget && \
    wget https://archive.apache.org/dist/zookeeper/zookeeper-3.6.2/apache-zookeeper-3.6.2-bin.tar.gz && \
    tar -zxf apache-zookeeper-3.6.2-bin.tar.gz && \
    mv apache-zookeeper-3.6.2-bin /opt/zookeeper && \
    rm apache-zookeeper-3.6.2-bin.tar.gz

# Configuration and verification
RUN cat /etc/kafka/server.properties

# Switch back to the Kafka user
USER cp-kafka

# Start ZooKeeper and Kafka, then create topics
CMD ["sh", "-c", "/opt/zookeeper/bin/zkServer.sh start & /etc/confluent/docker/run & /usr/bin/topics-creation-commands.sh"]
