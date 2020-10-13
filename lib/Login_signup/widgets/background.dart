import 'package:flutter/material.dart';

class ContainerShape extends CustomPainter {
  Color color;
  double curveSize = 40.0;
  bool isUserId;
  double bottomLength;
  ContainerShape({this.color, this.isUserId, this.bottomLength});

  Paint getPaint(Color color) {
    return Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (isUserId) {
      drawUserIdBackdrop(canvas, size);
    } else {
      drawUserSocialMediaBackdrop(canvas, size);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return isUserId;
  }

  drawUserIdBackdrop(Canvas canvas, Size size) {
    Paint bgPaint = getPaint(color);

    Path path = Path()..moveTo(0, curveSize);

    path.quadraticBezierTo(0, 0, curveSize, 0);

    path.lineTo(size.width - curveSize, 0);
    path.quadraticBezierTo(size.width, 0, size.width, curveSize);
    path.lineTo(size.width, size.height - curveSize);
    path.quadraticBezierTo(
        size.width, size.height, size.width - curveSize, size.height);
    path.lineTo(curveSize, size.height * (0.8 + bottomLength));
    path.quadraticBezierTo(0, size.height * (0.77 + bottomLength), 0,
        size.height * (0.67 + bottomLength));

    path.close();
    canvas.drawPath(path, bgPaint);
  }

  drawUserSocialMediaBackdrop(Canvas canvas, Size size) {
    Paint bgPaint = getPaint(color);

    Path path = Path()..moveTo(0, curveSize);

    path.quadraticBezierTo(0, 0, curveSize, 0);

    path.lineTo(size.width - curveSize, size.height * 0.28);
    path.quadraticBezierTo(
        size.width, size.height * 0.32, size.width, size.height * 0.44);
    path.lineTo(size.width, size.height - curveSize);
    path.quadraticBezierTo(
        size.width, size.height, size.width - curveSize, size.height);
    path.lineTo(curveSize, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - curveSize);

    path.close();
    canvas.drawPath(path, bgPaint);
  }
}
