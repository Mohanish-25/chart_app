import 'package:csv/csv.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';

class CSVDataLoader {
  List<FlSpot> spots = [];
  List<List<dynamic>> data = [];

  Future<void> loadCSV() async {
    try {
      final rawData = await rootBundle.loadString('assets/data.csv');
      List<List<dynamic>> listData =
          const CsvToListConverter().convert(rawData);
      data = listData;
      for (int i = 1; i < data.length; i++) {
        double humidity = double.parse(data[i][2].toString());
        double temperature = double.parse(data[i][1].toString());
        spots.add(FlSpot(temperature, humidity));
      }
    } on FormatException catch (e) {
      print('Error parsing CSV data: ${e.message}');
      print('Error at offset: ${e.offset}');
    } catch (e) {
      print('An unexpected error occurred: $e');
    }
  }

  List<FlSpot> getSpots() {
    return spots;
  }
}
