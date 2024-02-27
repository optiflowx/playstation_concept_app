import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class DownloadProgressView extends StatefulWidget {
  const DownloadProgressView({Key? key}) : super(key: key);

  @override
  State<DownloadProgressView> createState() => _DownloadProgressViewState();
}

class _DownloadProgressViewState extends State<DownloadProgressView>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {

  late final AnimationController animationController;
  late final Animation<double> downloadAnimation;
  late final Animation<double> textProgressAnimation;

  double width(BuildContext context) {
    return MediaQuery.of(context).size.width - (20 * 2);
  }

  @override
  bool get wantKeepAlive => false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..forward();

    ///The [End] value of [250] will be limited to the max constraints.
    downloadAnimation = Tween<double>(begin: 0, end: 250).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    textProgressAnimation = Tween<double>(begin: 0, end: 64.65).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.linear,
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
      builder: (context, child) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 60,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    const Text(
                      'PES 2023 MUN Edition',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${textProgressAnimation.value.toStringAsPrecision(4)}%',
                      style: const TextStyle(
                        color: lBlue2,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: downloadAnimation.value,
                        constraints: BoxConstraints(
                          //We are limiting the animation value to 65% of the download view
                          maxWidth: width(context) * 0.65,
                        ),
                        decoration: BoxDecoration(
                          color: lBlue2,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
