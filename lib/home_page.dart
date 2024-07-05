import 'package:chart_app/csv_data_loader.dart';
import 'package:chart_app/line_chart_screen.dart';
import 'package:chart_app/pie_chart_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CSVDataLoader _csvDataLoader = CSVDataLoader();
  List<List<dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await _csvDataLoader.loadCSV();
    setState(() {
      data = _csvDataLoader
          .data; // Assuming CSVDataLoader exposes the raw data list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LineChartScreen(
                                spots: _csvDataLoader.getSpots(),
                              )));
                }, // Call loadData instead of loadCSV directly
                child: const Icon(Icons.show_chart),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PieChartScreen(),
                    ),
                  );
                },
                child: const Icon(Icons.pie_chart_outline),
              ),
              TextButton(
                onPressed: () {},
                child: const Icon(Icons.bar_chart),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
