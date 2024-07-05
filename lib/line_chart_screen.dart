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
              const SizedBox(height: 30),
              AspectRatio(
                aspectRatio: 0.6,
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(16.0),
                  child: LineChart(
                    LineChartData(
                      minX: 18,
                      maxX: 27,
                      minY: 55,
                      maxY: 80,
                      titlesData: const FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles:
                                SideTitles(showTitles: true, reservedSize: 40),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles:
                                SideTitles(showTitles: true, reservedSize: 40),
                          ),
                          rightTitles: AxisTitles(
                            axisNameWidget: Text('Humidity'),
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: AxisTitles(
                              axisNameWidget: Text('Temperature'),
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
                            color: Colors.black54,
                            width: 0.8,
                          ),
                          left: BorderSide(
                            color: Colors.black54,
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
                      gridData: const FlGridData(
                        show: true,
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
