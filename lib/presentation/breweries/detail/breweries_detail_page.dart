import 'package:brewery/asset/assets.dart';
import 'package:brewery/data/model/breweries/response/breweries_response.dart';
import 'package:brewery/extension/extension.dart';
import 'package:brewery/presentation/breweries/detail/breweries_webview.dart';
import 'package:brewery/presentation/reusables/appbar/appbar.dart';
import 'package:brewery/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BreweriesDetail extends StatelessWidget {
  final BreweriesResponse data;
  static const String routeName = '/brewery/detail';

  const BreweriesDetail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(
        appBarTitle: 'Brewery Detail',
        callBack: () => Navigator.of(context).pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 200.h,
                child: Image.asset(
                  alcoholImage,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            16.0.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    maxLines: 2,
                    data.name ?? 'Default Beer\'s Name',
                    style: headingThreeStyleBlack,
                  ),
                ),
                Flexible(
                  child: Text(
                    'Rp. 50.000',
                    style: subtitleThreeStyleBlack,
                  ),
                )
              ],
            ),
            8.0.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (var i = 0; i < 5; i++)
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    8.0.width,
                    Text(
                      '5',
                      style: subtitleThreeStyleBlack,
                    ),
                  ],
                ),
                Text('${data.city}, ${data.country}',
                    style: subtitleThreeStyleGravel)
              ],
            ),
            16.0.height,
            DescriptionDetail(
              icon: Icons.phone,
              value: data.phone ?? 'Default Phone Number',
              onTap: () {},
            ),
            16.0.height,
            DescriptionDetail(
              value: data.address ?? 'Default Address',
              icon: Icons.home,
              onTap: () {},
            ),
            16.0.height,
            DescriptionDetail(
              value: data.url ?? 'Default URL',
              icon: Icons.link,
              isWeb: true,
              onTap: () => Navigator.of(context).pushNamed(
                  BreweryDetailWebview.routeName,
                  arguments: data.url ?? 'www.google.com'),
            ),
          ],
        ),
      ),
    );
  }
}

class DescriptionDetail extends StatelessWidget {
  const DescriptionDetail(
      {super.key,
      required this.value,
      required this.icon,
      required this.onTap,
      this.isWeb = false});

  final IconData icon;
  final String value;
  final bool isWeb;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 24.sp,
        ),
        8.0.width,
        InkWell(
          onTap: onTap,
          child: Text(
            value,
            style: isWeb ? copyUnderlineStyle : subtitleThreeStyleBlack,
          ),
        )
      ],
    );
  }
}
