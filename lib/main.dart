import 'dart:typed_data';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniplus_report_sample/miniplus_report/bar_code.dart';
import 'package:miniplus_report_sample/miniplus_report/mini_plus_report.dart';
import 'package:miniplus_report_sample/test_data/test_data.dart';
import 'package:screenshot/screenshot.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: MiniPlusReportPrint(sampleUserData: sampleUserData, samplePercentData: samplePercentData,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          SizedBox(height: 100),
          Container(
            height: 300,
            width: 300,
            margin: EdgeInsets.symmetric(horizontal: 100.0),
            child: WorkoutChart(
              currentLeftHandForce: 40,
              previousLeftHandForce: 50,
              currentRightHandForce: 40,
              previousRightHandForce: 50,
            ),
          ),
          SizedBox(height: 100),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(CupertinoPageRoute(
                  builder: (BuildContext context) => MiniPlusReportPrint(
                      sampleUserData: sampleUserData,
                      samplePercentData: samplePercentData),
                ));
              },
              child: Text('Report'))
        ],
      ),
    );
  }
}


