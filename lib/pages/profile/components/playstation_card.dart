import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../generated/assets.dart';

class PlayStationCard extends StatelessWidget {
  const PlayStationCard({
    Key? key,
    required this.date,
    required this.img,
    required this.chip,
  }) : super(key: key);

  final String date, img, chip;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 15,
        shadowColor: lBlue,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            //Background Image
            Positioned.fill(
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              ),
            ),

            //Chip
            Positioned(
              top: 0,
              bottom: 0,
              left: 35,
              width: 50,
              child: Image.asset(
                chip,
                // color: white,
              ),
            ),

            //Expiry Date
            Positioned(
              bottom: 20,
              left: 25,
              child: Text(
                date,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //PS Logo
            Positioned(
              top: 15,
              right: 20,
              height: 30,
              width: 32,
              child: Image.asset(
                Assets.navigationLogo,
                color: white,
              ),
            ),

            //Visa and MasterCard
            Positioned(
              bottom: 10,
              right: 15,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    Assets.otherMastercard,
                    color: white,
                    width: 40,
                  ),
                  const SizedBox(height: 6),
                  Image.asset(
                    Assets.otherVisa,
                    color: white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
