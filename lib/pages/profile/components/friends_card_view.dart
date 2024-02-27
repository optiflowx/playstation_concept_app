import 'package:flutter/material.dart';
import 'package:playstation_concept_app/constants/colors.dart';

class FriendsCardView extends StatelessWidget {
  final String userName, game;
  final double rightPadding;
  final Color color, statusColor;
  final bool request, friend;

  const FriendsCardView(
      {Key? key,
      required this.userName,
      required this.game,
      required this.rightPadding,
      required this.color,
      required this.request,
      required this.friend, required this.statusColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      constraints: const BoxConstraints(
        maxWidth: 170,
      ),
      margin: EdgeInsets.only(left: 20, right: rightPadding),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: deepBlue),
          borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Positioned(
            top: 8,
            left: 50,
            child: CircleAvatar(
              backgroundColor: statusColor,
              maxRadius: 4.0,
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 8,
            child: CircleAvatar(
              backgroundColor: color,
              maxRadius: 20,
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 62,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                if (request)
                  const Text(
                    'Request',
                    style: TextStyle(
                      color: lBlue2,
                      fontSize: 13,
                    ),
                  ),
                if (friend)
                  Text(
                    'Playing: $game',
                    style: const TextStyle(
                      color: lBlue2,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
