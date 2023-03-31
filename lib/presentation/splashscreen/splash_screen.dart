import 'package:brewery/asset/assets.dart';
import 'package:brewery/data/model/user/user_response.dart';
import 'package:brewery/extension/extension.dart';
import 'package:brewery/presentation/home/tabbar/main_tabbar.dart';
import 'package:brewery/presentation/login/login_page.dart';
import 'package:brewery/services/firebase/firebase_service.dart';
import 'package:brewery/styles/colors.dart';
import 'package:brewery/styles/text_styles.dart';
import 'package:brewery/utils/widget_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    showLoading();
    _autoLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellowPending,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            150.0.height,
            Image.asset(
              logoImage,
              width: 150.w,
              height: 150.h,
            ),
            16.0.height,
            Text(
              'Brewery',
              style: headingThreeStyleBlack,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _autoLogin() async {
    final service = FirebaseService();
    final user = FirebaseAuth.instance.currentUser;

    Future.delayed(const Duration(seconds: 3), () {
      final UserResponse userObject = service.retrieveInformation(user);
      hideLoading();
      if (userObject.name.isEmpty) {
        Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
      } else {
        Navigator.of(context).pushReplacementNamed(MainTabbarPage.routeName);
      }
    });
  }
}
