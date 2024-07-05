import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartScreen extends StatelessWidget {
  final List<BarChartGroupData> rodData;
  const BarChartScreen({super.key, required this.rodData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bar Graph'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Text(
                'Wind Speed vs Day',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              AspectRatio(
                aspectRatio: 0.6,
                child: BarChart(
                  BarChartData(
                    maxY: 24,
                    borderData: FlBorderData(
                      show: true,
                      border: const Border(
                        top: BorderSide(color: Colors.black54),
                        right: BorderSide(color: Colors.black54),
                        left: BorderSide(color: Colors.black54),
                        bottom: BorderSide(color: Colors.black54),
                      ),
                    ),
                    barGroups: rodData,
                    titlesData: FlTitlesData(
                      leftTitles: const AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          reservedSize: 40,
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            return SideTitleWidget(
                                axisSide: meta.axisSide,
                                child: switch (value.toInt()) {
                                  1 => const Text('Mon'),
                                  2 => const Text('Tue'),
                                  3 => const Text('Wed'),
                                  4 => const Text('Thu'),
                                  5 => const Text('Fri'),
                                  6 => const Text('Sat'),
                                  7 => const Text('Sun'),
                                  _ => Text(meta.formattedValue),
                                });
                          },
                        ),
                      ),
                      rightTitles: const AxisTitles(
                        axisNameWidget: Text('Wind Speed'),
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                      topTitles: const AxisTitles(
                        axisNameWidget: Text('Days'),
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    backgroundColor: Colors.purple.withOpacity(0.15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
