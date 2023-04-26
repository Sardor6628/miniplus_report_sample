import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
class HalfPieChart extends StatelessWidget {
  var rightForce;
  var leftForce;
  double percent;
  HalfPieChart({required this.rightForce, required this.leftForce, required this.percent });
  double leftFull = 100;
  double rightFull = 100;
  double rightEmpty=0;
  double leftEmpty=0;
  Color leftColor = const Color(0xffFFDB7E);
  Color rightColor = const Color(0xffFAA700);
  @override
  Widget build(BuildContext context) {
    if (leftForce > rightForce) {
      leftFull = 100;
      leftEmpty = 0;
      leftColor=getPrimaryColor();
      rightColor=getSecondaryColor();
      rightFull = (rightForce * 100) ~/ leftForce*1.0;
      rightEmpty = 100 - rightFull;
    } else if(leftForce < rightForce) {
      rightFull = 100;
      rightEmpty = 0;
      rightColor=getPrimaryColor();
      leftColor=getSecondaryColor();
      leftFull = (leftForce * 100) ~/ rightForce*1.0;
      leftEmpty = 100 - leftFull;
    }
    else if (leftForce == rightForce&& leftForce==0){
      rightFull = 0;
      rightEmpty = 100;
      leftFull = 0;
      leftEmpty = 100;
    }
    else if (leftForce == rightForce&& leftForce!=0){
      rightFull = 100;
      rightEmpty = 0;
      rightColor=getPrimaryColor();
      leftColor=getSecondaryColor();
      leftFull = 100;
      leftEmpty = 0;
    }
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
                          value: rightEmpty,
                          radius: 15,
                          color: const Color(0xffF5F5F5),
                          showTitle: false),
                      PieChartSectionData(
                          value: rightFull,
                          color:rightColor,
                          showTitle: false,
                          radius: 15),
                      PieChartSectionData(
                          value: 200, color: Colors.transparent, showTitle: false),
                      PieChartSectionData(
                          value: leftFull,
                          radius: 15,
                          color: leftColor,
                          showTitle: false),
                      PieChartSectionData(
                          value: leftEmpty,
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

  Color getPrimaryColor() {
    if (percent >= 0 && percent < 5)
      return Color(0xff63C805);
    else if (percent >= 5 && percent < 15)
      return Color(0xffF7BE00);
    else if (percent >= 15)
      return Color(0xffF15248);
    else
      return Color(0xff7D7E80);
  }
  Color getSecondaryColor() {
    if (percent >= 0 && percent < 5)
      return Color(0xffD1EEA8);
    else if (percent >= 5 && percent < 15)
      return Color(0xffFFDD7E);
    else if (percent >= 15)
      return Color(0xffFFB9B5);
    else
      return Color(0xff7D7E80);
  }
}
