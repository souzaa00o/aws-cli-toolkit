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

sleep 1

echo Digite o grupo para o usuario $USER_NAME:
read GROUP_NAME

aws iam add-user-to-group --user-name $USER_NAME --group-name $GROUP_NAME --profile $PROFILE

echo ¨URL,User,Password¨ > aws_credentials_$USER_NAME.csv
echo ¨$URL,$USER_NAME,$USER_PASS¨ >> aws_credentials_$USER_NAME.csv
echo Output aws_credentials_$USER_NAME.csv created
