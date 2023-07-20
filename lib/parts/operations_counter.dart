// Software created by Jack Meng (AKA exoad). Licensed by the included "LICENSE" file. If this file is not found, the project is fully copyrighted.

import 'package:flutter/material.dart';
import 'package:toasterify/parts/block.dart';

import "../service.dart" as op;

class OperationsCounterBlock extends StatefulWidget {
  const OperationsCounterBlock({super.key});

  @override
  State<OperationsCounterBlock> createState() => _OperationsCounterBlockState();
}

class _OperationsCounterBlockState extends State<OperationsCounterBlock> {
  String _fibonacciOps = "0";

  @override
  void initState() {
    super.initState();
    op.toasterifyController.addListener(() => setState(() {}));
    op.toasterifyController.listenForOps().listen(
        (BigInt data) => setState(() => _fibonacciOps = data.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Block(
        backgroundColor: op.toasterifyController.accent(),
        child: Column(children: <Widget>[
          const Text("Operations",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32)),
          Row(children: <Widget>[
            const Expanded(
                child: Text("Recursive Fibonacci",
                    style:  TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700))),
            Text(_fibonacciOps)
          ])
        ]));
  }
}
