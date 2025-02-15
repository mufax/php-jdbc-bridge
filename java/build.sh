#!/bin/sh

mkdir -p lib class tmp

COMMONS_DAEMON_VER=commons-daemon-1.2.2
ORG_JSON_VER=json-20230618

wget \
  -O tmp/${COMMONS_DAEMON_VER}-bin.tar.gz \
  "https://archive.apache.org/dist/commons/daemon/binaries/${COMMONS_DAEMON_VER}-bin.tar.gz"
tar -C lib/ \
  --strip-components=1 \
  -zxvf tmp/${COMMONS_DAEMON_VER}-bin.tar.gz \
  ${COMMONS_DAEMON_VER}/${COMMONS_DAEMON_VER}.jar
  
wget \
  -O lib/${ORG_JSON_VER}.jar \
  "https://repo1.maven.org/maven2/org/json/json/20230618/${ORG_JSON_VER}.jar"
  
javac -cp lib/${COMMONS_DAEMON_VER}.jar:lib/${ORG_JSON_VER}.jar -d class/ src/*
jar cfe lib/pjbridge.jar Server -C class .
