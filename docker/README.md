# HADOOP 3.1.3 VIA DOCKER

Preparando um container docker com uma instalação do Hadoop 3.1.3

## Build

```
docker build . -t hersonpc/hadoop:3.1.3
```

# Executando container Docker

```
docker run -it --name hadoop --rm -p 50070:50070 -p 8088:8088 hersonpc/hadoop:3.1.3
```

## Importar arquivos para o HDFS

```
hdfs dfs -mkdir /input
hdfs dfs -put /root/data/bv000255.txt /input
hdfs dfs -ls /input
```

Obs.: Os comandos de importação são apenas para exemplificar pois os dados já foram importados para o container. Você por verificar pelo comando 'hadoop fs -ls /' ou 'hdfs dfs -ls /'.

## Executando 

Existem dois exemplos de Jobs já prontos para acessa-los use os comandos abaixo:

```
example/machado_assis_job.sh
example/shakespeare_job.sh
```