// ignore_for_file: non_constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameContextView extends StatefulWidget {
  final Widget child;
  final String imgTag;
  final dynamic details;

  // final Function onPressed;

  const GameContextView({
    super.key,
    required this.details,
    required this.child,
    required this.imgTag,
    // required this.onPressed,
  });

  @override
  State<GameContextView> createState() => _GameContextViewState();
}

class _GameContextViewState extends State<GameContextView> {
  GlobalKey containerKey = GlobalKey();
  Offset childOffset = const Offset(0, 0);
  Size? childSize;

  getOffset() {
    RenderBox renderBox =
        containerKey.currentContext!.findRenderObject() as RenderBox;
    Size size = renderBox.size;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    setState(() {
      childOffset = Offset(offset.dx, offset.dy);
      childSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        key: containerKey,
        onTap: () {
          // widget.onPressed();
        },
        onLongPress: () async {
          await openMenu(context);
        },
        child: widget.child);
  }

  Future openMenu(BuildContext context) async {
    getOffset();
    await Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        fullscreenDialog: true,
        transitionDuration: const Duration(milliseconds: 700),
        reverseTransitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (context, animation, secondaryAnimation) {
          animation = Tween(begin: 0.0, end: 1.0).animate(animation);
          return FadeTransition(
            opacity: animation,
            child: FocusedMenuDetails(
              childOffset: childOffset,
              childSize: childSize,
              details: widget.details,
              imgTag: widget.imgTag,
              child: widget.child,
            ),
          );
        },
      ),
    );
  }
}

final tapProvider = StateProvider.autoDispose<bool>((ref) => false);

class FocusedMenuDetails extends ConsumerWidget {
  final Offset childOffset;
  final Size? childSize;
  final Widget child;
  final String imgTag;
  final dynamic details;

  const FocusedMenuDetails({
    super.key,
    required this.details,
    required this.child,
    required this.imgTag,
    required this.childOffset,
    required this.childSize,
  });

  @override
  Widget build(BuildContext context, ref) {
    final isTapped = ref.watch(tapProvider);

    return Scaffold(
      backgroundColor: Colors.black45.withAlpha(150),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: (Colors.black).withOpacity(0.7),
              ),
            ),
          ),
          Positioned(
            top: 75,
            left: 25,
            right: 25,
            child: GestureDetector(
              onTap: () {
                ref.read(tapProvider.state).state =
                    !ref.read(tapProvider.notifier).state;
              },
              child: Column(
                children: [
                  AnimatedText(isTapped),
                  if (isTapped) const SizedBox(height: 15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        AnimatedContainer(
                          height: isTapped ? ((childSize!.height) - 50) : 0,
                          width: childSize?.width,
                          duration: const Duration(milliseconds: 1000),
                          curve: isTapped ? Curves.easeOut : Curves.easeIn,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SingleChildScrollView(
                            child: Text(
                              '${details['description']}',
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          curve:
                              isTapped ? Curves.easeInBack : Curves.easeOutBack,
                          width: childSize?.width,
                          height: isTapped ? 0 : (childSize!.height) - 50,
                          child: child,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget AnimatedText(bool isTapped) {
    return AnimatedScale(
      scale: isTapped ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 800),
      child: AnimatedOpacity(
        opacity: isTapped ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 600),
        child: const SingleChildScrollView(
          child: Center(
            child: Text(
              'Quick Description',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w700,
                fontFamily: 'Webslinger',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
