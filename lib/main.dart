import 'dart:developer';
import 'dart:typed_data';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniplus_report_sample/miniplus_report/bar_code.dart';
import 'package:miniplus_report_sample/miniplus_report/mini_plus_report.dart';
import 'package:miniplus_report_sample/test_data/report_model.dart';
import 'package:miniplus_report_sample/test_data/test_data.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'miniplus_report/semi_pie_chart.dart';

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

          Expanded(
            child: GridView.builder(
                itemCount: sampleUserData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6),
                itemBuilder: (context, index) {
                  return FittedBox(
                    fit: BoxFit.scaleDown,
                    child: InkWell(
                      onTap: () async {
                        ExerciseData? userMiniPlusData = await fetchData(
                            userid: sampleUserData[index].id.toString());
                        log("user information: ${sampleUserData[index].toString()}");
                        log("userMiniPlusData : ${userMiniPlusData.toString()}");
                        if (userMiniPlusData != null&&userMiniPlusData.totalScore!=0) {
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MiniPlusReportPrint(
                                        sampleUserData: sampleUserData[index],
                                        samplePercentData: userMiniPlusData,
                                      )));
                        }
                      },
                      child: Container(
                          // height: 50,
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50)),
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: sampleUserData[index].profileUrl.length >
                                          10
                                      ? Image.network(
                                          sampleUserData[index].profileUrl,
                                          errorBuilder: (context, error,
                                                  stackTrace) =>
                                              Icon(
                                                Icons.manage_accounts_sharp,
                                                color:
                                                    Colors.black.withOpacity(0.5),
                                              ))
                                      : Icon(
                                          Icons.manage_accounts_sharp,
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                ),
                              ),
                              Text(
                                  "${sampleUserData[index].userName}  ${sampleUserData[index].id.toString()}"),
                            ],
                          )),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Future<ExerciseData?> fetchData({required String userid}) async {
    try {
      var url =
          Uri.parse('http://211.253.30.245/php/ronfic_mobile_app/test.php');
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {'user_id': userid},
      );
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        // log("response.body : ${result['result']}");

        ExerciseData futureData =
            ExerciseData.fromJson(result["result"]);
        return futureData;
      } else {
        // If the server did not return a 200 OK response, return false
        return null;
      }
    } catch (e) {
      // If there's an exception while fetching the data, return false
      print('Error fetching data: $e');
      return null;
    }
  }
}
