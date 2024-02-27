import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:playstation_concept_app/data/games_data.dart';
import 'components/appbar.dart';
import 'components/game_card.dart';
import 'components/game_card_wrapper.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final scrollDirectionNotifier =
      ValueNotifier<ScrollDirection>(ScrollDirection.forward);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: HomeAppBar(),
      ),
      extendBodyBehindAppBar: true,
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.forward ||
              notification.direction == ScrollDirection.reverse ||
              notification.direction == ScrollDirection.idle) {
            scrollDirectionNotifier.value = notification.direction;
          }
          return true;
        },
        child: ListView.builder(
          cacheExtent: 0,
          addAutomaticKeepAlives: false,
          itemCount: Games.data.length, // games.length,
          itemBuilder: (context, index) {
            return ValueListenableBuilder(
              valueListenable: scrollDirectionNotifier,
              child: GameCard(
                img: Games.data[index].img,
                details: Games.data[index].details,
                title: Games.data[index].title,
                isPs4: Games.data[index].isPs4,
                isPs5: Games.data[index].isPs5,
                color: Games.data[index].color,
              ),
              builder: (context, ScrollDirection scrollDirection, child) {
                return GameCardWrapper(
                  scrollDirection: scrollDirection,
                  child: child!,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
