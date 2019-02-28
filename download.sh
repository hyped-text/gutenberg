#!/bin/sh

SOURCE=http://www.gutenberg.org/cache/epub/feeds/rdf-files.tar.zip

ZIP_FILE=rdf-files.tar.zip

CACHE_DIR=$PWD

if [ -d $CACHE_DIR/cache ]; then
  echo Found cached resources, nothing to download, exiting
  exit 0
fi

echo Downloading gutenberg catalog from $SOURCE

wget -O $CACHE_DIR/$ZIP_FILE $SOURCE

echo Catalog downloaded!

if ! [ -x "$(command -v unzip)" ]; then
  echo Installing unzip
  apk update
  apk add unzip
fi

echo Unzipping archive

unzip -d $CACHE_DIR $CACHE_DIR/$ZIP_FILE

tar --extract -C $CACHE_DIR -f $CACHE_DIR/rdf-files.tar
  
echo Unzipped to $CACHE_DIR/cache

echo Done!

