# MBA CIÊNCIA DE DADOS E BIG DATA ANALYTICS

Atividade Hadoop MapReduce

## Objetivo

Processar um arquivo de texto e contabilizar a ocorrência de cada palavra no texto encontrada.

## Estratégia

Utilizar um ambiente escalável, que permita processamento paralelo e distribuido.

Utilizar um ambiente Docker para gerenciar os containers onde estará instalada a infraestrutura do Hadoop, para executar o programa de MapReduce que irá executar o processamento.

### Dados / Dataset

##### 1 - Livro de Machado de Assis

O dado utilizado será o livro A Semana, de Machado de Assis, obtivo no portal Domínio Público no link:

http://www.dominiopublico.gov.br/download/texto/bv000255.pdf

O arquivo foi convertido de PDF para TXT, para ser trabalhado pela solução aqui proposta.


##### 2 - Livro de Shakespeare

A universitade Massachusetts Institute of Technology (MIT) disponibilizou o documento através do link:

https://ocw.mit.edu/ans7870/6/6.006/s08/lecturenotes/files/t8.shakespeare.txt


# Executando o projeto

Para executar o projeto, precisamos contruir a imagem do docker e depois executa-la.

```
git clone https://github.com/hersonpc/mba-mapreduce
cd mba-mapreduce/docker

docker build . -t hersonpc/hadoop:3.1.3

docker run -it --name hadoop --rm -p 50070:50070 -p 8088:8088 hersonpc/hadoop:3.1.3
```

Após inicializado todo o sistema, basta executar um dos Jobs de exemplo

```
example/machado_assis_job.sh
example/shakespeare_job.sh
```


## Recursos utilizados

As bibliotecas do Hadoop utilizadas, foram baixadas no link:
http://ftp.unicamp.br/pub/apache/hadoop/common/hadoop-3.1.3/hadoop-3.1.3.tar.gz

Ou podem ser encontradas mais recentes no link:
http://hadoop.apache.org/releases.html

Todo ecosistema foi conteinerizado utilizando a ferramenta Docker CE (https://www.docker.com/) na versão 2.1.0.4, engine 19.03.04.


# Imagens da execução geral do processo

1 - Inicializando a instancia Hadoop no docker

![](/docs/001.jpg)

2 - Terminal pronto para inicializar os comandos no Hadoop

![](/docs/002.jpg)

3 - Verificando os arquivos importados para o HDFS

![](/docs/003.jpg)
![](/docs/004.jpg)

4 - Executando Job de exemplo MapReduce, base Machado de Assis

![](/docs/005.jpg)
![](/docs/006.jpg)

5 - Executando Job de exemplo MapReduce, base Shakespeare

![](/docs/007.jpg)
![](/docs/008.jpg)

6 - Verificação final dos processamentos executados

![](/docs/009.jpg)


[Download do Arquivo Processado - Machado de Assis](https://raw.githubusercontent.com/hersonpc/mba-mapreduce/master/docs/machado_assis.contagem_final.txt)  

[Download do Arquivo Processado - Shakespeare](https://raw.githubusercontent.com/hersonpc/mba-mapreduce/master/docs/shakespeare.contagem_final.txt)
