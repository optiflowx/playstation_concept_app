import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playstation_concept_app/providers/store_providers.dart';

import '../constants/colors.dart';
import '../core/globals.dart';
import '../generated/assets.dart';
import '../widgets/animated_padding.dart';

class CustomFloatingButton extends ConsumerWidget {
  const CustomFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    //PROPERTIES::
    final isSheetOpen = ref.watch(isSheetOpenProvider);

    //BODY::
    return AnimatedPaddingWidget(
      onTap: () {
        if (isSheetOpen) {
          Navigator.pop(context);
          ref.watch(isSheetOpenProvider.notifier).state = false;
          appBarBackgroundAnimationController.forward();
        }
      },
      padding: 25,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: Container(
          height: 65,
          width: 65,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: lBlue2,
          ),
          child: const ImageIcon(
            AssetImage(Assets.navigationLogo),
            size: 35,
            color: white,
          ),
        ),
      ),
    );
  }
}
