
import 'package:flutter/material.dart';
import '../constants/colors.dart';

@immutable
class CurvedCustomPainter extends StatelessWidget {
  final CustomClipper<Path> clipper;
  final Widget child;

  const CurvedCustomPainter({super.key,
    required this.clipper,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      key: UniqueKey(),
      painter: _CurvedCustomPainter(
        clipper: clipper,
      ),
      child: ClipPath(clipper: clipper, child: child),
    );
  }
}

class _CurvedCustomPainter extends CustomPainter {
  final CustomClipper<Path> clipper;
  _CurvedCustomPainter({
    required this.clipper,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final clipPath = clipper.getClip(size);

    final borderPaint = Paint()
      ..color = kPrimaryBlueColor
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;

    if (borderPaint.color.value != Colors.transparent.value) {
      canvas.drawPath(clipPath, borderPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
