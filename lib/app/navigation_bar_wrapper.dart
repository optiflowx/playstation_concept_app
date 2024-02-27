import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/globals.dart';

class NavigationBarWrapper extends ConsumerStatefulWidget {
  final Widget child;

  const NavigationBarWrapper({key, required this.child}) : super(key: key);

  @override
  ConsumerState createState() => _NavigationBarWrapperState();
}

class _NavigationBarWrapperState extends ConsumerState<NavigationBarWrapper>
    with SingleTickerProviderStateMixin {
  late final Animation<double> animation;
  late final Animation<double> opacity;
  final duration = const Duration(milliseconds: 800);
  final reverseDuration = const Duration(milliseconds: 800);

  @override
  void initState() {
    super.initState();
    navBarAnimationController = AnimationController(
        duration: duration, reverseDuration: reverseDuration, vsync: this)
      ..forward();

    animation = Tween<double>(begin: 300, end: 0).animate(
        CurvedAnimation(parent: navBarAnimationController, curve: Curves.easeOut));
    opacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: navBarAnimationController, curve: const Interval(0, 0.65)));
  }

  @override
  void dispose() {
    navBarAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: navBarAnimationController,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(0, animation.value),
          child: Opacity(
            opacity: opacity.value,
            child: widget.child,
          ),
        );
      },
    );
  }
}
