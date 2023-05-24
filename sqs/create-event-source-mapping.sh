#!/bin/bash

QUEUE_NAME=$1
FUNCTION_NAME=$2

REGION=<REGION> #<us-east-1, us-west-1>
ACCOUNT_ID=<ACCOUNT ID>
PROFILE=<PROFILE ENV>

ASCII_TXT=ASCII_LambdaAttacher.txt

cat "$ASCII_TXT"

aws lambda create-event-source-mapping --function-name $FUNCTION_NAME --event-source-arn arn:aws:sqs:$REGION:$ACCOUNT_ID:$QUEUE_NAME --profile $PROFILE

echo "$FUNCTION_NAME Lambda atached ==[>] on $QUEUE_NAME Queue_\|/_ "

gnome-terminal -- /<PATH>/get-queue-attributes.sh $QUEUE_NAME

sleep 4

aws lambda list-event-source-mappings --function-name $FUNCTION_NAME --profile $PROFILE
