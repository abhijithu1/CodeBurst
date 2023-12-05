import 'dart:io';
import 'package:excel/excel.dart';

void main() async {
  // Specify the path to your Excel file
  var file = 'path/to/your/excel/file.xlsx';

  // Read the Excel file as bytes
  var bytes = File(file).readAsBytesSync();

  // Decode the Excel file
  var excel = Excel.decodeBytes(bytes);

  // Extract data from the first sheet (you may adjust as needed)
  var sheet = excel.tables.keys.first;
  var table = excel.tables[sheet]!;

  // Convert the table data to a list of maps
  List<Map<String, dynamic>> excelDataList = [];

  // Iterate through rows in the table
  for (var row in table.rows) {
    // Create a map for each row
    Map<String, dynamic> rowData = {};

    // Iterate through cells in the row and add to the map
    for (var i = 0; i < row.length; i++) {
      // var columnName = table.columns[i].name;
      // rowData[columnName] = row[i]?.value;
    }

    // Add the map to the list
    excelDataList.add(rowData);
  }

  // Print the converted list
  print(excelDataList);
}
