
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../generated/assets.dart';

class TopView extends StatelessWidget {
  const TopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          Assets.otherAvatar,
          height: 45,
          width: 45,
          fit: BoxFit.fitHeight,
        ),
        const SizedBox(width: 10),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Welcome back,',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            Text(
              'Prince',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            )
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          color: Colors.black,
          icon: const Icon(CupertinoIcons.rectangle_grid_2x2_fill),
        )
      ],
    );
  }
}
