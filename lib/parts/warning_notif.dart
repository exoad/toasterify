import 'package:flutter/material.dart';
import 'package:toasterify/parts/block.dart';

class WarningNotification extends StatefulWidget {
  const WarningNotification({Key? key}) : super(key: key);

  @override
  State<WarningNotification> createState() => _WarningNotificationState();
}

class _WarningNotificationState extends State<WarningNotification> {
  @override
  Widget build(BuildContext context) {
    return Block(
        backgroundColor: const Color.fromARGB(255, 240, 164, 51),
        child: Row(
          children: <Widget>[
            const Icon(Icons.warning_amber_rounded, size: 26),
            const SizedBox(width: 18),
            Expanded(
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: const <TextSpan>[
                    TextSpan(
                      text: "Caution: Use at your own risk. ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextSpan(
                      text:
                          "Extended usage may result in faster battery consumption or even hardware damages!",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
