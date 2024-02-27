import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../generated/assets.dart';
import 'animated_gap_item.dart';
import 'circular_notch_and_corner_clipper.dart';
import 'circular_notched_and_cornered_shape.dart';
import 'curved_custom_painter.dart';
import 'navigation_bar_item.dart';

class PSBottomNavigationBar extends StatefulWidget {
  final Function(int) onTap;
  final int currentIndex;
  final double? elevation;

  const PSBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    this.elevation,
  }) : super(key: key);

  @override
  State<PSBottomNavigationBar> createState() => _PSBottomNavigationBarState();
}

class _PSBottomNavigationBarState extends State<PSBottomNavigationBar> {
  late ValueListenable<ScaffoldGeometry> geometryListenable;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    geometryListenable = Scaffold.geometryOf(context);
  }

  final children = <AssetImage> [
    const AssetImage(Assets.navigationHome),
    const AssetImage(Assets.navigationSearch),
    const AssetImage(Assets.navigationCart),
    const AssetImage(Assets.navigationProfile)
  ];

  @override
  Widget build(BuildContext context) {
    final clipper = CircularNotchedAndCorneredRectangleClipper(
      shape: CircularNotchedAndCorneredRectangle(
        leftCornerRadius: 32,
        rightCornerRadius: 32,
      ),
      geometry: geometryListenable,
      notchMargin: 8,
    );

    return PhysicalShape(
      color: deepBlue.withAlpha(180),
      clipper: clipper,
      child: CurvedCustomPainter(
        clipper: clipper,
        child: Container(
          height: 65,
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15, tileMode: TileMode.mirror),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: items(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> items() {
    final items = <Widget>[];

    for (var index = 0; index < children.length; index++) {
      final isActive = index == widget.currentIndex;

      //Middle Child
      if (index == children.length / 2) {
        items.add(const AnimatedGapView());
      }

      //Rest of the items
      items.add(
        NavigationBarItem(
          isActive: isActive,
          index: index,
          children: children,
          onTap: () => widget.onTap(index),
        ),
      );
    }

    return items;
  }
}
