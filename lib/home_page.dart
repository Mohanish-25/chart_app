import 'package:chart_app/bar_chart_screen.dart';
import 'package:chart_app/csv_data_loader.dart';
import 'package:chart_app/line_chart_screen.dart';
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
        title: const Text(
          'Data',
          style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  color: index == 0
                      ? Colors.deepPurpleAccent.withOpacity(0.4)
                      : Colors.white,
                  child: ListTile(
                    leading: Text(data[index][0].toString()),
                    title: Text(data[index][6].toString()),
                    trailing: Text('${data[index][1].toString()}°C'),
                    subtitle: Text('${data[index][4].toString()}km/h'),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LineChartScreen(
                                  spots: _csvDataLoader.getSpots(),
                                )));
                  },

                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.deepPurple.withOpacity(0.2),
                    ),
                    foregroundColor:
                        MaterialStateProperty.all(Colors.deepPurple),
                  ), // Call loadData instead of loadCSV directly
                  child: const Icon(Icons.show_chart),
                ),
                TextButton(
                  onPressed: () {
                    print(_csvDataLoader.getRodData());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BarChartScreen(
                          rodData: _csvDataLoader.getRodData(),
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.deepPurple.withOpacity(0.2),
                    ),
                    foregroundColor:
                        MaterialStateProperty.all(Colors.deepPurple),
                  ),
                  child: const Icon(Icons.bar_chart),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
