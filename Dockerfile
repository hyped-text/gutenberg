FROM "stain/jena-fuseki"

WORKDIR /gutenberg

COPY download.sh /gutenberg

COPY load.sh /gutenberg

COPY shiro.ini /fuseki

RUN ./download.sh
