#!/bin/sh

echo "Inicializado prepare do Hadoop\n"

echo "- Iniciando SSH...\n"
# Iniciando o SSH
/etc/init.d/ssh start

echo "- Configurando JAVA...\n"
# Configurando Diretórios JAVA para facilitar a instalação
mkdir /usr/java
ln -s /usr/lib/jvm/java-1.8.0-openjdk-amd64 /usr/java/latest

echo "- Preparando ambiente...\n"
# Linkando o hadoop para facilidade em configurações
ln -s /root/hadoop-3.1.3 /root/hadoop

echo "alias hadoop=/root/hadoop-3.1.3/bin/hadoop" >> /root/.bashrc
echo "alias hdfs=/root/hadoop-3.1.3/bin/hdfs" >> /root/.bashrc
echo "alias yarn=/root/hadoop-3.1.3/bin/yarn" >> /root/.bashrc
echo "alias mapred=/root/hadoop-3.1.3/bin/mapred" >> /root/.bashrc
source /root/.bashrc

# Passando alguns parâmetros iniciais para o start do serviço
echo 'export JAVA_HOME="/usr/java/latest"' >> /root/hadoop/etc/hadoop/hadoop-env.sh
echo 'export HADOOP_HOME="/root/hadoop-3.1.3"' >> /root/hadoop/etc/hadoop/hadoop-env.sh
echo 'export HDFS_NAMENODE_USER="root"' >> /root/hadoop/etc/hadoop/hadoop-env.sh
echo 'export HDFS_NAMENODE_GROUP="root"' >> /root/hadoop/etc/hadoop/hadoop-env.sh
echo 'export HDFS_DATANODE_USER="root"' >> /root/hadoop/etc/hadoop/hadoop-env.sh
echo 'export HDFS_SECONDARYNAMENODE_USER="root"' >> /root/hadoop/etc/hadoop/hadoop-env.sh
echo 'export YARN_NODEMANAGER_USER="root"' >> /root/hadoop/etc/hadoop/yarn-env.sh
echo 'export YARN_RESOURCEMANAGER_USER="root"' >> /root/hadoop/etc/hadoop/yarn-env.sh

echo "- Configurando servico...\n"
# Copiando os arquivos para os serviços
cp /root/conf/*.xml /root/hadoop/etc/hadoop/

echo "- Configurando HDFS e YARN...\n"
# Formatando o NameNode e iniciando o serviço HDFS e YARN
/root/hadoop/bin/hdfs namenode -format
/root/hadoop/sbin/start-dfs.sh
/root/hadoop/sbin/start-yarn.sh

echo "- Importanto dados para HDFS"
/root/hadoop/bin/hdfs dfs -mkdir /br_input
/root/hadoop/bin/hdfs dfs -put /root/data/bv000255.txt /br_input
/root/hadoop/bin/hdfs dfs -mkdir /us_input
/root/hadoop/bin/hdfs dfs -put /root/data/t8.shakespeare.txt /us_input


echo "\n\n#########################################################################################################################\n"
echo ""
echo "                         __   __    _______    ______     _______    _______    _______                                  "
echo "                        |  | |  |  |   _   |  |      |   |       |  |       |  |       |                                 "
echo "                        |  |_|  |  |  |_|  |  |  _    |  |   _   |  |   _   |  |    _  |                                 "
echo "                        |       |  |       |  | | |   |  |  | |  |  |  | |  |  |   |_| |                                 "
echo "                        |       |  |       |  | |_|   |  |  |_|  |  |  |_|  |  |    ___|                                 "
echo "                        |   _   |  |   _   |  |       |  |       |  |       |  |   |                                     "
echo "                        |__| |__|  |__| |__|  |______|   |_______|  |_______|  |___|                                     "
echo "                                                                                                                         "
echo "                                                                                                                         "
echo "                                                                                                                         "
echo "                                                                                                                         "
echo " _______  __   __        __   __  _______  ______    _______  _______  __    _        __   __  _______  ___      _______ "
echo "|  _    ||  | |  |      |  | |  ||       ||    _ |  |       ||       ||  |  | |      |  |_|  ||       ||   |    |       |"
echo "| |_|   ||  |_|  |      |  |_|  ||    ___||   | ||  |  _____||   _   ||   |_| |      |       ||    ___||   |    |   _   |"
echo "|       ||       |      |       ||   |___ |   |_||_ | |_____ |  | |  ||       |      |       ||   |___ |   |    |  | |  |"
echo "|  _   | |_     _|      |       ||    ___||    __  ||_____  ||  |_|  ||  _    |      |       ||    ___||   |___ |  |_|  |"
echo "| |_|   |  |   |        |   _   ||   |___ |   |  | | _____| ||       || | |   |      | ||_|| ||   |___ |       ||       |"
echo "|_______|  |___|        |__| |__||_______||___|  |_||_______||_______||_|  |__|      |_|   |_||_______||_______||_______|"
echo ""
echo "\n#########################################################################################################################\n\n"
echo "Tudo pronto!\n\nEm caso de duvida, digite o comando 'hadoop' para ter acesso a ajuda.\n"

/bin/bash