import 'package:flutter/material.dart';

import '../../../data/friends.dart';
import 'friends_card_view.dart';

class ProfileFriendsView extends StatelessWidget {
  const ProfileFriendsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          friends.length,
          (index) {
            final Color statusColor =
                friends[index]['isOnline'] == true ? Colors.green : Colors.red;

            final double padding =
                friends[index]['userName'] == 'Mitchy911' ? 20 : 0;

            final bool request = friends[index]['relationship'] == 'request';
            final bool friend = friends[index]['relationship'] == 'friend';

            return FriendsCardView(
              userName: friends[index]['userName'],
              game: friends[index]['currentlyPlaying'],
              rightPadding: padding,
              color: friends[index]['color'],
              request: request,
              friend: friend,
              statusColor: statusColor,
            );
          },
        ),
      ),
    );
  }
}
