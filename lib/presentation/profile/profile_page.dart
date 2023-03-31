import 'package:brewery/asset/assets.dart';
import 'package:brewery/data/model/user/user_response.dart';
import 'package:brewery/extension/extension.dart';
import 'package:brewery/presentation/login/login_page.dart';
import 'package:brewery/presentation/reusables/appbar/appbar.dart';
import 'package:brewery/presentation/reusables/button/custom_button.dart';
import 'package:brewery/services/firebase/firebase_service.dart';
import 'package:brewery/styles/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.user});
  final UserResponse user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(
          appBarTitle: 'Profile',
          callBack: () => Navigator.of(context).pop(),
          isBackButtonShown: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 120.w,
                height: 120.h,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: CachedNetworkImage(
                  imageUrl: user.photoUrl,
                  placeholder: (context, url) => Image.asset(logoImage),
                ),
              ),
            ),
            20.0.height,
            Center(
              child: Text(
                user.name,
                style: bodyStyleGravel,
              ),
            ),
            32.0.height,
            const Spacer(),
            PrimaryButtonWidget(
                text: 'Sign Out',
                callback: () async {
                  final service = FirebaseService();

                  await service.signOutFromGoogle().then((value) =>
                      Navigator.of(context)
                          .popAndPushNamed(LoginPage.routeName));
                })
          ],
        ),
      ),
    );
  }
}
