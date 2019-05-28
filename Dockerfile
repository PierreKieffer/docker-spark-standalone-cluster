FROM ubuntu:16.04

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME
WORKDIR /usr/local


RUN wget http://apache.lauf-forum.at/spark/spark-2.4.3/spark-2.4.3-bin-hadoop2.7.tgz
RUN tar zxvf spark-2.4.3-bin-hadoop2.7.tgz
RUN mv spark-2.4.3-bin-hadoop2.7 spark
ENV SPARK_HOME /usr/local/spark
WORKDIR $SPARK_HOME
ADD spark-defaults.conf $SPARK_HOME/conf
RUN useradd -s /bin/bash myUser
USER myUser

