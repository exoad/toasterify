// Software created by Jack Meng (AKA exoad). Licensed by the included "LICENSE" file. If this file is not found, the project is fully copyrighted.

import 'dart:async';
import 'dart:isolate';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xrandom/xrandom.dart';

OperatorProvider toasterifyController = OperatorProvider();

enum HeatState {
  cold,
  warm;
}

class OperatorProvider extends ChangeNotifier {
  HeatState heatState = HeatState.cold;
  late DateTime startTime;
  List<Isolate> isolates = [];
  BigInt _totalOps1 = BigInt.zero;
  BigInt _totalOps2 = BigInt.zero;

  bool isHeating() => heatState != HeatState.cold;

  void flip() {
    if (heatState == HeatState.cold) {
      heatState = HeatState.warm;
      start();
    } else if (heatState == HeatState.warm) {
      heatState = HeatState.cold;
      stop();
    }
    notifyListeners();
  }

  Stream<BigInt> listenForOps() async* {
    yield BigInt.zero;
  }

  @pragma('vm:entry-point')
  static void stressFunction(ComputableModel model) {
    model.run();
  }

  void start() async {
    startTime = DateTime.now();

    for (int i = 0; i < 4; i++) {
      isolates.add(await Isolate.spawn((msg) {
        stressFunction(msg);
        _totalOps1 += BigInt.one;
      }, FibonacciComputeModel()));
    }
    for (int i = 0; i < 4; i++) {
      isolates.add(await Isolate.spawn((msg) {
        stressFunction(msg);
        _totalOps2 += BigInt.one;
      }, SortComputeModel()));
    }
  }

  void stop() {
    compute((message) {
      for (final isolate in message) {
        isolate.kill(priority: Isolate.immediate);
      }
      message.clear();
    }, isolates);
  }

  DateTime get timeOfStart => startTime;

  Color accent() => heatState == HeatState.cold
      ? mildColor()
      : DateTime.now().difference(startTime).inMinutes > 8
          ? hotColor()
          : warmColor();
}

abstract class ComputableModel {
  void run();
}

class FibonacciComputeModel extends ComputableModel {
  @override
  void run() => _fibonacci(Xoshiro256pp().nextInt(999));

  int _fibonacci(int n) {
    if (n <= 0) return 0;
    if (n == 1) return 1;
    return _fibonacci(n - 1) + _fibonacci(n - 2);
  }
}

class SortComputeModel extends ComputableModel {
  @override
  void run() {
    generateRandomList(-double.maxFinite, double.maxFinite,
            Xoshiro256pp().nextInt(9999) + 1)
        .sort();
  }

  List<double> generateRandomList(
      double minValue, double maxValue, int length) {
    List<double> randomList = [];
    final random = Random();

    for (int i = 0; i < length; i++) {
      double randomDouble =
          random.nextDouble() * (maxValue - minValue) + minValue;
      randomList.add(randomDouble);
    }

    return randomList;
  }
}

Color backgroundColor() => const Color.fromARGB(255, 0, 0, 0);

Color mildColor() => const Color.fromARGB(255, 155, 181, 211);

Color warmColor() => const Color.fromARGB(255, 231, 116, 40);

Color hotColor() => const Color.fromARGB(255, 219, 51, 39);
