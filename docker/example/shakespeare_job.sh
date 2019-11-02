#!/bin/sh

echo "Listando HDFS :: Shakespeare"
/root/hadoop-3.1.3/bin/hadoop fs -ls /us_input
/root/hadoop-3.1.3/bin/hadoop jar /root/bin/ContaPalavras.jar /us_input /us_output
/root/hadoop-3.1.3/bin/hadoop fs -cat /us_output/part-r-00000 > /root/shakespeare.contagem_final.txt