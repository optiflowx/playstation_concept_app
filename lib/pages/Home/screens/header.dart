import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../generated/assets.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({
    Key? key,
    required this.img,
    required this.color,
    required this.title,
    required this.isPs4,
    required this.isPs5,
    required this.banners,
  }) : super(key: key);

  final String img;
  final Color color;
  final String title;
  final bool isPs4;
  final bool isPs5;
  final List<BannerModel> banners;

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(15);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        AspectRatio(
          aspectRatio: 5 / 7,
          child: Hero(
            tag: img,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.only(topLeft: radius, topRight: radius),
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        //Back Button
        Positioned(
          left: 25,
          top: 70,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: deepBlue,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  spreadRadius: 6,
                  color: color,
                )
              ],
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Back',
                style: TextStyle(color: white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),

        //TextViews
        Positioned(
          bottom: 150,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Hero(
                        tag: 'Header-$title',
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 20,
                            color: white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Hero(
                        tag: '$title-Logo',
                        child: Row(
                          children: [
                            if (isPs4 == true)
                              Image.asset(Assets.otherPs4Logo,
                                  height: 14, color: white),
                            const SizedBox(width: 10),
                            if (isPs5 == true)
                              Image.asset(Assets.otherPs5Logo,
                                  height: 14, color: white),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        //Carousel
        Positioned(
          bottom: -50,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(blurRadius: 30, spreadRadius: 5, color: color)
              ],
            ),
            child: BannerCarousel(
              banners: banners,
              customizedIndicators: const IndicatorModel.animation(
                  width: 20, height: 5, spaceBetween: 2, widthAnimation: 50),
              activeColor: color,
              disableColor: Colors.white,
              animation: true,
              borderRadius: 10,
              margin: const EdgeInsets.all(20),
              viewportFraction: 0.75,
              indicatorBottom: false,
              spaceBetween: 10,
            ),
          ),
        ),
      ],
    );
  }
}
