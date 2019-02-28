#!/bin/sh

mkdir -p /fuseki/databases/gutenberg

/jena-fuseki/fuseki-server --update -tdb=/fuseki/databases/gutenberg /gutenberg
