import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartScreen extends StatelessWidget {
  const PieChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pie Chart'),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Container(
            color: Colors.lightBlueAccent,
            margin: const EdgeInsets.all(20.0),
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                      value: 40, title: '40%', color: Colors.purple),
                  PieChartSectionData(
                      value: 30, title: '30%', color: Colors.blue),
                  PieChartSectionData(
                      value: 15, title: '15%', color: Colors.amber),
                  PieChartSectionData(
                      value: 15, title: '15%', color: Colors.green),
                  PieChartSectionData(
                      value: 10, title: '10%', color: Colors.red)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
