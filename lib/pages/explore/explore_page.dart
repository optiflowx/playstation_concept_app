import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playstation_concept_app/pages/profile/components/profile_appbar.dart';

import 'animated_background.dart';

class ExplorePage extends ConsumerStatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _ExplorePageState();
}

class _ExplorePageState extends ConsumerState {

  @override
  Widget build(BuildContext context) {
    //BODY::
    return Scaffold(
      appBar: const PreferredSize(preferredSize: Size.fromHeight(120),
        child: ProfileAppbar(),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.center,
        children: const [
          AnimatedBackground(),
        ],
      ),
    );
  }
}
