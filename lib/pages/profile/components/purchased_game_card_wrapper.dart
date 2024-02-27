import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PurchasedGamesCardWrapper extends ConsumerStatefulWidget {
  final Widget child;
  final bool shouldKeepAlive;

  const PurchasedGamesCardWrapper({
    Key? key,
    required this.child,
    this.shouldKeepAlive = false,
  }) : super(key: key);

  @override
  ConsumerState createState() => _PurchasedGamesCardWrapperState();
}

class _PurchasedGamesCardWrapperState
    extends ConsumerState<PurchasedGamesCardWrapper>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final AnimationController animationController;
  late final Animation<double> scaleAnimation;

  @override
  bool get wantKeepAlive => widget.shouldKeepAlive;

  @override
  void initState() {
    const Duration duration = Duration(milliseconds: 800);

    animationController = AnimationController(
      vsync: this,
      duration: duration,
      reverseDuration: duration,
    )..forward();

    scaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeOut),
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AnimatedBuilder(
      animation: animationController,
      child: widget.child,
      builder: (context, child) => Container(
        alignment: Alignment.center,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: child,
        ),
      ),
    );
  }
}
