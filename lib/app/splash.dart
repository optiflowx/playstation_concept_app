import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:playstation_concept_app/constants/colors.dart';
import '../generated/assets.dart';
import 'app_scaffold.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;

  void animationListener() {
    setState(() {});
  }

  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1500),
        reverseDuration: const Duration(milliseconds: 500))
      ..addListener(animationListener)
      ..forward();

    Future.delayed(
      const Duration(milliseconds: 2500),
      () async {
        await Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const AppScaffold()));
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: deepBlue,
      body: Stack(alignment: Alignment.center, children: [
        Positioned(
          top: 0,
          bottom: MediaQuery.of(context).size.width / 1.5,
          child: AnimatedBuilder(
            animation: controller,
            child: Image.asset(
              Assets.navigationLogo,
              color: lBlue2.withOpacity(controller.value),
            ),
            builder: (context, child) => ScaleTransition(
              scale: controller,
              child: child,
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          child: Bounce(
            delay: const Duration(microseconds: 200),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'PlayStation',
                      style: TextStyle(
                        fontFamily: 'Webslinger',
                        fontSize: 20,
                        // fontWeight: FontWeight.w600,
                        color: lBlue2,
                      ),
                    ),
                    Text(
                      ' ®',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: lBlue2),
                    ),
                  ],
                ),
                const Text(
                  'Concept',
                  style: TextStyle(
                      fontFamily: 'Webslinger', fontSize: 15, color: lBlue2),
                ),
                const Text(
                  'OptiFlowX',
                  style: TextStyle(
                    fontFamily: 'EmotionEngine',
                    fontSize: 15,
                    height: 1.8,
                    color: white,
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
