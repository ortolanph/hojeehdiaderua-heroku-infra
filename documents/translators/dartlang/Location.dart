class Location {
  int day;
  int month;
  String adminLevel1Name;
  String adminLevel2Name;
  double latitude;
  double longitude;
  int country_id;

  String toSQLInsert() {
    return "INSERT INTO location (id, day, month, adm_level_1_name, adm_level_2_name, latitude, longitude, country_id) VALUES (nextval('seq_location'), ${day}, ${month}, '${normatize(adminLevel1Name)}', '${adminLevel2Name}', ${latitude}, ${longitude}, ${country_id});\n";
  }

  String normatize(String value) {
    return value.replaceAll("'", "''");
  }
}
