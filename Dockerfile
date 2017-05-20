FROM ubuntu
MAINTAINER Rafael de Morais "rdemorais.freitas@gmail.com"
RUN apt-get update && \
    apt-get install -y wget --no-install-recommends && \
    mkdir /usr/java && \
    cd /usr/java && \
    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jre-8u112-linux-x64.tar.gz && \
    tar -xvf jre-8u112-linux-x64.tar.gz --strip-components=1 && \
    chown -R root:root /usr/java && \
    rm -f jre-8u112-linux-x64.tar.gz && \
    apt-get purge -y --auto-remove wget && \
    apt-get clean
ENV JAVA_HOME=/usr/java \
    PATH=$PATH:/usr/java/bin \
    CLASSPATH=$CLASSPATH:/usr/java/lib