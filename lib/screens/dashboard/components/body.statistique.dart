import 'package:flutter/material.dart';
import 'package:prosms/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// Dashboard Body Content
class StatistiqueBody extends StatelessWidget {
  const StatistiqueBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: psBackgroundColor,
      child: ListView(children: [
        SizedBox(
          height: screenHeight * 0.3,
          child: SfCartesianChart(
            enableAxisAnimation: true,
            primaryXAxis: CategoryAxis(),
            series: <ChartSeries>[
              // Initialize line series
              LineSeries<ChartData, String>(
                  dataSource: [
                    // Bind data source
                    ChartData('Jan', 35),
                    ChartData('Feb', 28),
                    ChartData('Mar', 34),
                    ChartData('Apr', 32),
                    ChartData('May', 40)
                  ],
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y),
            ],
          ),
        )
      ]),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
