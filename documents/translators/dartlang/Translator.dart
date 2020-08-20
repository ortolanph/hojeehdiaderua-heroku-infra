import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'Location.dart';

main(List arguments) {
  final File inputFile = new File("../../logradourodata.csv");
  final File outputFile = new File("../../inserts.sql");


  Stream<List> inputStream = inputFile.openRead();

  int countryCode = 1;

  inputStream
    .transform(utf8.decoder)
    .transform(new LineSplitter())
    .listen((String line) async {
      List row = line.split(",");

      Location location = new Location();

      location.day = int.parse(row[1]);
      location.month = int.parse(row[2]);
      location.adminLevel1 = row[3];
      location.adminLevel2 = row[4];
      location.latitude = double.parse(row[5]);
      location.longitude = double.parse(row[6]);
      location.country_id = 1;

      await outputFile.writeAsStringSync(location.toSQLInsert(), mode: FileMode.append);
      print(location.toSQLInsert());
  },
      onDone: () { print('File is now closed.'); },
      onError: (e) { print(e.toString()); });
}

