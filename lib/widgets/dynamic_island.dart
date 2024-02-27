
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../generated/assets.dart';
import '../providers/store_providers.dart';

class DynamicIsland extends ConsumerStatefulWidget {
  const DynamicIsland({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _DynamicIslandState();
}

class _DynamicIslandState extends ConsumerState<DynamicIsland> {
  @override
  Widget build(BuildContext context) {
    //PROPERTIES::
    final isExpanded = ref.watch(isIslandExpandedProvider);
    final isExpandedDelayed = ref.watch(isIslandExpandedDelayedProvider);
    final device = MediaQuery.of(context);
    final double width = device.size.width - 80;
    final double height = isExpanded ? 250 : 40;
    final double hPadding = isExpanded ? 22 : 120;
    final double padding = isExpandedDelayed ? 0 : 25;
    final double bRadius = isExpanded ? 50 : 24;
    final Curve curve = isExpanded ? Curves.easeOutBack : Curves.easeInBack;

    //BODY::
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          GestureDetector(
            onTap: () async {
              ref.read(isIslandExpandedProvider.state).state =
              !ref.read(isIslandExpandedProvider.state).state;

              //Delay the padding of the pill.
              await Future.delayed(const Duration(milliseconds: 1200), () {
                ref.read(isIslandExpandedDelayedProvider.state).state =
                !ref.read(isIslandExpandedDelayedProvider.state).state;
              });
            },
            child: AnimatedPadding(
              duration: const Duration(milliseconds: 1000),
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: AnimatedContainer(
                height: height,
                width: width,
                curve: curve,
                duration: const Duration(milliseconds: 800),
                margin:
                EdgeInsets.only(top: 37, left: hPadding, right: hPadding),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(bRadius),
                  color: Colors.black,
                ),
                child: Row(),
              ),
            ),
          ),
          IgnorePointer(
            child: Image.asset(Assets.imagesIphone14, fit: BoxFit.fitWidth),
          ),
        ],
      ),
    );
  }
}
