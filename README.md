# aws-cli-toolkit

##### Toolkit Shell Script para aws-cli, gerenciando Lambda, SQS e IAM.
### SQS/

###### Os Scripts SQS servem para monitorar as mensagens disponiveis e em in-flight em uma fila SQS, atachar uma função Lambda para reprocessar as mensagens em DLQs e tirar a Lambda da Fila após reprocessamento.
#### create-event-source-mapping.sh
##### Atacha funções lambda em filas SQS e abre o monitoramento da fila SQS a ser reprocessada.

###### sintaxy

```bash
./create-event-source-mapping.sh <Nome da fila SQS> <Nome da função Lambda>
```
#### get-queue-attributes.sh
##### Monitoramento de fila SQS passada como parametro em linha de comando.

###### sintaxy

```bash
./get-queue-attributes.sh <Nome da fila SQS>
```

### IAM/

#### create_user.sh

##### Script para criação de usuarios IAM e csv de creadenciais, adicionando o usuario em grupo IAM com senha aleatoria de primeiro acesso (o usuario sera obrigado a criar uma senha no primeiro login).

⚠️ **Aviso Importante:** É necessario instalar o pacote **pwgen**, gerador de senhas para criar a senha aleatoria forte com 14 caracteres e simbolos na linha 10.

```bash
sudo apt install pwgen
```
###### sintaxy

```bash
./create_user.sh
```
