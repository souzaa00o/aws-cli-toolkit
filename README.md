# aws-cli-toolkit

### SQS/

#### create-event-source-mapping.sh
##### Atacha funções lambda em filas SQS e abre o monitoramento da fila SQS a ser reprocessada

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