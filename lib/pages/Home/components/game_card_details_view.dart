import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../generated/assets.dart';

class GameCardDetailsView extends StatelessWidget {
  final bool isPs4, isPs5;
  final String title;

  const GameCardDetailsView({
    super.key,
    required this.isPs4,
    required this.isPs5,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Hero(
                        tag: 'Header-$title',
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 20,
                            color: white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Hero(
                        tag: '$title-Logo',
                        child: Row(
                          children: [
                            if (isPs4 == true)
                              Image.asset(Assets.otherPs4Logo,
                                  height: 14, color: white),
                            if (isPs4 == true) const SizedBox(width: 10),
                            if (isPs5 == true)
                              Image.asset(Assets.otherPs5Logo,
                                  height: 14, color: white),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: deepBlue,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [BoxShadow(color: lBlue2, blurRadius: 10)],
                  ),
                  child: const Text(
                    'More',
                    style: TextStyle(
                      color: lBlue,
                      fontFamily: 'Webslinger',
                      fontSize: 8,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
