import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GameCardWrapper extends StatefulWidget {
  final Widget child;
  final bool shouldKeepAlive;
  final ScrollDirection scrollDirection;

  const GameCardWrapper({
    Key? key,
    this.shouldKeepAlive = false,
    required this.scrollDirection,
    required this.child,
  }) : super(key: key);

  @override
  State<GameCardWrapper> createState() => _GameCardWrapperState();
}

class _GameCardWrapperState extends State<GameCardWrapper>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final AnimationController animationController;
  late final Animation<double> scaleAnimation;
  late final Animation<double> perspectiveAnimation;
  late final Animation<AlignmentGeometry> alignmentAnimation;

  @override
  bool get wantKeepAlive => widget.shouldKeepAlive;

  @override
  void initState() {
    const double perspectiveValue = 0.005;
    const Duration duration = Duration(milliseconds: 800);

    final double perspectiveDirectionMultiplier =
    widget.scrollDirection == ScrollDirection.forward ? -0.75 : 0.75;

    final AlignmentGeometry directionAlignment =
    widget.scrollDirection == ScrollDirection.forward
        ? Alignment.bottomCenter
        : Alignment.topCenter;

    animationController = AnimationController(
      vsync: this,
      duration: duration,
      reverseDuration: duration,
    )
      ..forward();

    scaleAnimation = Tween<double>(begin: 0.6, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0, 0.5, curve: Curves.easeIn),
      ),
    );

    perspectiveAnimation = Tween<double>(
      begin: perspectiveValue * perspectiveDirectionMultiplier,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0, 1, curve: Curves.easeOut),
      ),
    );

    alignmentAnimation = Tween<AlignmentGeometry>(
      begin: directionAlignment,
      end: Alignment.center,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0, 1, curve: Curves.easeOut),
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
      builder: (context, child) =>
          Container(
            transform: Matrix4.identity()
              ..setEntry(3, 1, perspectiveAnimation.value)
              ..scale(scaleAnimation.value),
            transformAlignment: alignmentAnimation.value,
            child: child,
          ),
    );
  }
}
