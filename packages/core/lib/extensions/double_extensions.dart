import 'package:flutter/material.dart';

extension DoubleExtension on double {
  String inRupees() => '₹$this';
  double round(int n) => double.parse(toStringAsFixed(n));

  Widget get vertical => SizedBox(height: double.parse("$this"));
  Widget get horizontal => SizedBox(width: double.parse("$this"));
}
