import 'package:brewery/data/model/user/user_response.dart';
import 'package:brewery/presentation/pages.dart';
import 'package:brewery/services/firebase/firebase_service.dart';
import 'package:brewery/styles/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainTabbarPage extends StatefulWidget {
  const MainTabbarPage({super.key});
  static const String routeName = '/main';

  @override
  State<MainTabbarPage> createState() => _MainTabbarPageState();
}

class _MainTabbarPageState extends State<MainTabbarPage> {
  int currentPage = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    bool isNeedSafeArea = MediaQuery.of(context).viewPadding.bottom > 0;
    return Scaffold(
      bottomNavigationBar: MediaQuery(
        data: const MediaQueryData(padding: EdgeInsets.only(bottom: 15)),
        child: SafeArea(
          minimum: isNeedSafeArea
              ? const EdgeInsets.only(bottom: 30)
              : EdgeInsets.zero,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 3.0,
                    offset: const Offset(0, -3.0))
              ],
            ),
            child: BottomNavigationBar(
              backgroundColor: primaryWhite,
              currentIndex: currentPage,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              unselectedLabelStyle: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: disabledPurple),
              selectedLabelStyle: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: primaryYellow),
              selectedItemColor: primaryYellow,
              onTap: ((value) {
                if (currentPage != value) {
                  setState(() {
                    currentPage = value;
                  });
                  pageController.jumpToPage(value);
                }
              }),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  activeIcon: Container(
                    margin: const EdgeInsets.only(bottom: 7),
                    child: Icon(
                      Icons.water_drop_rounded,
                      color: primaryYellow,
                    ),
                  ),
                  icon: Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      child: const Icon(Icons.water_drop_rounded,
                          color: Colors.grey)),
                  label: 'Drinks',
                ),
                BottomNavigationBarItem(
                  activeIcon: Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      child: Icon(
                        Icons.history,
                        color: primaryYellow,
                      )),
                  icon: Container(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: const Icon(Icons.history, color: Colors.grey)),
                  label: 'History',
                ),
                BottomNavigationBarItem(
                  activeIcon: Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      child: Icon(
                        Icons.person,
                        color: primaryYellow,
                      )),
                  icon: Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      child: const Icon(Icons.person, color: Colors.grey)),
                  label: 'Profile',
                )
              ],
            ),
          ),
        ),
      ),
      body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            BreweriesListPage(),
            TransactionListPage(),
            ProfilePage(
              user: _getUserInfo(),
            )
          ]),
    );
  }

  UserResponse _getUserInfo() {
    final user = FirebaseService()
        .retrieveInformation(FirebaseAuth.instance.currentUser);
    return user;
  }
}
