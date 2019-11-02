FROM ubuntu:bionic

LABEL maintainer="Herson Melo <hersonpc@gmail.com>"

# Instalando dependencias
RUN apt-get update -y && \
    apt-get install -y ssh rsync wget curl \
    net-tools nano openjdk-8-jdk openjdk-8-jre

# SSH
RUN ssh-keygen -q -t rsa -N '' -f /root/.ssh/id_rsa && \
    cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys2

# Diretorio padrao
WORKDIR /root

# Instalando o Hadoop
RUN wget -O /root/hadoop.tar.gz http://ftp.unicamp.br/pub/apache/hadoop/common/hadoop-3.1.3/hadoop-3.1.3.tar.gz && \
    tar -xzvf /root/hadoop.tar.gz -C /root/ && \
    rm -f /root/hadoop.tar.gz

# Configuracoes do Hadoop
COPY conf /root/conf
COPY bin /root/bin
COPY data/*.txt /root/data/

COPY example /root/example/
RUN chmod +x /root/example/*.sh

COPY init_hadoop.sh /root/
RUN chmod +x /root/init_hadoop.sh


# Liberando portas de acesso
EXPOSE 50070 8088

ENTRYPOINT [ "/root/init_hadoop.sh" ]