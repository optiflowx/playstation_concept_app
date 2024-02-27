import 'package:flutter/material.dart';
import 'components/download_progress_view.dart';
import 'components/profile_appbar.dart';
import 'components/profile_friends_view.dart';
import 'components/profile_view_header.dart';
import 'components/psn_cards_view.dart';
import 'components/purchased_games_view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  final List<Widget> children = const [
    ProfileViewHeader(text: 'Downloading...'),
    DownloadProgressView(),
    ProfileViewHeader(text: 'Friends'),
    ProfileFriendsView(),
    ProfileViewHeader(text: 'PSN Cards'),
    PSNCardsView(),
    ProfileViewHeader(text: 'Purchased Games'),
    PurchasedGamesView(),
    SizedBox(height: 40),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: ProfileAppbar(),
      ),
      body: ListView.builder(
        itemCount: children.length,
        itemBuilder: (context, index) => children[index]
      ),
    );
  }
}
