// Software created by Jack Meng (AKA exoad). Licensed by the included "LICENSE" file. If this file is not found, the project is fully copyrighted.

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../service.dart' as op;
import 'block.dart';

class StatusBlock extends StatefulWidget {
  const StatusBlock({
    super.key,
  });

  @override
  State<StatusBlock> createState() => _StatusBlockState();
}

class _StatusBlockState extends State<StatusBlock> {
  @override
  void initState() {
    super.initState();
    op.toasterifyController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Block(
        backgroundColor: op.toasterifyController.accent(),
        child: Column(children: <Widget>[
          op.toasterifyController.isHeating()
              ? const Icon(Icons.local_fire_department_rounded, size: 48)
              : SvgPicture.asset("assets/snowflake.svg", width: 48, height: 48),
          Text(op.toasterifyController.isHeating() ? "On" : "Off",
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black))
        ]));
  }
}
