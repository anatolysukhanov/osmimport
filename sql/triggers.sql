CREATE OR REPLACE FUNCTION planet_osm_point_log_insert()
RETURNS trigger AS
$BODY$
BEGIN
	INSERT INTO planet_osm_point_log(gid, osm_id, access, "addr:housename", "addr:housenumber", "addr:interpolation", admin_level, aerialway, aeroway, amenity, area, barrier, bicycle, brand, bridge, boundary, building, construction, covered, culvert, cutting, denomination, disused, embankment, foot, "generator:source", harbour, highway, historic, horse, intermittent, junction, landuse, layer, leisure, lock, man_made, military, motorcar, name, "natural", office, oneway, operator, place, population, power, power_source, public_transport, railway, ref, religion, route, service, shop, sport, surface, toll, tourism, "tower:type", tunnel, water, waterway, wetland, width, wood, z_order, way, changed_on, action) VALUES(NEW.gid, NEW.osm_id, NEW.access, NEW."addr:housename", NEW."addr:housenumber", NEW."addr:interpolation", NEW.admin_level, NEW.aerialway, NEW.aeroway, NEW.amenity, NEW.area, NEW.barrier, NEW.bicycle, NEW.brand, NEW.bridge, NEW.boundary, NEW.building, NEW.construction, NEW.covered, NEW.culvert, NEW.cutting, NEW.denomination, NEW.disused, NEW.embankment, NEW.foot, NEW."generator:source", NEW.harbour, NEW.highway, NEW.historic, NEW.horse, NEW.intermittent,  NEW.junction, NEW.landuse, NEW.layer, NEW.leisure, NEW.lock, NEW.man_made, NEW.military, NEW.motorcar, NEW.name, NEW."natural", NEW.office, NEW.oneway, NEW.operator, NEW.place, NEW.population, NEW.power, NEW.power_source, NEW.public_transport, NEW.railway, NEW.ref, NEW.religion, NEW.route, NEW.service, NEW.shop, NEW.sport, NEW.surface, NEW.toll, NEW.tourism, NEW."tower:type", NEW.tunnel, NEW.water, NEW.waterway, NEW.wetland, NEW.width, NEW.wood, NEW.z_order, NEW.way, now(), 'insert');
	RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION planet_osm_point_log_update()
RETURNS trigger AS
$BODY$
BEGIN
	INSERT INTO planet_osm_point_log(gid, osm_id, access, "addr:housename", "addr:housenumber", "addr:interpolation", admin_level, aerialway, aeroway, amenity, area, barrier, bicycle, brand, bridge, boundary, building, construction, covered, culvert, cutting, denomination, disused, embankment, foot, "generator:source", harbour, highway, historic, horse, intermittent, junction, landuse, layer, leisure, lock, man_made, military, motorcar, name, "natural", office, oneway, operator, place, population, power, power_source, public_transport, railway, ref, religion, route, service, shop, sport, surface, toll, tourism, "tower:type", tunnel, water, waterway, wetland, width, wood, z_order, way, changed_on, action) VALUES(OLD.gid, OLD.osm_id, OLD.access, OLD."addr:housename", OLD."addr:housenumber", OLD."addr:interpolation", OLD.admin_level, OLD.aerialway, OLD.aeroway, OLD.amenity, OLD.area, OLD.barrier, OLD.bicycle, OLD.brand, OLD.bridge, OLD.boundary, OLD.building, OLD.construction, OLD.covered, OLD.culvert, OLD.cutting, OLD.denomination, OLD.disused, OLD.embankment, OLD.foot, OLD."generator:source", OLD.harbour, OLD.highway, OLD.historic, OLD.horse, OLD.intermittent,  OLD.junction, OLD.landuse, OLD.layer, OLD.leisure, OLD.lock, OLD.man_made, OLD.military, OLD.motorcar, OLD.name, OLD."natural", OLD.office, OLD.oneway, OLD.operator, OLD.place, OLD.population, OLD.power, OLD.power_source, OLD.public_transport, OLD.railway, OLD.ref, OLD.religion, OLD.route, OLD.service, OLD.shop, OLD.sport, OLD.surface, OLD.toll, OLD.tourism, OLD."tower:type", OLD.tunnel, OLD.water, OLD.waterway, OLD.wetland, OLD.width, OLD.wood, OLD.z_order, OLD.way, now(), CAST (TG_ARGV[0] AS action_t));
	RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER planet_osm_point_user_insert
  AFTER INSERT
  ON planet_osm_point
  FOR EACH ROW
  EXECUTE PROCEDURE planet_osm_point_log_insert();

CREATE TRIGGER planet_osm_point_user_update
  AFTER UPDATE
  ON planet_osm_point
  FOR EACH ROW
  EXECUTE PROCEDURE planet_osm_point_log_update('update');

CREATE TRIGGER planet_osm_point_user_delete
  AFTER DELETE
  ON planet_osm_point
  FOR EACH ROW
  EXECUTE PROCEDURE planet_osm_point_log_update('delete');
  
CREATE OR REPLACE FUNCTION planet_osm_line_log_insert()
RETURNS trigger AS
$BODY$
BEGIN
	INSERT INTO planet_osm_line_log(gid, osm_id, access, "addr:housename", "addr:housenumber", "addr:interpolation", admin_level, aerialway, aeroway, amenity, area, barrier, bicycle, brand, bridge, boundary, building, construction, covered, culvert, cutting, denomination, disused, embankment, foot, "generator:source", harbour, highway, historic, horse, intermittent, junction, landuse, layer, leisure, lock, man_made, military, motorcar, name, "natural", office, oneway, operator, place, population, power, power_source, public_transport, railway, ref, religion, route, service, shop, sport, surface, toll, tourism, "tower:type", tunnel, water, waterway, wetland, width, wood, z_order, way_area, way, changed_on, action) VALUES(NEW.gid, NEW.osm_id, NEW.access, NEW."addr:housename", NEW."addr:housenumber", NEW."addr:interpolation", NEW.admin_level, NEW.aerialway, NEW.aeroway, NEW.amenity, NEW.area, NEW.barrier, NEW.bicycle, NEW.brand, NEW.bridge, NEW.boundary, NEW.building, NEW.construction, NEW.covered, NEW.culvert, NEW.cutting, NEW.denomination, NEW.disused, NEW.embankment, NEW.foot, NEW."generator:source", NEW.harbour, NEW.highway, NEW.historic, NEW.horse, NEW.intermittent,  NEW.junction, NEW.landuse, NEW.layer, NEW.leisure, NEW.lock, NEW.man_made, NEW.military, NEW.motorcar, NEW.name, NEW."natural", NEW.office, NEW.oneway, NEW.operator, NEW.place, NEW.population, NEW.power, NEW.power_source, NEW.public_transport, NEW.railway, NEW.ref, NEW.religion, NEW.route, NEW.service, NEW.shop, NEW.sport, NEW.surface, NEW.toll, NEW.tourism, NEW."tower:type", NEW.tunnel, NEW.water, NEW.waterway, NEW.wetland, NEW.width, NEW.wood, NEW.z_order, NEW.way_area, NEW.way, now(), 'insert');
	RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION planet_osm_line_log_update()
RETURNS trigger AS
$BODY$
BEGIN
	INSERT INTO planet_osm_line_log(gid, osm_id, access, "addr:housename", "addr:housenumber", "addr:interpolation", admin_level, aerialway, aeroway, amenity, area, barrier, bicycle, brand, bridge, boundary, building, construction, covered, culvert, cutting, denomination, disused, embankment, foot, "generator:source", harbour, highway, historic, horse, intermittent, junction, landuse, layer, leisure, lock, man_made, military, motorcar, name, "natural", office, oneway, operator, place, population, power, power_source, public_transport, railway, ref, religion, route, service, shop, sport, surface, toll, tourism, "tower:type", tunnel, water, waterway, wetland, width, wood, z_order, way_area, way, changed_on, action) VALUES(OLD.gid, OLD.osm_id, OLD.access, OLD."addr:housename", OLD."addr:housenumber", OLD."addr:interpolation", OLD.admin_level, OLD.aerialway, OLD.aeroway, OLD.amenity, OLD.area, OLD.barrier, OLD.bicycle, OLD.brand, OLD.bridge, OLD.boundary, OLD.building, OLD.construction, OLD.covered, OLD.culvert, OLD.cutting, OLD.denomination, OLD.disused, OLD.embankment, OLD.foot, OLD."generator:source", OLD.harbour, OLD.highway, OLD.historic, OLD.horse, OLD.intermittent,  OLD.junction, OLD.landuse, OLD.layer, OLD.leisure, OLD.lock, OLD.man_made, OLD.military, OLD.motorcar, OLD.name, OLD."natural", OLD.office, OLD.oneway, OLD.operator, OLD.place, OLD.population, OLD.power, OLD.power_source, OLD.public_transport, OLD.railway, OLD.ref, OLD.religion, OLD.route, OLD.service, OLD.shop, OLD.sport, OLD.surface, OLD.toll, OLD.tourism, OLD."tower:type", OLD.tunnel, OLD.water, OLD.waterway, OLD.wetland, OLD.width, OLD.wood, OLD.z_order, OLD.way_area, OLD.way, now(), CAST (TG_ARGV[0] AS action_t));
	RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER planet_osm_line_user_insert
  AFTER INSERT
  ON planet_osm_line
  FOR EACH ROW
  EXECUTE PROCEDURE planet_osm_line_log_insert();

CREATE TRIGGER planet_osm_line_user_update
  AFTER UPDATE
  ON planet_osm_line
  FOR EACH ROW
  EXECUTE PROCEDURE planet_osm_line_log_update('update');

CREATE TRIGGER planet_osm_line_user_delete
  AFTER DELETE
  ON planet_osm_line
  FOR EACH ROW
  EXECUTE PROCEDURE planet_osm_line_log_update('delete');

CREATE OR REPLACE FUNCTION planet_osm_polygon_log_insert()
RETURNS trigger AS
$BODY$
BEGIN
	INSERT INTO planet_osm_polygon_log(gid, osm_id, access, "addr:housename", "addr:housenumber", "addr:interpolation", admin_level, aerialway, aeroway, amenity, area, barrier, bicycle, brand, bridge, boundary, building, construction, covered, culvert, cutting, denomination, disused, embankment, foot, "generator:source", harbour, highway, historic, horse, intermittent, junction, landuse, layer, leisure, lock, man_made, military, motorcar, name, "natural", office, oneway, operator, place, population, power, power_source, public_transport, railway, ref, religion, route, service, shop, sport, surface, toll, tourism, "tower:type", tunnel, water, waterway, wetland, width, wood, z_order, way_area, way, changed_on, action) VALUES(NEW.gid, NEW.osm_id, NEW.access, NEW."addr:housename", NEW."addr:housenumber", NEW."addr:interpolation", NEW.admin_level, NEW.aerialway, NEW.aeroway, NEW.amenity, NEW.area, NEW.barrier, NEW.bicycle, NEW.brand, NEW.bridge, NEW.boundary, NEW.building, NEW.construction, NEW.covered, NEW.culvert, NEW.cutting, NEW.denomination, NEW.disused, NEW.embankment, NEW.foot, NEW."generator:source", NEW.harbour, NEW.highway, NEW.historic, NEW.horse, NEW.intermittent,  NEW.junction, NEW.landuse, NEW.layer, NEW.leisure, NEW.lock, NEW.man_made, NEW.military, NEW.motorcar, NEW.name, NEW."natural", NEW.office, NEW.oneway, NEW.operator, NEW.place, NEW.population, NEW.power, NEW.power_source, NEW.public_transport, NEW.railway, NEW.ref, NEW.religion, NEW.route, NEW.service, NEW.shop, NEW.sport, NEW.surface, NEW.toll, NEW.tourism, NEW."tower:type", NEW.tunnel, NEW.water, NEW.waterway, NEW.wetland, NEW.width, NEW.wood, NEW.z_order, NEW.way_area, NEW.way, now(), 'insert');
	RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION planet_osm_polygon_log_update()
RETURNS trigger AS
$BODY$
BEGIN
	INSERT INTO planet_osm_polygon_log(gid, osm_id, access, "addr:housename", "addr:housenumber", "addr:interpolation", admin_level, aerialway, aeroway, amenity, area, barrier, bicycle, brand, bridge, boundary, building, construction, covered, culvert, cutting, denomination, disused, embankment, foot, "generator:source", harbour, highway, historic, horse, intermittent, junction, landuse, layer, leisure, lock, man_made, military, motorcar, name, "natural", office, oneway, operator, place, population, power, power_source, public_transport, railway, ref, religion, route, service, shop, sport, surface, toll, tourism, "tower:type", tunnel, water, waterway, wetland, width, wood, z_order, way_area, way, changed_on, action) VALUES(OLD.gid, OLD.osm_id, OLD.access, OLD."addr:housename", OLD."addr:housenumber", OLD."addr:interpolation", OLD.admin_level, OLD.aerialway, OLD.aeroway, OLD.amenity, OLD.area, OLD.barrier, OLD.bicycle, OLD.brand, OLD.bridge, OLD.boundary, OLD.building, OLD.construction, OLD.covered, OLD.culvert, OLD.cutting, OLD.denomination, OLD.disused, OLD.embankment, OLD.foot, OLD."generator:source", OLD.harbour, OLD.highway, OLD.historic, OLD.horse, OLD.intermittent,  OLD.junction, OLD.landuse, OLD.layer, OLD.leisure, OLD.lock, OLD.man_made, OLD.military, OLD.motorcar, OLD.name, OLD."natural", OLD.office, OLD.oneway, OLD.operator, OLD.place, OLD.population, OLD.power, OLD.power_source, OLD.public_transport, OLD.railway, OLD.ref, OLD.religion, OLD.route, OLD.service, OLD.shop, OLD.sport, OLD.surface, OLD.toll, OLD.tourism, OLD."tower:type", OLD.tunnel, OLD.water, OLD.waterway, OLD.wetland, OLD.width, OLD.wood, OLD.z_order, OLD.way_area, OLD.way, now(), CAST (TG_ARGV[0] AS action_t));
	RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER planet_osm_polygon_user_insert
  AFTER INSERT
  ON planet_osm_polygon
  FOR EACH ROW
  EXECUTE PROCEDURE planet_osm_polygon_log_insert();

CREATE TRIGGER planet_osm_polygon_user_update
  AFTER UPDATE
  ON planet_osm_polygon
  FOR EACH ROW
  EXECUTE PROCEDURE planet_osm_polygon_log_update('update');

CREATE TRIGGER planet_osm_polygon_user_delete
  AFTER DELETE
  ON planet_osm_polygon
  FOR EACH ROW
  EXECUTE PROCEDURE planet_osm_polygon_log_update('delete');