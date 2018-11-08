FROM java

WORKDIR /opt/wiki_search
RUN groupadd -g 1000 web
RUN useradd -u 1000 -g web web
ENV LC_ALL=C.UTF-8
EXPOSE 8080
USER web
CMD ["/usr/bin/java", "-jar", "/opt/wiki_search/demo-0.0.1-SNAPSHOT.jar"]
