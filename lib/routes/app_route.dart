import 'package:brewery/data/model/breweries/response/breweries_response.dart';
import 'package:brewery/presentation/breweries/breweries_list_page.dart';
import 'package:brewery/presentation/breweries/detail/breweries_detail_page.dart';
import 'package:brewery/presentation/breweries/detail/breweries_webview.dart';
import 'package:brewery/presentation/home/tabbar/main_tabbar.dart';
import 'package:brewery/presentation/login/login_page.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.routeName:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
      case BreweriesListPage.routeName:
        return MaterialPageRoute(builder: (_) => BreweriesListPage());

      case MainTabbarPage.routeName:
        return MaterialPageRoute(builder: (_) => MainTabbarPage());
      case BreweriesDetail.routeName:
        final argument = settings.arguments as BreweriesResponse;
        return MaterialPageRoute(
            builder: (_) => BreweriesDetail(
                  data: argument,
                ));
      case BreweryDetailWebview.routeName:
        final argument = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => BreweryDetailWebview(
                  url: argument,
                ));

      default:
        return MaterialPageRoute(
            builder: (_) => Container(), settings: settings);
    }
  }
}
