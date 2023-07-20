// Software created by Jack Meng (AKA exoad). Licensed by the included "LICENSE" file. If this file is not found, the project is fully copyrighted.

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../service.dart' as op;

class MadeByExoad extends StatefulWidget {
  const MadeByExoad({super.key});

  @override
  State<MadeByExoad> createState() => _MadeByExoadState();
}

class _MadeByExoadState extends State<MadeByExoad> {
  @override
  void initState() {
    super.initState();
    op.toasterifyController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await launchUrl(Uri.parse("https://github.com/exoad")),
      child: Container(
          decoration: ShapeDecoration(
            color: op.toasterifyController.accent(),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(4),
            child: Text("by exoad",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12)),
          )),
    );
  }
}
