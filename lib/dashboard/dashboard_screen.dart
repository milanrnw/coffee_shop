import 'package:coffee_shop/account/account_screen.dart';
import 'package:coffee_shop/constants/app_colors.dart';
import 'package:coffee_shop/presentation/history/history_screen.dart';
import 'package:coffee_shop/presentation/home/home_screen_sliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int bottomNavBarIndex = 0;

  final List<Widget> pages = const [
    HomeScreenSliver(),
    HistoryScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFEFEFE),
      body: pages[bottomNavBarIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: (Colors.grey.withValues(alpha: 0.5)),
              spreadRadius: 0.5,
              blurRadius: 5,
            )
          ],
          color: const Color(0XFFFEFEFE),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
        ),
        child: BottomNavigationBar(
          iconSize: 24.r,
          selectedItemColor: AppColors.brandColor,
          unselectedItemColor: Color(0XFFCACACA),
          currentIndex: bottomNavBarIndex,
          selectedLabelStyle: TextStyle(
            fontSize: 10.sp,
          ),
          enableFeedback: true,
          onTap: (index) {
            if (bottomNavBarIndex != index) {
              setState(() {
                bottomNavBarIndex = index;
              });
            }
          },
          unselectedLabelStyle: TextStyle(
            fontSize: 10.sp,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.horizontal_split_rounded), label: "History"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: "Account"),
          ],
        ),
      ),
    );
  }
}
