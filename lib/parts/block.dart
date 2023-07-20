// Software created by Jack Meng (AKA exoad). Licensed by the included "LICENSE" file. If this file is not found, the project is fully copyrighted.

import 'package:flutter/material.dart';

class Block extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;
  const Block({super.key, required this.backgroundColor, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Container(
              decoration: ShapeDecoration(
                color: backgroundColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(child: child))))
    ]);
  }
}
