import 'package:flutter/material.dart';
import 'package:playstation_concept_app/constants/colors.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet(
      {super.key,
      required this.img,
      required this.title,
      required this.subtitle,
      required this.description,
      required this.price,
      required this.features});

  final String img, title, subtitle, description;
  final double price;
  final List<String> features;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          border: Border.all(color: deepBlue, width: 4)),
      child: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            children: [
              Image.asset(
                img,
                height: 250,
                width: 150,
              ),

              //Title and Price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'EmotionEngine',
                      color: deepBlue,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Price:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: deepBlue,
                        ),
                      ),
                      Text(
                        '\$$price',
                        style: const TextStyle(
                          fontSize: 23,
                          fontFamily: 'EmotionEngine',
                          fontWeight: FontWeight.bold,
                          color: lBlue2,
                        ),
                      )
                    ],
                  )
                ],
              ),

              //Description
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Description',
                      style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description,
                      textAlign: TextAlign.start,
                      style: const TextStyle(color: grey),
                    ),
                  ],
                ),
              ),

              //Features
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Features',
                    style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      features.length,
                      (index) => Text(
                        '• ${features[index]}',
                        textAlign: TextAlign.start,
                        style: const TextStyle(color: grey),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: deepBlue, borderRadius: BorderRadius.circular(10)),
              child: const Text('Add to cart',
                  style: TextStyle(color: white, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
