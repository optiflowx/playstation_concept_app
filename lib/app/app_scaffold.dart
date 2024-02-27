import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playstation_concept_app/core/globals.dart';
import 'package:playstation_concept_app/pages/Home/home_page.dart';
import 'package:playstation_concept_app/pages/explore/explore_page.dart';
import 'package:playstation_concept_app/pages/profile/profile_page.dart';
import 'package:playstation_concept_app/pages/store/store_main_view.dart';
import 'package:playstation_concept_app/widgets/bottom_nav_bar.dart';

import '../providers/drawer_providers.dart';
import 'custom_floating_button.dart';
import 'navigation_bar_wrapper.dart';

class AppScaffold extends ConsumerStatefulWidget {
  const AppScaffold({super.key});

  @override
  ConsumerState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends ConsumerState<AppScaffold> with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  final pages = [
    HomePage(),
    const ExplorePage(),
    const StoreMainView(),
    const ProfilePage()
  ];

  @override
  void initState() {

    ///Why here? [It has to initialized once since it is global but is only used in store]
    appBarBackgroundAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
      reverseDuration: const Duration(milliseconds: 2000),
    )..forward();
    super.initState();
  }

  @override
  void dispose() {
    appBarBackgroundAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    //BODY::
    return Scaffold(
      body: pages[currentIndex],
      extendBody: true,
      floatingActionButton: AnimatedScale(
        scale: ref.watch(itemAnimationValueProvider) == 0 ? 1 : 0,
        duration: const Duration(milliseconds: 1000),
        child: AnimatedOpacity(
          opacity: ref.watch(itemAnimationValueProvider) == 0 ? 1 : 0,
          duration: const Duration(milliseconds: 1000),
          child: const CustomFloatingButton(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavigationBarWrapper(
        child: PSBottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
