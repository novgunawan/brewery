import 'package:brewery/styles/colors.dart';
import 'package:flutter/material.dart';

class DefaultInputDecoration extends InputDecoration {
  final String placeholderText;
  String? initialText;
  EdgeInsetsGeometry? padding;

  DefaultInputDecoration(
      {required this.placeholderText, this.initialText, this.padding})
      : super(
          border: InputBorder.none,
          hintText: placeholderText,
          hintStyle: TextStyle(color: placeholder),
          contentPadding: padding ?? const EdgeInsets.all(15),
        );
}
