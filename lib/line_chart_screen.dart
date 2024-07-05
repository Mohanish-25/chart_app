import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartScreen extends StatelessWidget {
  const LineChartScreen({super.key, required this.spots});
  final List<FlSpot> spots;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Line Chart'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Text(
                'Temperature vs Humidity',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              AspectRatio(
                aspectRatio: 0.6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LineChart(
                    LineChartData(
                      minX: 22,
                      maxX: 31,
                      minY: 50,
                      maxY: 80,
                      titlesData: const FlTitlesData(
                          leftTitles: AxisTitles(
                            axisNameWidget: Text(
                              'Humidity',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            sideTitles: SideTitles(showTitles: true),
                          ),
                          bottomTitles: AxisTitles(
                            axisNameWidget: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text(
                                  'Temperature ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(Icons.thermostat_rounded, size: 16),
                              ],
                            ),
                            sideTitles: SideTitles(showTitles: true),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false))),
                      lineBarsData: [
                        LineChartBarData(
                          show: true,
                          spots: spots,
                          gradient: const LinearGradient(
                            colors: [
                              Colors.red,
                              Colors.blueAccent,
                              Colors.deepPurple
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topRight,
                          ),
                          barWidth: 2.5,
                          isCurved: true,
                          curveSmoothness: 0.35,
                          belowBarData: BarAreaData(
                            show: true,
                          ),
                        ),
                      ],
                      borderData: FlBorderData(
                        show: true,
                        border: const Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 0.8,
                          ),
                          left: BorderSide(
                            color: Colors.black,
                            width: 0.8,
                          ),
                          right: BorderSide(
                            color: Colors.transparent,
                          ),
                          top: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
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
