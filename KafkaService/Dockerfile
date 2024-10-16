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

# Install snapd and enable the snapd socket
RUN yum install -y epel-release && \
    yum install -y snapd && \
    systemctl enable --now snapd.socket && \
    ln -s /var/lib/snapd/snap /snap

# Restart the system to ensure snap’s paths are updated correctly
RUN systemctl restart snapd

# Install ZooKeeper using snap
RUN snap install zookeeper

# Configuration and verification
RUN cat /etc/kafka/server.properties

# Switch back to the Kafka user
USER cp-kafka

# Start ZooKeeper and Kafka, then create topics
CMD ["sh", "-c", "/snap/bin/zookeeper.start & /etc/confluent/docker/run & /usr/bin/topics-creation-commands.sh"]
