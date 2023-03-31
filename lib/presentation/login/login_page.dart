import 'package:brewery/asset/assets.dart';
import 'package:brewery/extension/widget_extension.dart';
import 'package:brewery/presentation/home/tabbar/main_tabbar.dart';
import 'package:brewery/presentation/reusables/button/custom_button.dart';
import 'package:brewery/services/firebase/firebase_service.dart';
import 'package:brewery/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome to Brewery',
                                  style: headingThreeStyleBlack,
                                ),
                                Text(
                                  'Find your favourite drinks',
                                  style: bodyStyleBlack.copyWith(
                                      fontStyle: FontStyle.italic),
                                )
                              ],
                            ),
                          ),
                          Image.asset(
                            logoImage,
                            width: 70.w,
                            height: 70.h,
                          ),
                        ],
                      ),
                      10.0.height,
                      PrimaryButtonWithIconWidget(
                        text: 'Sign in with Google',
                        callback: () async {
                          final service = FirebaseService();

                          await service.signInWithGoogle().then((user) {
                            service.retrieveInformation(user);
                            Navigator.of(context)
                                .pushNamed(MainTabbarPage.routeName);
                          });
                        },
                        icon: googleImage,
                        // icon: Icons.g_mobiledata_rounded,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
