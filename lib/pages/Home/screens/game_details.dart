import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:playstation_concept_app/constants/colors.dart';

import 'header.dart';

class GameDetailsScreen extends StatefulWidget {
  const GameDetailsScreen(
      {Key? key,
      required this.details,
      required this.img,
      required this.color,
      required this.title,
      required this.isPs4,
      required this.isPs5})
      : super(key: key);

  final Map<String, dynamic> details;
  final String img, title;
  final bool isPs4, isPs5;
  final Color color;

  @override
  State<GameDetailsScreen> createState() => _GameDetailsScreenState();
}

class _GameDetailsScreenState extends State<GameDetailsScreen> {
  final controller = ScrollController();
  double scrollOffset = 0;

  void onScrollListener() {
    scrollOffset = controller.offset;
    setState(() {});
  }

  @override
  void initState() {
    controller.addListener(onScrollListener);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(onScrollListener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final banners = [
      BannerModel(imagePath: widget.details['imgs'][0], id: '0'),
      BannerModel(imagePath: widget.details['imgs'][1], id: '1'),
      BannerModel(imagePath: widget.details['imgs'][2], id: '2'),
      BannerModel(imagePath: widget.details['imgs'][3], id: '3'),
      BannerModel(imagePath: widget.details['imgs'][4], id: '4'),
    ];

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: scrollOffset >= 200
          ? PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: FadeInDown(
                delay: const Duration(microseconds: 300),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: AppBar(
                      backgroundColor: deepBlue.withAlpha(180),
                      centerTitle: true,
                      title: Text(widget.title),
                    ),
                  ),
                ),
              ),
            )
          : null,
      body: ListView(
        padding: EdgeInsets.zero,
        controller: controller,
        children: [
          DetailsHeader(
            img: widget.img,
            color: widget.color,
            title: widget.title,
            isPs4: widget.isPs4,
            isPs5: widget.isPs5,
            banners: banners,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 85),
            child: Column(
              children: [
                const Text(
                  'Features',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, height: 2),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    widget.details['features'].length,
                    (index) {
                      final icon = widget.details['features'][index]['icon'];
                      final text = widget.details['features'][index]['text'];
                      return Container(
                        margin: const EdgeInsets.all(6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              icon,
                              height: 28,
                              width: 28,
                              color: black,
                            ),
                            Text(
                              '  $text',
                              maxLines: 2,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Text(
                  'Description',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, height: 2),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 15,
                  ),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 231, 231, 231),
                  ),
                  child: Text(widget.details['description']),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
