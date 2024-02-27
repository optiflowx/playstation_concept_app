import 'package:flutter/material.dart';
import '../../../data/games_data.dart';
import 'my_games_card.dart';
import 'purchased_game_card_wrapper.dart';


class PurchasedGamesView extends StatelessWidget {
  const PurchasedGamesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: Games.data.length,
        cacheExtent: 0,
        itemBuilder: (ctx, index) {
          return PurchasedGamesCardWrapper(
            child: PurchasedGamesCard(
              color: Games.data[index].color,
              img: Games.data[index].img,
            ),
          );
        },
      ),
    );
  }
}
