import 'dart:async';
import 'package:flutter/foundation.dart';

class Debounce {
  final int ms;
  Timer _timer;

  Debounce(this.ms);
  
  void run(VoidCallback callback) {
    if (_timer != null) {
      _timer.cancel();
    }

    _timer = Timer(Duration(milliseconds: ms), callback);
  }
}