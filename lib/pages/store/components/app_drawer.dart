import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/colors.dart';
import '../../../core/globals.dart';
import '../../../generated/assets.dart';
import '../../../providers/drawer_providers.dart';
import 'app_drawer_item.dart';

class StoreDrawer extends ConsumerWidget {
  StoreDrawer({super.key});

  final List drawerItems = [
    {'icon': Icons.videogame_asset, 'text': 'PS5'},
    {'icon': Icons.gamepad_outlined, 'text': 'PS4'},
    {'icon': Icons.gamepad, 'text': 'PS Plus'},
    {'icon': Icons.games_sharp, 'text': 'Free To Play'}
  ];

  @override
  Widget build(context, ref) {

    final isDrawerOpen = ref.watch(isDrawerOpenProvider);
    final itemAnimationValue = ref.watch(itemAnimationValueProvider);

    return Stack(
        alignment: Alignment.center,
        children: [
          ///[PlayStation Logo]
          Positioned(
            top: MediaQuery.of(context).size.height * 0.10,
            left: 20,
            child: Image.asset(
              Assets.navigationLogo,
              color: white,
              height: 60,
              fit: BoxFit.fitHeight,
            ),
          ),

          ///[Restore View Button]
          Positioned(
            top: MediaQuery.of(context).size.height * 0.075,
            right: MediaQuery.of(context).size.width * 0.365,
            child: IconButton(
              onPressed: () async {
                ref.read(itemAnimationValueProvider.notifier).state = 0;
                await Future.delayed(const Duration(milliseconds: 400), () {
                  ref.read(isDrawerOpenProvider.notifier).state = false;
                });
                navBarAnimationController.forward();
              },
              icon: const Icon(
                Icons.cancel,
                size: 30,
                color: white,
              ),
            ),
          ),


          ///[Items View(Centered)]
          Positioned(
            left: 20,
            child: TweenAnimationBuilder(
              tween: Tween<double>(
                  begin: 0, end: itemAnimationValue * 0.5),
              duration: const Duration(milliseconds: 650),
              builder: (context, double val, child) {
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001 * val)
                    ..setEntry(
                        0, 3, (MediaQuery.of(context).size.width * 0.3) * val)
                    ..rotateY((pi / 5) * val),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      drawerItems.length,
                      (index) => StoreDrawerItem(
                        // controller: controller,
                        drawerItems: drawerItems,
                        val: val,
                        index: index,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          ///[User Name and Image]
          if (isDrawerOpen)
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.10,
              left: 20,
              child: FadeInRight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      Assets.otherAvatar,
                      height: 40,
                      fit: BoxFit.fitHeight,
                    ),
                    const Text(
                      '    Prince\n     OptiFlowX',
                      style: TextStyle(
                        fontFamily: 'Webslinger',
                        fontSize: 10,
                        height: 1.5,
                        fontWeight: FontWeight.w700,
                        color: lBlue2,
                      ),
                    )
                  ],
                ),
              ),
            ),
        ],
      );
  }
}
