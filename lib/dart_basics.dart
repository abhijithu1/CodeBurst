import 'dart:io';
import 'package:path/path.dart';
import 'package:excel/excel.dart';

void main(List<String> args) {
  var file = "C:/Users/akash/Desktop/data.xlsx";
  var bytes = File(file).readAsBytesSync();

  // var excel = Excel.createExcel();
  var excel = Excel.decodeBytes(bytes);

  var sheet = excel.sheets.keys.first;
  var table = excel.sheets[sheet]!;

  List<Map<String, dynamic>> excelDataList = [];

  // for (var table in excel.tables.keys) {
  //   print(table);
  //   print(excel.tables[table]!.maxCols);
  //   print(excel.tables[table]!.maxRows);
  //   for (var row in excel.tables[table]!.rows) {
  //     print("${row.map((e) => e?.value)}");
  //   }
  // }

  for (var row in table.rows) {
    // Ensure that there are at least two cells in the row
    if (row.length >= 2) {
      // Create a map with the first column element as key and the second column element as value
      var rowData = {
        '${row[1]?.value}': row[0]?.value,
      };

      // Add the map to the list
      excelDataList.add(rowData);
    }
  }

  // Print the converted list

  excelDataList.sort((a, b) => a.keys.first.compareTo(b.keys.first));
  print(excelDataList);

  List<Map<String, int>> grp1 = [];
  List<Map<String, int>> grp2 = [];
  List<Map<String, int>> grp3 = [];

  for (int i = 0; i < 18; i++) {}
}
