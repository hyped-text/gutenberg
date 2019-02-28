FROM "stain/jena-fuseki"

WORKDIR /gutenberg

COPY download.sh load.sh run.sh /gutenberg/

COPY shiro.ini /fuseki

RUN ./download.sh
