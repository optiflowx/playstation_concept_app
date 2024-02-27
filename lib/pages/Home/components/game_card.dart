import 'package:flutter/material.dart';

import '../../../widgets/animated_padding.dart';
import '../../../widgets/game_context_view.dart';
import '../screens/game_details.dart';
import 'game_card_details_view.dart';
import 'scrollable_widget.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    Key? key,
    required this.details,
    required this.img,
    required this.title,
    required this.isPs4,
    required this.isPs5,
    required this.color,
  }) : super(key: key);

  final dynamic details;
  final String img, title;
  final bool isPs4, isPs5;
  final Color color;

  void onTap(context, img, title, color, isPs4, isPs5, details) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 800),
        reverseTransitionDuration: const Duration(milliseconds: 1200),
        pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
          opacity: animation,
          child: GameDetailsScreen(
            img: img,
            color: color,
            isPs4: isPs4,
            isPs5: isPs5,
            title: title,
            details: details,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPaddingWidget(
      padding: 15,
      onTap: () => onTap(context, img, title, color, isPs4, isPs5, details),
      child: Card(
        elevation: 15,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.all(15),
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 9 / 11,
              child: ScrollableWidget(
                scrollable: Scrollable.of(context)!,
                child: GameContextView(
                  imgTag: img,
                  details: details,
                  child: Hero(
                    tag: img,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        img,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GameCardDetailsView(isPs4: isPs4, isPs5: isPs5, title: title),
          ],
        ),
      ),
    );
  }
}
