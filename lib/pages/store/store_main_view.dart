import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/colors.dart';
import '../../providers/drawer_providers.dart';
import 'components/app_drawer.dart';
import 'store_page.dart';

class StoreMainView extends ConsumerWidget {
  const StoreMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //PROPERTIES::
    final itemAnimationValue = ref.watch(itemAnimationValueProvider);
    final isDrawerOpen = ref.watch(isDrawerOpenProvider);
    final width = MediaQuery.of(context).size.width;

    //BODY::
    return Drawer(
      backgroundColor: Colors.black,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          StoreDrawer(),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: itemAnimationValue),
            duration: const Duration(milliseconds: 650),
            child: AnimatedPadding(
              duration: const Duration(milliseconds: 700),
              padding: EdgeInsets.symmetric(vertical: isDrawerOpen ? 25 : 0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: isDrawerOpen ? 25 : 0,
                      color: lBlue2,
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(isDrawerOpen ? 35 : 0),
                  child: const ShoppingPage(),
                ),
              ),
            ),
            builder: (context, double val, child) {
              return Transform(
                alignment: AlignmentDirectional.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, (width * 0.6) * val)
                  ..rotateY((pi / 6) * val),
                child: child,
              );
            },
          ),
        ],
      ),
    );
  }
}
