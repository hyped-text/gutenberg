#!/bin/sh

SOURCE=http://www.gutenberg.org/cache/epub/feeds/rdf-files.tar.zip

ZIP_FILE=rdf-files.tar.zip

CACHE_DIR=$HOME/.gutenberg

if [ -d $CACHE_DIR/cache ]; then
  echo Found cached resources, nothing to download, exiting
  exit 0
fi

echo Downloading gutenberg archive from $SOURCE

curl $SOURCE --output $CACHE_DIR/$ZIP_FILE

echo Downloading is complete!

if ! [ -x "$(command -v unzip)" ]; then
  echo Installing unzip
  sudo apt-get update
  sudo apt-get install -y unzip
fi

echo Unzipping archive

unzip -u -d $CACHE_DIR $CACHE_DIR/$ZIP_FILE

echo Unzipping is complete!

echo Untaring nested archive

tar --extract -C $CACHE_DIR -f $CACHE_DIR/rdf-files.tar
  
echo Untaring is complete!

exit 0
