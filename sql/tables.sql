ALTER TABLE planet_osm_point ADD gid serial PRIMARY KEY;

ALTER TABLE planet_osm_line ADD gid serial PRIMARY KEY;

ALTER TABLE planet_osm_polygon ADD gid serial PRIMARY KEY;

ALTER TABLE planet_osm_roads ADD gid serial PRIMARY KEY;

CREATE TYPE action_t AS ENUM('insert', 'update', 'delete');

CREATE TABLE planet_osm_point_log AS TABLE planet_osm_point WITH NO DATA;

ALTER TABLE planet_osm_point_log ADD COLUMN id SERIAL PRIMARY KEY;

ALTER TABLE planet_osm_point_log ADD COLUMN changed_on timestamp(6) NOT NULL;

ALTER TABLE planet_osm_point_log ADD COLUMN action action_t NOT NULL;

CREATE TABLE planet_osm_line_log AS TABLE planet_osm_line WITH NO DATA;  

ALTER TABLE planet_osm_line_log ADD COLUMN id SERIAL PRIMARY KEY;

ALTER TABLE planet_osm_line_log ADD COLUMN changed_on timestamp(6) NOT NULL;

ALTER TABLE planet_osm_line_log ADD COLUMN action action_t NOT NULL;

CREATE TABLE planet_osm_polygon_log AS TABLE planet_osm_polygon WITH NO DATA;

ALTER TABLE planet_osm_polygon_log ADD COLUMN id SERIAL PRIMARY KEY;

ALTER TABLE planet_osm_polygon_log ADD COLUMN changed_on timestamp(6) NOT NULL;

ALTER TABLE planet_osm_polygon_log ADD COLUMN action action_t NOT NULL;