import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playstation_concept_app/providers/drawer_providers.dart';

import '../../../constants/colors.dart';

class StoreDrawerItem extends ConsumerWidget {
  const StoreDrawerItem({
    Key? key,
    required this.drawerItems,
    required this.val,
    required this.index,
  }) : super(key: key);

  final List drawerItems;
  final double val;
  final int index;

  @override
  Widget build(context, ref) {
    //PROPERTIES::
    final currentItemIndex = ref.watch(currentItemIndexProvider);

    //BODY::
    return Transform.translate(
      offset: Offset(index * (val * 25), 0),
      child: GestureDetector(
        onTap: () {
          //OnTap We Set The A Global Value of Index To The Current Index
          ref.read(currentItemIndexProvider.notifier).state = index;
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            transform: Matrix4.identity()
              ..rotateY(currentItemIndex == index ? 32 : 0)
              ..scale(currentItemIndex == index ? (1.35) : 0.95),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  drawerItems[index]['icon'],
                  size: 25,
                  shadows: [
                    BoxShadow(
                        color: lBlue,
                        blurRadius: currentItemIndex == index ? 15 : 0)
                  ],
                  color: currentItemIndex == index ? lBlue : white,
                ),
                Text(
                  '  ${drawerItems[index]['text']}',
                  style: TextStyle(
                    color: currentItemIndex == index ? lBlue2 : white,
                    fontSize: 18,
                    fontFamily: 'EmotionEngine',
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
