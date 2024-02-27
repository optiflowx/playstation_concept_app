import 'package:flutter/material.dart';

class StoreItemCardWrapper extends StatefulWidget {
  final bool shouldKeepAlive;
  final Widget child;

  const StoreItemCardWrapper({
    Key? key,
    this.shouldKeepAlive = false,
    required this.child,
  }) : super(key: key);

  @override
  State<StoreItemCardWrapper> createState() => _StoreItemCardWrapperState();
}

class _StoreItemCardWrapperState extends State<StoreItemCardWrapper>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final Duration animationDuration = const Duration(milliseconds: 650);
  late final AnimationController animationController;
  late final Animation<double> scaleAnimation;
  late final Animation<double> opacityAnimation;

  @override
  bool get wantKeepAlive => widget.shouldKeepAlive;

  @override
  void initState() {
    //AnimationController has to initialized first to be used in the ff animations.
    animationController = AnimationController(
      vsync: this,
      duration: animationDuration,
    )..forward();

    scaleAnimation = Tween<double>(begin: 0.35, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.2, 1.0, curve: Curves.easeIn),
      ),
    );

    opacityAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
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
      builder: (context, child) {
        return ScaleTransition(
          scale: scaleAnimation,
          child: FadeTransition(
            opacity: opacityAnimation,
            child: child!,
          ),
        );
      },
    );
  }
}
