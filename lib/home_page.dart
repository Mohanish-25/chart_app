import 'package:csv/csv.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<FlSpot> spots = [];
  List<List<dynamic>> data = [];
  void loadCSV() async {
    try {
      final _rawData = await rootBundle.loadString('assets/data.csv');
      List<List<dynamic>> _listData =
          const CsvToListConverter().convert(_rawData);
      setState(() {
        data = _listData;
      });
    } on FormatException catch (e) {
      print('Error parsing CSV data: ${e.message}');
      print('Error at offset: ${e.offset}');
      // Consider loading a default dataset or showing an error message
    } catch (e) {
      print('An unexpected error occurred: $e');
    }
    List<List<dynamic>> dataPoints = [];

    for (int i = 1; i < data.length; i++) {
      // Ensure conversion to double is done immediately after extraction
      double humidity = double.parse(data[i][2].toString());
      double temperature = double.parse(data[i][1].toString());
      spots.add(FlSpot(temperature, humidity));
    }

    // for (int i = 1; i < dataPoints.length; i++) {
    //   double x = dataPoints[i][0].toDouble(); // Convert to double
    //   double y = dataPoints[i][1].toDouble();
    //
    // }

    print(spots);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(data[index][0].toString()),
            title: Text(data[index][3].toString()),
            trailing: Text(data[index][1].toString()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: loadCSV, child: const Icon(Icons.add)),
    );
  }
}
