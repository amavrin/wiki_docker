FROM debian:wheezy

WORKDIR /opt/wiki_search
COPY sample.xml.bz2 /opt/wiki_search
COPY demo-0.0.1-SNAPSHOT.jar /opt/wiki_search

WORKDIR /opt/wiki_search/java_install
RUN apt-get update
RUN apt-get -y install wget
COPY get_java.sh /opt/wiki_search/java_install
RUN /bin/bash get_java.sh

WORKDIR /opt/java
RUN tar xzf /opt/wiki_search/java_install/jre-8u191-linux-x64.tar.gz
RUN update-alternatives --install /usr/bin/java    java    /opt/java/jre1.8.0_191/bin/java 1
RUN update-alternatives --install /usr/bin/keytool keytool /opt/java/jre1.8.0_191/bin/keytool 1

WORKDIR /opt/wiki_search
ENV LC_ALL=C.UTF-8
CMD ["/usr/bin/java", "-jar", "/opt/wiki_search/demo-0.0.1-SNAPSHOT.jar"]
