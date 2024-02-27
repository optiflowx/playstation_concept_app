import 'package:flutter/material.dart';

class ProfileViewHeader extends StatelessWidget {
  const ProfileViewHeader({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'EmotionEngine',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
