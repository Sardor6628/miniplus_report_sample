import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:miniplus_report_sample/main.dart';
import 'package:miniplus_report_sample/miniplus_report/bar_code.dart';
import 'package:miniplus_report_sample/miniplus_report/semi_pie_chart.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:screenshot/screenshot.dart';
import '../test_data/report_model.dart';
import '../test_data/user.dart';
import 'miniplus_report_constants.dart';

// ignore: must_be_immutable
class MiniPlusReportPrint extends StatefulWidget {
  UserModel sampleUserData;
  ExerciseData samplePercentData;

  MiniPlusReportPrint(
      {super.key,
      required this.sampleUserData,
      required this.samplePercentData});

  @override
  State<MiniPlusReportPrint> createState() => _MiniPlusReportPrintState();
}

class _MiniPlusReportPrintState extends State<MiniPlusReportPrint> {
  late MininiPlusReportConstants miniPlusReportConstants;

  late UserModel sampleUserData;
  late ExerciseData samplePercentData;

  @override
  void initState() {
    sampleUserData = widget.sampleUserData;
    samplePercentData = widget.samplePercentData;
    miniPlusReportConstants = MininiPlusReportConstants(
        sampleUserData: sampleUserData, samplePercentData: samplePercentData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.keyboard_backspace_sharp,
                ),
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                iconSize: 30,
              );
            },
          ),
        ),
        body: PdfPreview(
          maxPageWidth: 29.7 * MininiPlusReportConstants.cm,
          useActions: true,
          canChangePageFormat: false,
          canChangeOrientation: false,
          canDebug: false,
          pdfFileName: "${sampleUserData.userName}(Miniplus-Report).pdf",
          build: (format) => _generatePdf(
              PdfPageFormat(
                  miniPlusReportConstants.width, miniPlusReportConstants.height,
                  marginAll: 0),
              'Test'),
        ));
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: false);
    final pageTheme = await miniPlusReportConstants.myPageTheme(format);
    ScreenshotController screenshotController = ScreenshotController();
    pw.MemoryImage chartImage = pw.MemoryImage(
        await screenshotController.captureFromWidget(HalfPieChart()));
    pw.MemoryImage barchart = pw.MemoryImage(
        await screenshotController.captureFromWidget(WorkoutChart(
      currentLeftHandForce: 40,
      previousLeftHandForce: 50,
      currentRightHandForce: 40,
      previousRightHandForce: 50,
    )));
    pw.Font godob =
        pw.Font.ttf(await rootBundle.load('assets/fonts/GODOB.ttf'));
    pw.Font gmarketsansttfbold = pw.Font.ttf(
        await rootBundle.load('assets/fonts/GMARKETSANSTTFBOLD.TTF'));
    pw.Font pretendardBold =
        pw.Font.ttf(await rootBundle.load('assets/fonts/Pretendard_bold.ttf'));
    pw.Font pretendardMedium = pw.Font.ttf(
        await rootBundle.load('assets/fonts/Pretendard_Medium.ttf'));
    pw.Font pretendardRegular = pw.Font.ttf(
        await rootBundle.load('assets/fonts/Pretendard_Regular.ttf'));
    pw.Font pretendardSemibold = pw.Font.ttf(
        await rootBundle.load('assets/fonts/Pretendard_SemiBold.ttf'));
    pw.Font sairaStencilOne = pw.Font.ttf(
        await rootBundle.load('assets/fonts/SairaStencilOne-Regular.ttf'));
    final svgImage =
        await rootBundle.loadString('assets/images/bottom_arrow.svg');
    final header = pw.MemoryImage(
        (await rootBundle.load('assets/images/report_header.png'))
            .buffer
            .asUint8List());
    final footer = pw.MemoryImage(
        (await rootBundle.load('assets/images/footer.png'))
            .buffer
            .asUint8List());
    final questionIcon = pw.MemoryImage(
        (await rootBundle.load('assets/images/icon_question.png'))
            .buffer
            .asUint8List());
    final performanceContainer = pw.MemoryImage(
        (await rootBundle.load('assets/images/performance_container.png'))
            .buffer
            .asUint8List());
    final iconAlert = pw.MemoryImage(
        (await rootBundle.load('assets/images/icon_alert.png'))
            .buffer
            .asUint8List());
    final iconNotification = pw.MemoryImage(
        (await rootBundle.load('assets/images/icon_notification.png'))
            .buffer
            .asUint8List());
    final performanceGradeFrame = pw.MemoryImage((await rootBundle.load(
            miniPlusReportConstants
                .getImagePath(samplePercentData.totalScore ?? 0)))
        .buffer
        .asUint8List());
    pdf.addPage(
      pw.Page(
        pageTheme: pageTheme,
        build: (context) {
          return pw.Container(
              height: double.infinity,
              width: double.infinity,
              child: pw.Stack(children: [
                pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Image(header),
                      pw.Image(footer),
                    ]),
                miniPlusReportConstants.positionedTextHeader(godob),
                miniPlusReportConstants.gymAdressWidget(godob),
                miniPlusReportConstants.userInfromationWidget(
                    pretendardRegular, pretendardBold),
                pw.Positioned(
                    top: 91,
                    left: 0,
                    child: pw.Container(
                        width: miniPlusReportConstants.width,
                        height: 1,
                        color: PdfColor.fromHex("#e4e7eb"))),
                pw.Positioned(
                    top: 612.5,
                    left: 30,
                    child: pw.Container(
                        width: miniPlusReportConstants.width - 60,
                        height: 1,
                        color: PdfColor.fromHex("#e4e7eb"))),
                pw.Positioned(
                    top: 112,
                    left: 30,
                    child: pw.Text("미니플러스 근기능 종합 점수",
                        style: pw.TextStyle(
                            color: PdfColor.fromHex("#1d3b67"),
                            font: pretendardBold,
                            fontSize: 14))),
                pw.Positioned(
                    top: 120,
                    left: 350,
                    child: pw.Image(questionIcon, height: 9, width: 9)),
                pw.Positioned(
                    top: 120.5,
                    left: 362,
                    child: pw.Text(
                        "근기능 종합점수 산정 기준 | 평가항목을 각 20점 만점으로 종합 100점 산정",
                        style: pw.TextStyle(
                            color: PdfColor.fromHex("#646566"),
                            font: pretendardRegular,
                            fontSize: 7))),
                pw.Positioned(
                  top: 134,
                  left: 20,
                  child: pw.Container(
                    height: 120,
                    width: miniPlusReportConstants.width - 40,
                    decoration: pw.BoxDecoration(
                        color: PdfColor.fromHex("#ffffff"),
                        border: pw.Border.all(
                            color: PdfColor.fromHex("#e4e7eb"), width: 1),
                        borderRadius: pw.BorderRadius.circular(6)),
                    child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.end,
                        children: [
                          pw.SizedBox(width: 50),
                          pw.Container(
                              height: 100,
                              width: 100,
                              child: pw.Stack(children: [
                                pw.Image(performanceGradeFrame),
                                (pw.Center(
                                    child: pw.Text(
                                        '${samplePercentData.totalScore ?? ''}',
                                        style: pw.TextStyle(
                                            color: PdfColor.fromHex(
                                                miniPlusReportConstants
                                                    .getHexColor(
                                                        samplePercentData
                                                                .totalScore ??
                                                            0)),
                                            font: sairaStencilOne,
                                            fontSize: 42))))
                              ])),
                          pw.SizedBox(width: 20),
                          pw.Text(
                              miniPlusReportConstants.geComments(
                                  samplePercentData.totalScore ?? -1),
                              style: pw.TextStyle(
                                  fontSize: 12,
                                  color: PdfColor.fromHex("#202121"),
                                  font: pretendardMedium)),
                          pw.Spacer(),
                          pw.Image(performanceContainer,
                              height: 70, width: 180),
                          pw.SizedBox(width: 30),
                        ]),
                  ),
                ),
                pw.Positioned(
                    top: 179,
                    left: 375 + ((samplePercentData.totalScore ?? 0) * 1.45),
                    // left: 520,
                    child: pw.SvgImage(
                      svg: svgImage,
                      height: 12,
                      width: 12,
                      colorFilter: miniPlusReportConstants.colorList[
                          ((samplePercentData.totalScore ?? 0) / 10).floor()],
                    )),
                pw.Positioned(
                    top: 274,
                    left: 30,
                    child: pw.Text("미니플러스 근기능 종합 점수",
                        style: pw.TextStyle(
                            color: PdfColor.fromHex("#1d3b67"),
                            font: pretendardBold,
                            fontSize: 14))),
                pw.Positioned(
                    top: 281.5,
                    left: 444,
                    child: pw.Image(questionIcon, height: 9, width: 9)),
                pw.Positioned(
                    top: 282,
                    left: 456,
                    child: pw.Text("측정 결과 | 항목별 최근 측정 데이터 기준",
                        style: pw.TextStyle(
                            color: PdfColor.fromHex("#646566"),
                            font: pretendardRegular,
                            fontSize: 7))),
                pw.Positioned(
                  top: 296,
                  left: 20,
                  child: pw.Container(
                    width: 556,
                    height: 516,
                    decoration: pw.BoxDecoration(
                      color: PdfColor.fromHex("#ffffff"),
                      border: pw.Border.all(
                          color: PdfColor.fromHex("#e4e7eb"), width: 1),
                      borderRadius: pw.BorderRadius.circular(6),
                    ),
                  ),
                ),
                pw.Positioned(
                    top: 612.5,
                    left: 30,
                    child: pw.Container(
                        width: miniPlusReportConstants.width - 60,
                        height: 1,
                        color: PdfColor.fromHex("#e4e7eb"))),
                pw.Positioned(
                    top: 306,
                    left: 30,
                    child: pw.Row(children: [
                      pw.Container(
                        height: 12,
                        width: 3,
                        margin: pw.EdgeInsets.only(right: 4),
                        decoration: pw.BoxDecoration(
                            color: PdfColor.fromHex("#e4e7eb")),
                      ),
                      pw.RichText(
                          text: pw.TextSpan(children: [
                        pw.TextSpan(
                            style: pw.TextStyle(
                                color: PdfColor.fromHex("#7d7e80"),
                                font: pretendardRegular,
                                fontSize: 10.0),
                            text: "항목별 힘차이 측정 결과"),
                        pw.TextSpan(
                            style: pw.TextStyle(
                                fontSize: 6.0,
                                color: PdfColor.fromHex("#7d7e80"),
                                font: pretendardRegular),
                            text: "(%)")
                      ]))
                    ])),
                pw.Positioned(
                    top: 336,
                    left: 77,
                    child: miniPlusReportConstants.chartDisplay(
                      godob: godob,
                      chartImage: chartImage,
                      pretendardMedium: pretendardMedium,
                      pretendardBold: pretendardBold,
                      pretendardSemibold: pretendardSemibold,
                      alertIcon: iconAlert,
                      pushPullRot:
                          miniPlusReportConstants.samplePercentData.push!,
                    )),
                pw.Positioned(
                    top: 336,
                    left: 241,
                    child: miniPlusReportConstants.chartDisplay(
                      alertIcon: iconAlert,
                      godob: godob,
                      chartImage: chartImage,
                      pretendardMedium: pretendardMedium,
                      pretendardBold: pretendardBold,
                      pretendardSemibold: pretendardSemibold,
                      pushPullRot:
                          miniPlusReportConstants.samplePercentData.pull!,
                    )),
                pw.Positioned(
                    top: 336,
                    left: 405,
                    child: miniPlusReportConstants.chartDisplay(
                      alertIcon: iconAlert,
                      godob: godob,
                      chartImage: chartImage,
                      pretendardMedium: pretendardMedium,
                      pretendardBold: pretendardBold,
                      pretendardSemibold: pretendardSemibold,
                      pushPullRot:
                          miniPlusReportConstants.samplePercentData.rot!,
                    )),
                pw.Positioned(
                    top: 472,
                    left: 77,
                    child: miniPlusReportConstants.chartDisplay(
                      alertIcon: iconAlert,
                      godob: godob,
                      chartImage: chartImage,
                      pretendardMedium: pretendardMedium,
                      pretendardBold: pretendardBold,
                      pretendardSemibold: pretendardSemibold,
                      pushPullRot:
                          miniPlusReportConstants.samplePercentData.upcode!,
                    )),
                pw.Positioned(
                    top: 472,
                    left: 241,
                    child: miniPlusReportConstants.chartDisplay(
                      godob: godob,
                      chartImage: chartImage,
                      pretendardMedium: pretendardMedium,
                      pretendardSemibold: pretendardSemibold,
                      pretendardBold: pretendardBold,
                      alertIcon: iconAlert,
                      pushPullRot:
                          miniPlusReportConstants.samplePercentData.lowcode!,
                    )),
                miniPlusReportConstants.listOfWorkoutStatusesWidget(
                    pretendardMedium, pretendardRegular),
                pw.Positioned(
                    top: 628,
                    left: 30,
                    child: pw.Row(children: [
                      pw.Container(
                        height: 12,
                        width: 3,
                        margin: pw.EdgeInsets.only(right: 4),
                        decoration: pw.BoxDecoration(
                            color: PdfColor.fromHex("#e4e7eb")),
                      ),
                      pw.Text("지난 결과와 비교",
                          style: pw.TextStyle(
                              color: PdfColor.fromHex("#7d7e80"),
                              font: pretendardRegular,
                              fontSize: 10.0))
                    ])),
                pw.Positioned(
                    top: 570.5,
                    left: 397.6,
                    child: pw.Row(children: [
                      pw.Image(iconNotification, height: 9, width: 9),
                      pw.SizedBox(width: 5),
                      pw.Text(
                          "항목 간 측정 일수의 차이가 많이 나는 경우(한 달 이상)\n정확한 결과를 위해 재측정이 필요합니다.",
                          style: pw.TextStyle(
                              color: PdfColor.fromHex("#646566"),
                              font: pretendardRegular,
                              fontSize: 7))
                    ])),
                // pw.Positioned(
                //   top:0, right: 200,
                //   child: pw.Container(
                //     color: PdfColors.red,
                //     width: 92,
                //     height: 110,
                //     child: pw.Image(barchart, fit: pw.BoxFit.fitWidth),
                //   ),
                // )   ,
                //
                // pw.Positioned(
                //   top:200, right: 200,
                //   child: pw.Container(
                //     color: PdfColors.red,
                //     width: 92,
                //     height: 110,
                //   ),
                // )
              ]));
        },
      ),
    );

    return pdf.save();
  }
}
