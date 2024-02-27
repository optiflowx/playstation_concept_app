import 'package:flutter/material.dart';
import '../../../generated/assets.dart';
import 'scroll_offset.dart';

enum SymbolsOverlayType {
  circleAndTriangle(
    asset: Assets.symbolsOTriangle,
    alignment: Alignment.topLeft,
  ),
  rectangleAndCross(
    asset: Assets.symbolsXSquare,
    alignment: Alignment.topRight,
  );

  const SymbolsOverlayType({
    required this.asset,
    required this.alignment,
  });

  final String asset;

  final Alignment alignment;
}

class SymbolsOverlay extends StatelessWidget {
  const SymbolsOverlay({
    super.key,
    required this.type,
  });

  final SymbolsOverlayType type;

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);

    final side = data.size.width * 0.5;
    final offset = side * 0.4;
    final factor = data.size.height * 0.05;

    return IgnorePointer(
      child: Align(
        alignment: type.alignment,
        child: ScrollOffset(
          scrollable: Scrollable.of(context)!,
          factor: factor,
          initialOffset: Offset(
            type.alignment.x < Alignment.center.x ? -offset : offset,
            0,
          ),
          child: SizedBox(
            height: side,
            width: side,
            child: Image.asset(
              type.asset,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
