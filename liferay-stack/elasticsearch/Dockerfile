FROM docker.elastic.co/elasticsearch/elasticsearch:7.17.1
# FROM docker.elastic.co/elasticsearch/elasticsearch:7.9.3

RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-icu && \
    /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-kuromoji && \
    /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-smartcn && \
    /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-stempel

COPY ./elasticsearch.yml /usr/share/elasticsearch/config

