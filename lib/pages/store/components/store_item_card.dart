import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class StoreItemCard extends StatefulWidget {
  const StoreItemCard({
    Key? key,
    required this.img,
    required this.title,
    required this.subtitle,
    required this.price,
  }) : super(key: key);

  final String img, title, subtitle;
  final double price;

  @override
  State<StoreItemCard> createState() => _StoreItemCardState();
}

class _StoreItemCardState extends State<StoreItemCard>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
      reverseDuration: const Duration(milliseconds: 2500),
    )
      ..forward()
      ..repeat(reverse: true);

    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: deepBlue),
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, animationController.value, 1.0],
              colors: const [deepBlueShaded, lBlue2, white],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Positioned(
                  top: 0,
                  child: Image.asset(
                    widget.img,
                    height: 150,
                    width: 100,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '\$${widget.price}',
                      style: const TextStyle(
                        color: black,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style:
                            TextStyle(color: grey.withAlpha(150), fontSize: 11),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.subtitle,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
