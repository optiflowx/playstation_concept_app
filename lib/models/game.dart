import 'dart:ui';

class Game {
  final String img,title;
  final Map<String, dynamic> details;
  final Color color;
  final bool isPs4, isPs5;

  const Game({
    required this.title,
    required this.img,
    required this.details,
    required this.isPs4,
    required this.isPs5,
    required this.color,
  });
}