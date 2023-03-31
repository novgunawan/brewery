import 'package:brewery/bloc/breweries/breweries_bloc.dart';
import 'package:brewery/data/model/user/user_response.dart';
import 'package:brewery/presentation/home/tabbar/main_tabbar.dart';
import 'package:brewery/presentation/login/login_page.dart';
import 'package:brewery/presentation/splashscreen/splash_screen.dart';
import 'package:brewery/routes/app_route.dart';
import 'package:brewery/services/firebase/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  setupApp();
}

void setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BreweriesBloc(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            onGenerateRoute: AppRoute.onGenerateRoute,
            debugShowCheckedModeBanner: false,
            builder: EasyLoading.init(),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
