import 'package:flutter/material.dart';

/// for custom inverted radius
class CustomInvertedRadius extends OutlinedBorder {
  @override
  OutlinedBorder copyWith({BorderSide? side}) => this;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    Path path = Path()
      ..fillType = PathFillType.evenOdd
      ..addRect(rect)
      ..addRRect(RRect.fromRectAndCorners(Rect.fromLTWH(rect.left, rect.bottom - 12, rect.width, 12), topLeft: Radius.circular(40), topRight: Radius.circular(40)));
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
  ShapeBorder scale(double t) => this;
}
