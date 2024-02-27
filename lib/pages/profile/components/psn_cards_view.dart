import 'package:flutter/material.dart';

import '../../../data/cards.dart';
import 'playstation_card.dart';

class PSNCardsView extends StatefulWidget {
  const PSNCardsView({Key? key}) : super(key: key);

  @override
  State<PSNCardsView> createState() => _PSNCardsViewState();
}

class _PSNCardsViewState extends State<PSNCardsView> {
  final PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.9);

  var currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: PageView.builder(
        controller: pageController,
        itemCount: cards.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final double scale = currentIndex == index ? 1 : 0.85;
          return AnimatedScale(
            scale: scale,
            curve: Curves.easeOutBack,
            duration: const Duration(milliseconds: 500),
            child: PlayStationCard(
              chip: cards[index]['chip'],
              date: cards[index]['eDate'],
              img: cards[index]['img'],
            ),
          );
        },
      ),
    );
  }
}
