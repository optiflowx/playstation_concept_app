import 'package:flutter/material.dart';

import '../constants/colors.dart';

class NavigationBarItem extends StatelessWidget {
  final bool isActive;
  final int index;
  final List children;
  final VoidCallback onTap;

  const NavigationBarItem({
    super.key,
    required this.isActive,
    required this.index,
    required this.children, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: deepBlueShaded,
                  boxShadow: const [BoxShadow(blurRadius: 5, color: lBlue)],
                  borderRadius: BorderRadius.circular(10)),
              child: ImageIcon(
                children[index],
                size: 20,
                color: isActive ? kPrimaryBlueColor : Colors.white,
              ),
            ),
          ],
        ),
      )
    );
  }
}
