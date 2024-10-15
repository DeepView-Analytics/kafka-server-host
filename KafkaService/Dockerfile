FROM confluentinc/cp-kafka:latest


COPY new-server.properties /etc/kafka/config/new-server.properties
COPY create-topics.sh /usr/bin/create-topics.sh

RUN chmod +x /usr/bin/create-topics.sh
RUN cat /etc/kafka/config/new-server.properties >> /etc/kafka/config/server.properties

CMD ["sh", "-c", "/etc/confluent/docker/run & create-topics.sh"]
