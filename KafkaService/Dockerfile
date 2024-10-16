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

# Install wget
RUN yum install -y wget

# Download and install ZooKeeper
RUN wget https://archive.apache.org/dist/zookeeper/zookeeper-3.6.2/apache-zookeeper-3.6.2-bin.tar.gz && \
    tar -zxf apache-zookeeper-3.6.2-bin.tar.gz && \
    mv apache-zookeeper-3.6.2-bin /opt/zookeeper && \
    rm apache-zookeeper-3.6.2-bin.tar.gz && \
    mkdir -p /opt/zookeeper/data /opt/zookeeper/logs && \
    touch /opt/zookeeper/conf/zoo.cfg

# Create a ZooKeeper config file
RUN echo "tickTime=2000" >> /opt/zookeeper/conf/zoo.cfg && \
    echo "dataDir=/opt/zookeeper/data" >> /opt/zookeeper/conf/zoo.cfg && \
    echo "clientPort=2181" >> /opt/zookeeper/conf/zoo.cfg && \
    echo "initLimit=5" >> /opt/zookeeper/conf/zoo.cfg && \
    echo "syncLimit=2" >> /opt/zookeeper/conf/zoo.cfg

# Fix permission issues
RUN chown -R cp-kafka:confluent /opt/zookeeper

# Configuration and verification
RUN cat /etc/kafka/server.properties

# Set the environment variable for Kafka to connect to ZooKeeper
ENV KAFKA_ZOOKEEPER_CONNECT=localhost:2181

# Switch back to the Kafka user
USER cp-kafka

# Start ZooKeeper and Kafka, then create topics
CMD ["sh", "-c", "/opt/zookeeper/bin/zkServer.sh start & /etc/confluent/docker/run & /usr/bin/topics-creation-commands.sh"]
