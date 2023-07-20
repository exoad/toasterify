import 'package:flutter/material.dart';
import 'package:toasterify/parts/logo.dart';
import 'package:toasterify/parts/madeby_exoad_span.dart';
import 'package:toasterify/parts/operations_counter.dart';
import 'package:toasterify/parts/second_warning_block.dart';
import 'package:toasterify/parts/status_block.dart';
import 'package:toasterify/parts/sys_info.dart';
import 'package:toasterify/parts/warning_notif.dart';
import './service.dart' as op;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  void switchState() {
    setState(op.toasterifyController.flip);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Toasterify",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: op.backgroundColor(),
          appBar: AppBar(
              backgroundColor: op.backgroundColor(),
              title: const Row(children: <Widget>[
                Expanded(
                  child: Logo(),
                ),
                MadeByExoad()
              ])),
          floatingActionButton: FloatingActionButton(
            onPressed: switchState,
            backgroundColor: op.toasterifyController.accent(),
            shape: const CircleBorder(),
            child: const Icon(Icons.power_settings_new_rounded,
                color: Colors.black, size: 32),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: const SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 13),
                WarningNotification(),
                SizedBox(height: 18),
                SecondWarningBlock(),
                SizedBox(height: 18),
                StatusBlock(),
                SizedBox(height: 18),
                SysInfoBlock(),
                SizedBox(height: 18),
                OperationsCounterBlock()
              ],
            ),
          )),
    );
  }
}
