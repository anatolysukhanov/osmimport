if [ -z "$1" ];
then
	echo "Please specify country name"
	exit
fi

mkdir $1

BASE_DIR=/home/osm
WORKOSM_DIR=/home/osm/$1
PBF_FILE=$1-latest.osm.pbf

cd $WORKOSM_DIR
wget https://download.geofabrik.de/europe/$PBF_FILE

REPLICATION_BASE_URL="$(osmium fileinfo -g 'header.option.osmosis_replication_base_url' "${PBF_FILE}")"
echo -e "baseUrl=${REPLICATION_BASE_URL}\nmaxInterval=86400" > "${WORKOSM_DIR}/configuration.txt"
sed -i 's!baseUrl=http://download.geofabrik.de/!baseUrl=https://download.geofabrik.de/!' configuration.txt

REPLICATION_SEQUENCE_NUMBER="$( printf "%09d" "$(osmium fileinfo -g 'header.option.osmosis_replication_sequence_number' "${PBF_FILE}")" | sed ':a;s@\B[0-9]\{3\}\>@/&@;ta' )"
curl -s -L -o "${WORKOSM_DIR}/state.txt" "${REPLICATION_BASE_URL}/${REPLICATION_SEQUENCE_NUMBER}.state.txt"

PGHOST=localhost
psql -d osm -U postgres -h $PGHOST -f $BASE_DIR/sql/before.sql
osm2pgsql -s -C 1200 -a -l -d osm -U postgres -H $PGHOST $PBF_FILE
psql -d osm -U postgres -h $PGHOST -f $BASE_DIR/sql/after.sql