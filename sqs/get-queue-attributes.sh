#!/bin/bash

QUEUE_NAME=$1

REGION=<REGION> #<us-east-1, us-west-1>
ACCOUNT_ID=<ACCOUNT ID>
PROFILE=<PROFILE ENV>


ASCII_TXT=ASCII_QueueWatcher.txt

cat "$ASCII_TXT"

while true
do
	echo "----- $QUEUE_NAME STATUS $TIME ;) --------"
	
	date +%T

	aws sqs get-queue-attributes --queue-url https://sqs.$REGION.amazonaws.com/$ACCOUNT_ID/$QUEUE_NAME --attribute-names ApproximateNumberOfMessages ApproximateNumberOfMessagesNotVisible --profile $PROFILE
	
	sleep 15
	
done
