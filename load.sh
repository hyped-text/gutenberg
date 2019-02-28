RDFS=`find ./cache/epub -name *.rdf`

for RDF in $RDFS
do
  echo Uploading file $RDF
	wget --post-file=$RDF --header="Content-Type: application/rdf+xml" http://localhost:3030/gutenberg?default
done