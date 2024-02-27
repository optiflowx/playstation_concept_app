import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class ButtonsView extends StatelessWidget {
  const ButtonsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget myButton(VoidCallback onPressed, String text) => Expanded(
          child: MaterialButton(
            onPressed: onPressed,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: deepBlueShaded,
            child: Text(text, style: const TextStyle(color: white)),
          ),
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        myButton(() {}, 'Messages'),
        const SizedBox(width: 20),
        myButton(() {}, 'Downloads'),
        const SizedBox(width: 10),
      ],
    );
  }
}
