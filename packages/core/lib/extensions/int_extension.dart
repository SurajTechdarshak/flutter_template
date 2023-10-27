import 'package:flutter/material.dart';

extension IntExtensions on int {
  // Get formatted time 02:00
  String formattedTime(int time) {
    final sec = time % 60;
    final min = (time / 60).floor();
    final minute = min.toString().length <= 1 ? '0$min' : '$min';
    final second = sec.toString().length <= 1 ? '0$sec' : '$sec';
    return '$minute:$second';
  }

  String suffix() {
    switch (this % 10) {
      case 1:
        return "st";
      case 2:
        return "nd";
      case 3:
        return "rd";
      default:
        return "th";
    }
  }

  Widget get vertical => SizedBox(height: double.parse("$this"));
  Widget get horizontal => SizedBox(width: double.parse("$this"));
}
