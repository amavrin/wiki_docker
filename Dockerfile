FROM java

WORKDIR /opt/wiki_search
COPY sample.xml.bz2 /opt/wiki_search
COPY demo-0.0.1-SNAPSHOT.jar /opt/wiki_search
ENV LC_ALL=C.UTF-8
CMD ["/usr/bin/java", "-jar", "/opt/wiki_search/demo-0.0.1-SNAPSHOT.jar"]
