WORKOSM_DIR=/home/osm
PGHOST=localhost
#PGUSER=postgres
#PGPASSWORD=postgres
#for f in $WORKOSM_DIR/*; do
    #if [ -d ${f} ]; then
        #echo "$(basename "$f")"
    #fi	
#done
osmosis --read-replication-interval workingDirectory="${WORKOSM_DIR}" --simplify-change --write-xml-change
osm2pgsql --cache 300 -s -a -l -d osm -U postgres -H $PGHOST change.osc