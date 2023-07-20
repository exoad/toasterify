import 'package:flutter/material.dart';
import 'package:toasterify/parts/block.dart';

class SecondWarningBlock extends StatelessWidget {
  const SecondWarningBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Block(
      backgroundColor: const Color.fromARGB(255, 240, 51, 51),
      child: Row(
        children: <Widget>[
          const Icon(Icons.info_outline_rounded, size: 26),
          const SizedBox(width: 18),
          Expanded(
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(
                    text: "Attention: Application may become sluggish ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(
                    text:
                        "The app utilizes all of your CPU and GPU which can cause certain functionalities to become slow.",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
