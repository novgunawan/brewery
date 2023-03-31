import 'package:brewery/extension/widget_extension.dart';
import 'package:brewery/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButtonWithIconWidget extends StatelessWidget {
  final String text;
  final Function() callback;
  final EdgeInsetsGeometry padding;
  final String icon;
  const PrimaryButtonWithIconWidget({
    super.key,
    required this.text,
    required this.callback,
    required this.icon,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(primaryYellow),
          splashFactory: NoSplash.splashFactory),
      onPressed: callback,
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset(
                  icon,
                  width: 25.w,
                  height: 25.h,
                ),
                13.0.width,
              ],
            ),
            Text(
              text,
              style: buttonStyleBlack,
            ),
          ],
        ),
      ),
    );
  }
}

class PrimaryButtonWidget extends StatelessWidget {
  final String text;
  final Function() callback;
  final EdgeInsetsGeometry padding;

  const PrimaryButtonWidget({
    super.key,
    required this.text,
    required this.callback,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(primaryYellow),
          splashFactory: NoSplash.splashFactory),
      onPressed: callback,
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: buttonStyleBlack,
            ),
          ],
        ),
      ),
    );
  }
}
