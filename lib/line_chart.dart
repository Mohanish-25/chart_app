import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AspectRatio(
            aspectRatio: 0.5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LineChart(
                LineChartData(
                  titlesData: const FlTitlesData(
                      leftTitles: AxisTitles(
                        axisNameWidget: Text('Humidity'),
                      ),
                      bottomTitles: AxisTitles(
                        axisNameWidget: Text('Temperature'),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false))),
                  lineBarsData: [
                    LineChartBarData(
                      show: true,
                      spots: <FlSpot>[
                        const FlSpot(1, 256),
                        const FlSpot(2, 200),
                        const FlSpot(3, 8),
                        const FlSpot(4, 1),
                        const FlSpot(5, 8),
                        const FlSpot(6, 8),
                        const FlSpot(7, 12),
                        const FlSpot(8, 9),
                        const FlSpot(11, 10),
                        const FlSpot(9, 2),
                      ],
                      gradient: const LinearGradient(
                        colors: [
                          Colors.red,
                          Colors.blueAccent,
                          Colors.deepPurple
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topRight,
                      ),
                      barWidth: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
