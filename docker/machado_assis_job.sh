#!/bin/sh

echo "Listando HDFS :: Machado de Assis"
/root/hadoop-3.1.3/bin/hadoop fs -ls /br_input
/root/hadoop-3.1.3/bin/hadoop jar /root/bin/ContaPalavras.jar /br_input /br_output
/root/hadoop-3.1.3/bin/hadoop fs -cat /br_output/part-r-00000 > /root/machado_assis.contagem_final.txt