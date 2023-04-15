import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:miniplus_report_sample/test_data/report_model.dart';
import 'package:miniplus_report_sample/test_data/user.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class MininiPlusReportConstants {
  UserModel sampleUserData;
  ExerciseData samplePercentData;

  MininiPlusReportConstants(
      {required this.sampleUserData, required this.samplePercentData});
  List<PdfColor> colorList = [
    PdfColor.fromHex("#584646"),
    PdfColor.fromHex("#c52700"),
    PdfColor.fromHex("#c52700"),
    PdfColor.fromHex("#c52700"),
    PdfColor.fromHex("#e7370b"),
    PdfColor.fromHex("#f49f0e"),
    PdfColor.fromHex("#f6e30d"),
    PdfColor.fromHex("#f6e30d"),
    PdfColor.fromHex("#1aba00"),
    PdfColor.fromHex("#1aba00"),
    PdfColor.fromHex("#1e77ff"),
    PdfColor.fromHex("#1e77ff"),
    PdfColor.fromHex("#1e77ff")
  ];
  static double cm = 72 / 2.54;
  double height = 29.7 * cm;
  double width = 21.0 * cm;

  Future<pw.PageTheme> myPageTheme(PdfPageFormat format) async {
    return pw.PageTheme(
      pageFormat: format,
      theme: pw.ThemeData.withFont(
        base: pw.Font.ttf(
            await rootBundle.load('assets/NanumGothic-Regular.ttf')),
        bold: pw.Font.ttf(
            await rootBundle.load('assets/NanumGothic-ExtraBold.ttf')),
        boldItalic:
            pw.Font.ttf(await rootBundle.load('assets/NanumGothic-Bold.ttf')),
        icons: pw.Font.ttf(
            await rootBundle.load('assets/NanumGothic-Regular.ttf')),
      ),
      buildBackground: (pw.Context context) {
        return pw.FullPage(
          ignoreMargins: false,
          child: pw.Stack(
            children: [],
          ),
        );
      },
    );
  }

  String getImagePath(int score) {
    if (score >= 90 && score <= 100) {
      return 'assets/images/grade_score_verygood.png';
    } else if (score >= 80 && score < 90) {
      return 'assets/images/grade_score_good.png';
    } else if (score >= 70 && score < 80) {
      return 'assets/images/grade_score_norma.png';
    } else if (score >= 1 && score < 70) {
      return 'assets/images/grade_score_bad.png';
    } else {
      return 'assets/images/grade_score_none.png';
    }
  }

  String getHexColor(int score) {
    if (score >= 90 && score <= 100) {
      return '#1E810E';
    } else if (score >= 80 && score < 90) {
      return '#F0AC00';
    } else if (score >= 70 && score < 80) {
      return '#FE8515';
    } else if (score >= 0 && score < 70) {
      return '#E12F03';
    } else {
      return '#E12F03';
    }
  }

  String geComments(int score) {
    if (score >= 90 && score <= 100) {
      return '근기능이 아주 좋아요!\n꾸준히 유지해볼까요';
    } else if (score >= 80 && score < 90) {
      return '근기능이 좋습니다!\n조금만 개선하면 아주 좋을거에요.';
    } else if (score >= 70 && score < 80) {
      return '근기능이 부족합니다.\n운동으로 충분히 좋아질 수 있어요';
    } else if (score >= 10 && score < 70) {
      return '근기능의 개선이 시급합니다.\n우리 같이 운동을 시작해볼까요?';
    } else {
      return '';
    }
  }

  pw.Widget getWidgetStatus(
      {required pw.Font godob,
      required int score,
      required pw.MemoryImage image}) {
    if (score >= 90 && score <= 100) {
      return goodContainerDisplay(godob);
    } else if (score >= 80 && score < 90) {
      return normalContainerDisplay(godob, image: image);
    } else if (score >= 10 && score < 80) {
      return badContainerDisplay(godob, image: image);
    } else {
      return noDataContainerDisplay(godob);
    }
  }

  pw.Positioned goodContainerDisplay(pw.Font godob) {
    return pw.Positioned(
        bottom: 0,
        left: 0,
        child: pw.Container(
            width: 117,
            height: 14,
            alignment: pw.Alignment.center,
            child: pw.Container(
              // width: 14,
              padding: pw.EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              decoration: pw.BoxDecoration(
                  color: PdfColor.fromHex("#087fed"),
                  borderRadius: pw.BorderRadius.circular(7)),
              child: pw.Text("좋음",
                  style: pw.TextStyle(
                      color: PdfColors.white,
                      fontSize: 9,
                      font: godob,
                      fontWeight: pw.FontWeight.bold)),
            )));
  }

  pw.Positioned normalContainerDisplay(pw.Font godob,
      {required pw.MemoryImage image}) {
    return pw.Positioned(
        bottom: 0,
        left: 0,
        child: pw.Container(
            width: 117,
            height: 14,
            alignment: pw.Alignment.center,
            child: pw.Container(
                // width: 14,
                padding: pw.EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: pw.BoxDecoration(
                    color: PdfColor.fromHex("#faa700"),
                    borderRadius: pw.BorderRadius.circular(7)),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [
                      pw.Container(
                        margin: pw.EdgeInsets.only(bottom:2),
                        child: pw.Image(image, width: 9, height: 9)
                      ),
                      pw.SizedBox(width: 3),
                      pw.Text("노력",
                          style: pw.TextStyle(
                              color: PdfColors.white,
                              fontSize: 9,
                              font: godob,
                              fontWeight: pw.FontWeight.bold)),
                    ]))));
  }

  pw.Positioned badContainerDisplay(pw.Font godob,
      {required pw.MemoryImage image}) {
    return pw.Positioned(
        bottom: 0,
        left: 0,
        child: pw.Container(
            width: 117,
            height: 14,
            alignment: pw.Alignment.center,
            child: pw.Container(
              // width: 14,
              padding: pw.EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              decoration: pw.BoxDecoration(
                  color: PdfColor.fromHex("#f15248"),
                  borderRadius: pw.BorderRadius.circular(7)),
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  mainAxisSize: pw.MainAxisSize.min,
                  children: [
                    pw.Container(
                        margin: pw.EdgeInsets.only(bottom:2),
                        child: pw.Image(image, width: 9, height: 8)
                    ),
                    pw.SizedBox(width: 3),
                    pw.Text("위험",
                        style: pw.TextStyle(
                            color: PdfColors.white,
                            fontSize: 9,
                            font: godob,
                            fontWeight: pw.FontWeight.bold)),
                  ]),
            )));
  }

  pw.Positioned noDataContainerDisplay(pw.Font godob) {
    return pw.Positioned(
        bottom: 0,
        left: 0,
        child: pw.Container(
            width: 117,
            height: 14,
            alignment: pw.Alignment.center,
            child: pw.Container(
              // width: 14,
              padding: pw.EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              decoration: pw.BoxDecoration(
                  color: PdfColor.fromHex("#7d7e80"),
                  borderRadius: pw.BorderRadius.circular(7)),
              child: pw.Text("데이터 없음",
                  style: pw.TextStyle(
                      color: PdfColors.white,
                      fontSize: 9,
                      font: godob,
                      fontWeight: pw.FontWeight.bold)),
            )));
  }

  pw.Positioned userInfromationWidget(
      pw.Font pretendardRegular, pw.Font pretendardBold) {
    return pw.Positioned(
        top: 70,
        left: 20,
        child: pw.Container(
          width: width - 40,
          child: pw.Row(children: [
            pw.Expanded(
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                  _headerText("회원번호", sampleUserData.keypad, pretendardRegular,
                      pretendardBold, PdfColor.fromHex("#202121")),
                  _headerText(
                      "나이",
                      "${DateTime.now().year - sampleUserData.birthday.year}",
                      pretendardRegular,
                      pretendardBold,
                      PdfColor.fromHex("#202121")),
                  _headerText(
                      "성별",
                      sampleUserData.gender == "Male" ? '남' : '여',
                      pretendardRegular,
                      pretendardBold,
                      PdfColor.fromHex("#202121")),
                  _headerText(
                      "체중",
                      "${sampleUserData.weight.toStringAsFixed(0)}kg",
                      pretendardRegular,
                      pretendardBold,
                      PdfColor.fromHex("#202121")),
                ])),
            pw.Expanded(
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                  _headerText(
                      "출력일",
                      DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()),
                      pretendardRegular,
                      pretendardBold,
                      PdfColor.fromHex("#646566")),
                ])),
          ]),
        ));
  }

  pw.Positioned gymAdressWidget(pw.Font godob) {
    return pw.Positioned(
      top: 36,
      right: 20,
      child: pw.Text("장소 : ${sampleUserData.clubName} 본사",
          style: pw.TextStyle(
              fontSize: 10, color: PdfColor.fromHex("231815"), font: godob)),
    );
  }

  pw.Positioned positionedTextHeader(pw.Font godob) {
    return pw.Positioned(
        top: 36,
        left: 230,
        child: pw.Text("근기능 측정 결과",
            style: pw.TextStyle(
                fontSize: 10, color: PdfColors.white, font: godob)));
  }

  pw.Row _headerText(String text1, String text2, pw.Font font1, pw.Font font2,
      PdfColor color) {
    return pw.Row(
      children: [
        pw.Text(text1,
            style: pw.TextStyle(fontSize: 10, font: font1, color: color)),
        pw.SizedBox(width: 5),
        pw.Text(text2,
            style: pw.TextStyle(fontSize: 10, font: font2, color: color)),
      ],
    );
  }


  pw.Positioned listOfWorkoutStatusesWidget(pw.Font pretendardMedium, pw.Font pretendardRegular) {
    return pw.Positioned(
      left: 390,
      top: 472,
      child: pw.Container(
          width: 170,
          height: 90,
          decoration: pw.BoxDecoration(
              borderRadius:
              pw.BorderRadius.all(pw.Radius.circular(4)),
              color: PdfColor.fromHex("#fcf9f5")),
          padding: const pw.EdgeInsets.all(10),
          child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                workoutPerformanceStatus(
                    pretendardMedium: pretendardMedium,
                    pretendardRegular: pretendardRegular,
                    colorHex: "#087fed",
                    text1: "좋음",
                    text2: ": 힘 차이가 거의 없습니다."),
                workoutPerformanceStatus(
                    pretendardMedium: pretendardMedium,
                    pretendardRegular: pretendardRegular,
                    colorHex: "#faa700",
                    text1: "노력",
                    text2: ": 표기된 %만큼 그래프가 빈 쪽이 약합니다."),
                workoutPerformanceStatus(
                    pretendardMedium: pretendardMedium,
                    pretendardRegular: pretendardRegular,
                    colorHex: "#f15248",
                    text1: "위험",
                    text2: ": 약한 쪽의 부상 위험이 증가됩니다."),
                workoutPerformanceStatus(
                    pretendardMedium: pretendardMedium,
                    pretendardRegular: pretendardRegular,
                    colorHex: "#7d7e80",
                    text1: "데이터 없음",
                    text2: ""),
              ])),
    );
  }

  pw.Row workoutPerformanceStatus(
      {required pw.Font pretendardMedium,
        required pw.Font pretendardRegular,
        required String colorHex,
        required String text1,
        required String text2}) {
    return pw.Row(children: [
      // Rectangle 7139
      pw.Container(
          width: 10,
          height: 10,
          decoration: pw.BoxDecoration(
              borderRadius: pw.BorderRadius.all(pw.Radius.circular(1)),
              color: PdfColor.fromHex(colorHex))),
      pw.SizedBox(width: 5),
      pw.Text(text1,
          style: pw.TextStyle(
              color: PdfColor.fromHex("#646566"),
              font: pretendardMedium,
              fontSize: 7.0)),
      pw.Text(text2,
          style: pw.TextStyle(
              color: PdfColor.fromHex("#646566"),
              font: pretendardRegular,
              fontSize: 7.0)),
    ]);
  }
  pw.Widget chartDisplay(
      {required pw.MemoryImage chartImage,
        required pw.Font pretendardMedium,
        required pw.Font pretendardSemibold,
        required pw.Font pretendardBold,
        required pw.Font godob,
        required pw.MemoryImage alertIcon,
        required PushPullRot pushPullRot}) {
    return pw.Container(
        height: 112,
        width: 117,
        // color: PdfColors.blue,
        child: pw.Stack(children: [
          pw.Positioned(
              top: 0,
              left: 0,
              child: pw.Container(
                alignment: pw.Alignment.center,
                width: 117,
                child: pw.Text("${pushPullRot.displayRenderingElement}",
                    style: pw.TextStyle(
                        fontSize: 12,
                        color: PdfColor.fromHex("#202121"),
                        font: pretendardSemibold)),
              )),
          pw.Positioned(
              top: 17,
              left: 0,
              child: pw.Container(
                alignment: pw.Alignment.center,
                width: 117,
                child: pw.Text(
                    DateFormat('yyyy-MM-dd').format(pushPullRot.date),
                    style: pw.TextStyle(
                        fontSize: 8,
                        color: PdfColor.fromHex("#646566"),
                        font: pretendardMedium)),
              )),
          pw.Positioned(
            left: 0,
            top: 76,
            child: pw.Text("좌",
                style: pw.TextStyle(
                    fontSize: 8,
                    color: PdfColor.fromHex("#7d7e80"),
                    font: pretendardMedium)),
          ),
          pw.Positioned(
            left: 14,
            top: 40,
            child: pw.Container(width: 90, child: pw.Image(chartImage)),
          ),
          pw.Positioned(
            right: 0,
            top: 76,
            child: pw.Text("우",
                style: pw.TextStyle(
                    fontSize: 8,
                    color: PdfColor.fromHex("#7d7e80"),
                    font: pretendardMedium)),
          ),
          pw.Positioned(
              left: 0,
              top: 68,
              child: pw.Container(
                width: 117,
                alignment: pw.Alignment.center,
                height: 20,
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Text("${pushPullRot.score ?? 0}",
                          style: pw.TextStyle(
                              fontSize: 16,
                              color: PdfColor.fromHex("#202121"),
                              font: pretendardBold)),
                      pw.Text("%",
                          style: pw.TextStyle(
                              fontSize: 6,
                              color: PdfColor.fromHex("#202121"),
                              font: pretendardMedium)),
                    ]),
              )),
          getWidgetStatus(
              godob: godob, score: pushPullRot.score ?? 0, image: alertIcon),
        ]));
  }
}
