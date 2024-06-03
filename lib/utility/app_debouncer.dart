// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';

class AppDebouncer {
  final int milliSecond;
  Timer? timer;
  VoidCallback? voidCallback;
  AppDebouncer({
    required this.milliSecond,
    this.timer,
    this.voidCallback,
  });

  run(VoidCallback callBack) {
    if (timer != null) {
      timer!.cancel();
    }

    timer = Timer(Duration(milliseconds: milliSecond), callBack);
  }
}
