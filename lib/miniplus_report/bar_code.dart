import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
class WorkoutChart extends StatelessWidget {
  final double currentLeftHandForce;
  final double previousLeftHandForce;
  final double currentRightHandForce;
  final double previousRightHandForce;
  int width4X = 3;

  WorkoutChart(
      {required this.currentLeftHandForce,
        required this.previousLeftHandForce,
        required this.currentRightHandForce,
        required this.previousRightHandForce});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(),
      child: Container(
        height: 110,
        width: 1 * 92,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.center,
            maxY: 100,
            barTouchData: BarTouchData(enabled: true,
                touchTooltipData: BarTouchTooltipData(
                    tooltipBgColor: Colors.transparent,
                    tooltipPadding: EdgeInsets.zero,
                    tooltipMargin: 0,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      if(groupIndex==0){
                        return BarTooltipItem(
                            rod.toY.round().toString(),
                            TextStyle(
                                color: Color(0xff7d7e80),
                                fontWeight: FontWeight.bold,
                                fontSize: width4X * 6));
                      }
                      else{
                        return BarTooltipItem(
                            rod.toY.round().toString(),
                            TextStyle(
                                color: Color(0xff1d3b67),
                                fontWeight: FontWeight.bold,
                                fontSize: width4X * 6));
                      }
                    })),

            titlesData: FlTitlesData(show: false),
            borderData: FlBorderData(show: false),
            gridData: FlGridData(show: false),
            groupsSpace: width4X * 17,
            barGroups: [
              BarChartGroupData(x: 0, barsSpace: width4X * 7,

                  barRods: [
                    BarChartRodData(
                        toY: previousLeftHandForce,
                        color: const Color(0x8ce8dfd4),
                        width: width4X * 10,
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        backDrawRodData: BackgroundBarChartRodData(
                          show: false,
                          color: const Color(0x8ce8dfd4),
                        )),
                    BarChartRodData(
                        toY: currentLeftHandForce,
                        color: const Color(0x8c1d3b67),
                        width: width4X * 10,
                        borderRadius: BorderRadius.all(Radius.circular(0)))
                  ], showingTooltipIndicators: [
                    0,
                    1
                  ]),
              BarChartGroupData(x: 1, barsSpace: width4X * 7, barRods: [
                BarChartRodData(
                    toY: previousRightHandForce,
                    color: const Color(0xffe8dfd4),
                    width: width4X * 10,
                    borderRadius: BorderRadius.all(Radius.circular(0))),
                BarChartRodData(
                    toY: currentRightHandForce,
                    color: const Color(0xff1d3b67),
                    width: width4X * 10,
                    borderRadius: BorderRadius.all(Radius.circular(0)))
              ], showingTooltipIndicators: [
                0,
                1,
              ]),
            ],
          ),
        ),
      ),
    );
  }
}