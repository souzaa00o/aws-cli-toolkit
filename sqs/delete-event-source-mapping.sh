#!/bin/bash

FUNCTION_NAME=$1

REGION=<REGION> #<us-east-1, us-west-1>
ACCOUNT_ID=<ACCOUNT ID>
PROFILE=<PROFILE ENV>

ASCII_TXT=ASCII_LambdaKiller.txt

cat "$ASCII_TXT"

aws lambda list-event-source-mappings --function-name $FUNCTION_NAME --profile $PROFILE

sleep 2

echo "Digite o UUID da Lambda a ser deletada:"
read UUID

aws lambda delete-event-source-mapping --uuid $UUID --profile $PROFILE

