import 'dart:ui';
import 'package:flutter/material.dart';
import 'appbar_top_view.dart';
import 'appbar_buttons_view.dart';

class ProfileAppbar extends StatelessWidget {
  const ProfileAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: AppBar(
          elevation: 25,
          backgroundColor: Colors.white12.withAlpha(150),
          flexibleSpace: Container(
            padding: EdgeInsets.only(
              left: 15,
              right: 5,
              top: MediaQuery.of(context).padding.top + 10,
            ),
            child: Column(
              children: const [TopView(), SizedBox(height: 5), ButtonsView()],
            ),
          ),
        ),
      ),
    );
  }
}
