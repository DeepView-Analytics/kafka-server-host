#!/bin/bash
# create-topics.sh

# Create topics and echo the results
echo "Creating topic: person_detection_requests"
/usr/bin/kafka-topics --create --topic person_detection_requests --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1

echo "Creating topic: person_detected_responses"
/usr/bin/kafka-topics --create --topic person_detected_responses --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1

# List all topics to verify
echo "Listing all topics:"
/usr/bin/kafka-topics --list --bootstrap-server localhost:9092
