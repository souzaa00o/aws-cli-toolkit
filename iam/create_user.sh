#!/bin/bash

## passar script para executar como funções via parametros
## apenas contruindo o raciocinio comando por comando por enquanto

URL_METAFORICA=abc.com

echo Digite o username:
read USER_NAME

aws iam create-user --user-name $USER_NAME --profile brabo

USER_PASS=$(pwgen -y -1 15)

aws iam create-login-profile --user-name $USER_NAME --password $USER_PASS --password-reset-required --profile brabo
echo Criando senha de aceso a console...

echo Grupos:
aws iam list-groups --query 'Groups[].GroupName' --output text --profile brabo

echo Digite o grupo para o usuario $USER_NAME:
read GROUP_NAME

aws iam add-user-to-group --user-name $USER_NAME --group-name $GROUP_NAME --profile brabo

echo ¨URL,User,Password¨ > $USER_NAME.csv
echo ¨$URL_METAFORICA,$USER_NAME,$USER_PASS¨ >> $USER_NAME.csv
echo Output $USER_NAME.csv created
