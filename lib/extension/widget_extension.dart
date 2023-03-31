import 'package:flutter/material.dart';

// Extension for adding distance between widget
extension WidgetExtension on double {
  Widget get width => SizedBox(width: this);
  Widget get height => SizedBox(height: this);
}
