#!/usr/bin/env bash
BASE_DIR=/home/osmimport
WORKOSM_DIR=/home/data
PGHOST=localhost
#PGUSER=postgres
#PGPASSWORD=postgres

for f in $WORKOSM_DIR/*; do
    if [ -d ${f} ]; then
	country=$(basename "$f")
	cd $WORKOSM_DIR/$country
        osmosis --read-replication-interval workingDirectory="." --simplify-change --write-xml-change
        osm2pgsql -s --cache 300 -a -l --style $BASE_DIR/osm2pgsql/default.style -d osm -U postgres -H $PGHOST change.osc
    fi
done
