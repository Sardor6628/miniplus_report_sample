// import 'dart:math';
// import 'dart:ui';
//
// import 'package:pdf/widgets.dart' as pw;
//
// class SemiCirclePieChart extends pw.StatelessWidget {
//   final List<double> data;
//
//   SemiCirclePieChart({required this.data});
//
//   @override
//   pw.Widget build(pw.Context context) {
//     var total = data.fold(0, (sum, value) => sum + value);
//     var radiansPerPoint = (pi / total) * 2;
//
//     var points = <pw.Offset>[];
//     var currentAngle = -pi / 2;
//     for (var i = 0; i < data.length; i++) {
//       var pointAngle = currentAngle + (data[i] * radiansPerPoint);
//       points.add(pw.Offset(cos(pointAngle), sin(pointAngle)));
//       currentAngle = pointAngle;
//     }
//
//     var path = pw.Path()
//       ..moveTo(0, 0)
//       ..addPolygon(points, false)
//       ..close();
//
//     return pw.CustomPaint(
//       painter: _SemiCirclePieChartPainter(path),
//     );
//   }
// }
//
// class _SemiCirclePieChartPainter extends pw.CustomPainter {
//   final pw.Path path;
//
//   _SemiCirclePieChartPainter(this.path);
//
//   @override
//   void paint(pw.Canvas canvas, pw.Size size) {
//     var rect = pw.Offset.zero & size;
//     canvas.clipPath(path.getBounds().translate(rect.width / 2, rect.height / 2));
//     canvas.translate(rect.width / 2, rect.height / 2);
//     canvas.rotate(-pi / 2);
//
//     var paint = pw.Paint()
//       ..style = pw.PaintingStyle.stroke
//       ..strokeWidth = 1
//       ..color = PdfColors.black;
//
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant _SemiCirclePieChartPainter oldDelegate) => false;
// }
