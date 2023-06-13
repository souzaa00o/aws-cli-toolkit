#!/bin/bash

PROFILE=<PROFILE ENV>
URL=https://signin.aws.amazon.com/

ASCII_TXT=ASCII_CreateUser.txt

cat "$ASCII_TXT"

echo Digite o username:
read USER_NAME

aws iam create-user --user-name $USER_NAME --profile $PROFILE

USER_PASS=$(pwgen -y -1 15)

sleep 1


aws iam create-login-profile --user-name $USER_NAME --password $USER_PASS --password-reset-required --profile $PROFILE
echo Criando senha de aceso a console...


echo Grupos:
aws iam list-groups --query 'Groups[].GroupName' --output text --profile $PROFILE

echo Digite o grupo para o usuario $USER_NAME:
sleep 1

read GROUP_NAME
aws iam add-user-to-group --user-name $USER_NAME --group-name $GROUP_NAME --profile $PROFILE


echo Deseja criar uma Access key para $USER_NAME ?? [Y/n]

read INPUT
CHOICE=$(echo "$INPUT" | tr '[:upper:]' '[:lower:]')

if [[ "$CHOICE" == "y" ]]; then
	JSON=$(aws iam create-access-key --user-name $USER_NAME --profile $PROFILE)
	sleep 2

	ACCESS_KEY=$(echo "$JSON" | jq -r '.AccessKey.AccessKeyId')
	SECRET_KEY=$(echo "$JSON" | jq -r '.AccessKey.SecretAccessKey')
	
	echo Access key para $USER_NAME criada.
fi


echo ¨URL,User,Password,AccessKey,SecretKey¨ > aws_credentials_$USER_NAME.csv
echo ¨$URL,$USER_NAME,$USER_PASS,$ACCESS_KEY,$SECRET_KEY¨ >> aws_credentials_$USER_NAME.csv

echo Output aws_credentials_$USER_NAME.csv created
