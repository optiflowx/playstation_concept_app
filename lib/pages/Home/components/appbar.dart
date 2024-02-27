import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/colors.dart';
import '../../../generated/assets.dart';

class HomeAppBar extends ConsumerWidget {
  HomeAppBar({super.key});

  @override
  Widget build(context, ref) {
    //PROPERTIES::
    const radius = Radius.circular(30);

    //BODY::
    return ClipRRect(
      borderRadius:
          const BorderRadius.only(bottomLeft: radius, bottomRight: radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: AppBar(
          backgroundColor: Colors.white12.withAlpha(150),
          centerTitle: true,
          elevation: 25,
          title: title,
          leading: leading,
          actions: [trailing],
          flexibleSpace: flexibleSpace(context),
        ),
      ),
    );
  }

  final Widget leading = IconButton(
    onPressed: () {},
    icon: ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image.asset(Assets.otherAvatar, fit: BoxFit.fitWidth, width: 30),
    ),
  );

  final Widget title = const ImageIcon(AssetImage(Assets.navigationLogo),
      color: black, size: 50);

  final Widget trailing = IconButton(
    onPressed: () {},
    icon:
        const Icon(CupertinoIcons.arrow_up_circle_fill, color: black, size: 30),
  );

  Widget flexibleSpace(BuildContext context) {
    final marginTop = MediaQuery.of(context).padding.top;
    final margin = (marginTop + 50);

    return AnimatedContainer(
      height: 55,
      duration: const Duration(milliseconds: 700),
      margin: EdgeInsets.only(top: margin),
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            'Coming Soon',
            style: TextStyle(
              color: lBlue2,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          Text(
            'Pre-Order',
            style: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
