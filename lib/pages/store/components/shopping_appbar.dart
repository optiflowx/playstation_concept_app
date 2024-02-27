import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playstation_concept_app/providers/drawer_providers.dart';
import 'package:playstation_concept_app/providers/store_providers.dart';

import '../../../constants/colors.dart';
import '../../../core/globals.dart';
import '../../../generated/assets.dart';

class StoreAppBar extends ConsumerWidget {
  final Animation<Color?> backgroundColorAnimation;
  const StoreAppBar(this.backgroundColorAnimation, {super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    //PROPERTIES::
    final isSheetOpen = ref.watch(isSheetOpenProvider);
    final isDrawerOpen = ref.watch(isDrawerOpenProvider);

    //BODY::
    return AnimatedBuilder(
      animation: appBarBackgroundAnimationController,
      builder: (context, child) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: AppBar(
              backgroundColor: backgroundColorAnimation.value!.withAlpha(150),
              centerTitle: isDrawerOpen ? false : true,
              elevation: 25,
              title: title(isSheetOpen),
              leading: isDrawerOpen ? null : leadingIcon(ref, isSheetOpen),
              actions: [trailingIcon(isSheetOpen, ref)],
              flexibleSpace: flexibleSpace(context, isSheetOpen),
            ),
          ),
        );
      },
    );
  }

  Widget leadingIcon(WidgetRef ref, bool isSheetOpen) {
    return GestureDetector(
      onTap: () async {
        ref.read(itemAnimationValueProvider.state).state = 1;
        await Future.delayed(const Duration(milliseconds: 500), () {
          ref.read(isDrawerOpenProvider.state).state = true;
        });
        navBarAnimationController.reverse();
      },
      child: Padding(
        padding:
            const EdgeInsets.only(top: 15, left: 20, bottom: 15, right: 15),
        child: ImageIcon(const AssetImage(Assets.navigationBurger),
            color: isSheetOpen ? white : black),
      ),
    );
  }

  Widget title(bool isSheetOpen) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isSheetOpen == false)
          ImageIcon(const AssetImage(Assets.navigationLogo),
              color: isSheetOpen ? white : black, size: 30),
        const SizedBox(width: 10),
        ImageIcon(const AssetImage(Assets.otherPs5Logo),
            color: isSheetOpen ? white : black, size: 70),
      ],
    );
  }

  Widget trailingIcon(bool isSheetOpen, WidgetRef ref) {
    final crossAxisCount = ref.watch(gridChildCountProvider);

    return IconButton(
      onPressed: () {
        if (crossAxisCount == 2) {
          ref.read(gridChildCountProvider.notifier).state = 1;
          ref.read(gridChildAspectProvider.notifier).state = 4 / 2;
        } else {
          ref.read(gridChildCountProvider.notifier).state = 2;
          ref.read(gridChildAspectProvider.notifier).state = 4 / 6;
        }
      },
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        child: Icon(
          crossAxisCount == 2
              ? CupertinoIcons.rectangle_grid_1x2_fill
              : CupertinoIcons.rectangle_grid_2x2_fill,
          color: isSheetOpen ? white : black,
        ),
      ),
    );
  }

  Widget flexibleSpace(BuildContext context, bool isSheetOpen) {
    final double topPadding = MediaQuery.of(context).padding.top + 50;

    return AnimatedContainer(
      height: isSheetOpen ? 0 : 50,
      duration: const Duration(milliseconds: 700),
      margin: EdgeInsets.only(top: topPadding),
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
      child: CupertinoSearchTextField(
        itemColor: grey.withAlpha(90),
        itemSize: isSheetOpen ? 0 : 22,
        borderRadius: BorderRadius.circular(30),
        backgroundColor: grey.withAlpha(35),
        placeholderStyle: TextStyle(color: grey.withAlpha(90), fontSize: 18.5),
      ),
    );
  }
}
