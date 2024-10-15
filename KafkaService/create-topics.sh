
/etc/kafka/bin/kafka-topics --create --topic person_detection_requests --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1
/etc/kafka/bin/kafka-topics --create --topic person_detected_responses --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1

