// Software created by Jack Meng (AKA exoad). Licensed by the included "LICENSE" file. If this file is not found, the project is fully copyrighted.

import 'dart:io';

import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:battery_info/model/iso_battery_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toasterify/parts/block.dart';

import '../service.dart' as op;

class SysInfoBlock extends StatefulWidget {
  const SysInfoBlock({
    super.key,
  });

  @override
  State<SysInfoBlock> createState() => _SysInfoBlockState();
}

class _SysInfoBlockState extends State<SysInfoBlock> {
  String batteryLevel = "Undef[0x0]";
  String batteryTemperature = "Undef[0x0]";

  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) {
      BatteryInfoPlugin()
          .androidBatteryInfoStream
          .listen((AndroidBatteryInfo? info) => setState(() {
                batteryLevel = info!.batteryLevel.toString();
                batteryTemperature = info.temperature.toString();
              }));
    } else if (Platform.isIOS) {
      BatteryInfoPlugin().iosBatteryInfoStream.listen((IosBatteryInfo? info) =>
          setState(() => batteryLevel = info!.batteryLevel.toString()));
    }
    op.toasterifyController.addListener(() => setState(() {}));
  }

  static Widget _makeListItem(
          Widget icon, String titleLabel, String resultantValue) =>
      resultantValue != "Undef[0x0]"
          ? Row(children: <Widget>[
              icon,
              const SizedBox(width: 8),
              Expanded(
                  child: Text(titleLabel,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                      ))),
              Text(resultantValue,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.normal))
            ])
          : const SizedBox(width: 0, height: 0);

  @override
  Widget build(BuildContext context) {
    return Block(
      backgroundColor: op.toasterifyController.accent(),
      child: Column(children: <Widget>[
        _makeListItem(
            const Icon(Icons.battery_std_rounded), "Battery %", batteryLevel),
        const SizedBox(height: 8),
        _makeListItem(const Icon(Icons.thermostat_rounded),
            "Battery Temperature", batteryTemperature),
        const SizedBox(height: 8),
        _makeListItem(SvgPicture.asset("assets/processor.svg"),
            "Processors Count", Platform.numberOfProcessors.toString())
      ]),
    );
  }
}
