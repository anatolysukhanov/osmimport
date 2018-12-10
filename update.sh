WORKOSM_DIR=/home/data
PGHOST=localhost
#PGUSER=postgres
#PGPASSWORD=postgres

for f in $WORKOSM_DIR/*; do
    if [ -d ${f} ]; then
	country=$(basename "$f")
	cd $WORKOSM_DIR/$country
        osmosis --read-replication-interval workingDirectory="." --simplify-change --write-xml-change
        osm2pgsql --cache 300 -s -a -l -d osm -U postgres -H $PGHOST change.osc
    fi
done
