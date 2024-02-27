import 'package:flutter/material.dart';

import '../../generated/assets.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({Key? key}) : super(key: key);

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> topPositionAnimation;
  late final Animation<double> leftPositionAnimation;
  late final Animation<double> bottomPositionAnimation;
  late final Animation<double> rightPositionAnimation;
  late final Animation<double> specialBottomPositionAnimation;
  late final Animation<double> specialLeftPositionAnimation;

  onStatusChangedListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController.reverse();
    } else if (status == AnimationStatus.dismissed) {
      animationController.forward();
    }
  }

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
      reverseDuration: const Duration(milliseconds: 5000),
    )
      ..addStatusListener(onStatusChangedListener)
      ..forward();

    final CurvedAnimation curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceInOut,
    );

    topPositionAnimation =
        Tween<double>(begin: 15, end: 175).animate(curvedAnimation);

    leftPositionAnimation =
        Tween<double>(begin: 15, end: 235).animate(curvedAnimation);

    bottomPositionAnimation =
        Tween<double>(begin: 350, end: 120).animate(curvedAnimation);

    rightPositionAnimation =
        Tween<double>(begin: 170, end: 20).animate(curvedAnimation);

    specialBottomPositionAnimation =
        Tween<double>(begin: -50, end: 400).animate(curvedAnimation);

    specialLeftPositionAnimation =
        Tween<double>(begin: -10, end: 200).animate(curvedAnimation);

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //BODY::
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              //Image
              // Positioned(
              //   top: 0,
              //   left: 0,
              //   bottom: 0,
              //   right: 0,
              //   child: Image.asset(
              //     Assets.imagesBackground,
              //     filterQuality: FilterQuality.high,
              //     fit: BoxFit.cover,
              //   ),
              // ),

              Positioned(
                top: topPositionAnimation.value,
                left: leftPositionAnimation.value,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Color(0xFF00BAD5),
                      blurRadius: 150,
                      spreadRadius: 90,
                    )
                  ]),
                ),
              ),

              Positioned(
                bottom: bottomPositionAnimation.value,
                right: rightPositionAnimation.value,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFF00D7AF),
                        blurRadius: 150,
                        spreadRadius: 90,
                      )
                    ],
                  ),
                ),
              ),

              //Special
              Positioned(
                bottom: specialBottomPositionAnimation.value,
                left: specialLeftPositionAnimation.value,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFF006FCD),
                        blurRadius: 150,
                        spreadRadius: 80,
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
