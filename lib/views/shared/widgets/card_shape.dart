import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class CustomMoneyCard extends CustomPainter {
  final List<Color> colors;
  CustomMoneyCard({
    required this.colors,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    paint0.shader = ui.Gradient.linear(
        Offset(size.width * -0.00, size.height * 0.58),
        Offset(size.width * 1.00, size.height * 0.58),
        colors,
        [0.00, 1.00]);

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.6700750);
    path0.quadraticBezierTo(
        size.width * 0.000, size.height * 0.7506500, 0, size.height);
    path0.lineTo(size.width, size.height);
    path0.quadraticBezierTo(size.width, size.height * 0.4450000, size.width,
        size.height * 0.3267500);
    path0.cubicTo(size.width, size.height * 0.30, size.width,
        size.height * 0.2403250, size.width * 0.93, size.height * 0.25);
    path0.quadraticBezierTo(size.width * 0.7219000, size.height * 0.3208250,
        size.width * 0.0537200, size.height * 0.5913000);
    path0.quadraticBezierTo(size.width * 0.0014400, size.height * 0.6129250, 0,
        size.height * 0.6700750);
    path0.close();
    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
