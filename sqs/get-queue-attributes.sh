#!/bin/bash

QUEUE_NAME=$1
ASCII_TXT=ASCII_QueueWatcher.txt

cat "$ASCII_TXT"

while true
do
	echo "----- $QUEUE_NAME STATUS $TIME ;) --------"
	
	date +%T

	aws sqs get-queue-attributes --queue-url https://sqs.<REGION>.amazonaws.com/<ACCOUNT ID>/$QUEUE_NAME --attribute-names ApproximateNumberOfMessages ApproximateNumberOfMessagesNotVisible --profile <PROFILE>
	
	sleep 15
	
done
