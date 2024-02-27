import 'package:flutter/material.dart';

class PurchasedGamesCard extends StatelessWidget {
  const PurchasedGamesCard({super.key, required this.color, required this.img});

  final Color color;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      constraints: const BoxConstraints(
        maxWidth: 150,
        maxHeight: 200,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: color),
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
