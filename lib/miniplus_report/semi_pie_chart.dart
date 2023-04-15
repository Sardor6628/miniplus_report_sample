import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
class HalfPieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 90,
        height: 90,
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 2),
              child: MediaQuery(
                data: MediaQueryData(),
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                          value: 30,
                          radius: 15,
                          color: const Color(0xffF5F5F5),
                          showTitle: false),
                      PieChartSectionData(
                          value: 70,
                          color: const Color(0xffFAA700),
                          showTitle: false,
                          radius: 15),
                      PieChartSectionData(
                          value: 200, color: Colors.transparent, showTitle: false),
                      PieChartSectionData(
                          value: 100,
                          radius: 15,
                          color: const Color(0xffFFDB7E),
                          showTitle: false),
                      PieChartSectionData(
                          value: 0,
                          radius: 15,
                          color: const Color(0xffF5F5F5),
                          showTitle: false),
                    ],
                    startDegreeOffset: -90,
                    borderData: FlBorderData(show: false),
                    pieTouchData: PieTouchData(enabled: false),
                    sectionsSpace: 0,
                    centerSpaceRadius: 30,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 44.5,
              child: Container(
                  width: 1,
                  height: 17,
                  decoration: const BoxDecoration(color:  Color(0xfffaa700))),
            )
          ],
        ),
      ),
    );
  }
}
