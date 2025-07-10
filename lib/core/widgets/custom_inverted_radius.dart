import 'package:flutter/material.dart';

/// for custom inverted radius
class CustomInvertedRadius extends OutlinedBorder {
  const CustomInvertedRadius({this.radius = 40});
  final double radius;
  @override
  CustomInvertedRadius copyWith({BorderSide? side, double? radius}) {
    return CustomInvertedRadius(radius: radius ?? this.radius);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    Path path = Path()
      ..fillType = PathFillType.evenOdd
      ..addRect(rect)
      ..addRRect(RRect.fromRectAndCorners(Rect.fromLTWH(rect.left, rect.bottom - 15, rect.width, 15), topLeft: Radius.circular(radius), topRight: Radius.circular(radius)));
    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return getInnerPath(rect, textDirection: textDirection);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    canvas.drawPath(getInnerPath(rect), Paint()..color = Colors.transparent);
  }

  @override
  ShapeBorder scale(double t) => CustomInvertedRadius(radius: radius * t);
}
