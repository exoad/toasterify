// Software created by Jack Meng (AKA exoad). Licensed by the included "LICENSE" file. If this file is not found, the project is fully copyrighted.
import 'package:flutter/material.dart';
import '../service.dart' as op;

class Logo extends StatefulWidget {
  const Logo({
    super.key,
  });

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  void initState() {
    super.initState();
    op.toasterifyController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "Toasterify",
      style: TextStyle(
          color: op.toasterifyController.accent(),
          shadows: const <Shadow>[
            Shadow(color: Color.fromARGB(255, 22, 22, 22), offset: Offset(0, 5))
          ],
          fontWeight: FontWeight.w800,
          fontSize: 26),
    );
  }
}
