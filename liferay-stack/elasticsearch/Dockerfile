FROM elasticsearch:8.12.2
#FROM elasticsearch:7.17.9

RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-icu && \
    /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-kuromoji && \
    /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-smartcn && \
    /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-stempel

COPY ./elasticsearch.yml /usr/share/elasticsearch/config

