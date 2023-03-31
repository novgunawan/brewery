import 'package:brewery/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GeneralAppBar extends AppBar {
  final String appBarTitle;
  final bool isBackButtonShown;
  final Function() callBack;

  GeneralAppBar({
    required this.appBarTitle,
    this.isBackButtonShown = true,
    required this.callBack,
  }) : super(
          backgroundColor: primaryYellow,
          automaticallyImplyLeading: true,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: primaryYellow,
          ),
          leading: Visibility(
            visible: isBackButtonShown,
            child: IconButton(
              onPressed: callBack,
              icon: Icon(
                Icons.chevron_left_rounded,
                color: primaryBlack,
              ),
            ),
          ),
          title: Text(
            appBarTitle,
            style: TextStyle(
              color: primaryBlack,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          elevation: 0.0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        );
}
