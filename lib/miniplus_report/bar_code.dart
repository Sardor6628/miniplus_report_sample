import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class WorkoutChart extends StatelessWidget {
  final num prevRight;
  final num prevLeft;
  final num currRight;
  final num currLeft;
  int width4X = 3;
  bool isRightLeft;

  WorkoutChart(
      {required this.prevRight,
      required this.prevLeft,
      required this.currRight,
      required this.currLeft,
      this.isRightLeft=true
      });

  @override
  Widget build(BuildContext context) {
    bool isZero =
        prevRight == 0 && prevLeft == 0 && currRight == 0 && currLeft == 0;
    return MediaQuery(
      data: MediaQueryData(),
      child: Stack(
        children: [
          Container(
            height: width4X * 55,
            width: width4X * 92,
            margin: EdgeInsets.only(bottom: width4X * 30, top: width4X * 25),
            // color: Colors.white,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.center,
                barTouchData: BarTouchData(
                    enabled: true,
                    touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: Colors.transparent,
                        tooltipPadding: EdgeInsets.zero,
                        tooltipMargin: 0,
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          if (groupIndex == 0 && !isZero) {
                            return BarTooltipItem(
                                rod.toY.round().toString(),
                                TextStyle(
                                    color: Color(0xff7d7e80),
                                    fontWeight: FontWeight.bold,
                                    fontSize: width4X * 6));
                          } else if (!isZero) {
                            return BarTooltipItem(
                                rod.toY.round().toString(),
                                TextStyle(
                                    color: Color(0xff1d3b67),
                                    fontWeight: FontWeight.bold,
                                    fontSize: width4X * 6));
                          }
                        })),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(
                    show: true,
                    border: Border(
                      bottom: BorderSide(
                          color: Color(0xff7D7E80), width: width4X * 1),
                    )),
                gridData: FlGridData(show: false),
                groupsSpace: width4X * 17,
                barGroups: [
                  BarChartGroupData(x: 0, barsSpace: width4X * 7, barRods: [
                    BarChartRodData(
                        toY: prevLeft.floorToDouble(),
                        color: const Color(0x8ce8dfd4),
                        width: width4X * 10,
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        backDrawRodData: BackgroundBarChartRodData(
                          show: false,
                          color: const Color(0x8ce8dfd4),
                        )),
                    BarChartRodData(
                        toY: prevRight.floorToDouble(),
                        color: const Color(0x8c1d3b67),
                        width: width4X * 10,
                        borderRadius: BorderRadius.all(Radius.circular(0)))
                  ], showingTooltipIndicators: [
                    0,
                    1
                  ]),
                  BarChartGroupData(x: 1, barsSpace: width4X * 7, barRods: [
                    BarChartRodData(
                        toY: currLeft.floorToDouble(),
                        color: const Color(0xffe8dfd4),
                        width: width4X * 10,
                        borderRadius: BorderRadius.all(Radius.circular(0))),
                    BarChartRodData(
                        toY: currRight.floorToDouble(),
                        color: const Color(0xff1d3b67),
                        width: width4X * 10,
                        borderRadius: BorderRadius.all(Radius.circular(0)))
                  ], showingTooltipIndicators: [
                    0,
                    1
                  ]),
                ],
              ),
            ),
          ),
          Positioned(
            left: width4X * 46,
            child: Image.asset("assets/images/vertical_line.png"),
          ),
          Positioned(
              left: width4X * 12,
              bottom: width4X * 21,
              child: Text(isRightLeft?"좌":"전",
                  style: TextStyle(
                      color: const Color(0xff7d7e80),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Pretendard",
                      fontStyle: FontStyle.normal,
                      fontSize: width4X * 7.0),
                  textAlign: TextAlign.center)),
          Positioned(
              left: width4X * 29,
              bottom: width4X * 21,
              child: Text(isRightLeft?"우":"후",
                  style: TextStyle(
                      color: const Color(0xff7d7e80),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Pretendard",
                      fontStyle: FontStyle.normal,
                      fontSize: width4X * 7.0),
                  textAlign: TextAlign.center)),
          Positioned(
              right: width4X * 12,
              bottom: width4X * 21,
              child: Text(isRightLeft?"우":"후",
                  style: TextStyle(
                      color: const Color(0xff7d7e80),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Pretendard",
                      fontStyle: FontStyle.normal,
                      fontSize: width4X * 7.0),
                  textAlign: TextAlign.center)),
          Positioned(
              right: width4X * 29,
              bottom: width4X * 21,
              child: Text(isRightLeft?"좌":"전",
                  style: TextStyle(
                      color: const Color(0xff7d7e80),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Pretendard",
                      fontStyle: FontStyle.normal,
                      fontSize: width4X * 7.0),
                  textAlign: TextAlign.center)),
          Positioned(
              bottom: width4X * 1,
              left: width4X * 12,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width4X * 4, vertical: width4X * 1),
                decoration: BoxDecoration(
                  color: Color(0xfff1f1f1),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Text("이전",
                    style: TextStyle(
                        color: const Color(0xff646566),
                        fontWeight: FontWeight.w500,
                        fontFamily: "Pretendard",
                        fontStyle: FontStyle.normal,
                        fontSize: width4X * 9.0),
                    textAlign: TextAlign.left),
              )),
          Positioned(
              bottom: width4X * 1,
              right: width4X * 12,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width4X * 4, vertical: width4X * 1),
                decoration: BoxDecoration(
                    // color: Color(0xfff1f1f1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      color: Color(0xffb1b3b5),
                    )),
                child: Text("최근",
                    style: TextStyle(
                        color: const Color(0xff646566),
                        fontWeight: FontWeight.w500,
                        fontFamily: "Pretendard",
                        fontStyle: FontStyle.normal,
                        fontSize: width4X * 9.0),
                    textAlign: TextAlign.left),
              )),
          Positioned(
              top: width4X * 4,
              left: width4X * 12,
              child: Visibility(
                visible: !isZero,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width4X * 4, vertical: width4X * 1),
                  decoration: BoxDecoration(
                      color: Color(0xfff1f1f1),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: Border.all(
                        color: Color(0xfff1f1f1),
                      )),
                  child: Text(
                      "${(prevLeft - prevRight).abs().toStringAsFixed(1)}",
                      style: TextStyle(
                          color: const Color(0xff646566),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Pretendard",
                          fontStyle: FontStyle.normal,
                          fontSize: width4X * 6.0),
                      textAlign: TextAlign.left),
                ),
              )),
          Positioned(
              top: width4X * 4,
              right: width4X * 12,
              child: Visibility(
                visible: !isZero,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width4X * 4, vertical: width4X * 1),
                  decoration: BoxDecoration(
                      // color: Color(0xfff1f1f1),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: Border.all(
                        color: Color(0xff1d3b67),
                      )),
                  child: Text(
                      "${(currLeft - currRight).abs().toStringAsFixed(1)}",
                      style: TextStyle(
                          color: const Color(0xff1d3b67),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Pretendard",
                          fontStyle: FontStyle.normal,
                          fontSize: width4X * 6.0),
                      textAlign: TextAlign.left),
                ),
              )),
          Positioned(
              left: width4X * 25,
              top: width4X * 40,
              child: Visibility(
                visible: isZero,
                child: Text("측정이 필요합니다.",
                    style:  TextStyle(
                        color: const Color(0xff7d7e80),
                        fontWeight: FontWeight.w500,
                        fontFamily: "Pretendard",
                        fontStyle: FontStyle.normal,
                        fontSize: width4X*6.0),
                    textAlign: TextAlign.center),
              ))
        ],
      ),
    );
  }


}
