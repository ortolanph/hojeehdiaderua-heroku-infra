class Location {
  int day;
  int month;
  String adminLevel1;
  String adminLevel2;
  double latitude;
  double longitude;
  int country_id;

  String toSQLInsert() {
    return "INSERT INTO location (day, month, adm_level_1, adm_level_2, latitude, longitude, country_id) VALUES (${day}, ${month}, '${normatize(adminLevel1)}', '${adminLevel2}', ${latitude}, ${longitude}, ${country_id});\n";
  }

  String normatize(String value) {
    return value.replaceAll("'", "''");
  }
}
