import 'package:coffee_shop/constants/app_strings.dart';
import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:coffee_shop/presentation/home/coffee_tab.dart';
import 'package:coffee_shop/presentation/home/home_screen_carousel.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/presentation/home/search_bar.dart' as sb;
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  double scrollOffset = 0;
  late TabController tabController;

  @override
  void dispose() {
   tabController.dispose();
   super.dispose();
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  final productitemcontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFEFEFE),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              sb.SearchBar(),
              SizedBox(height: 8.h),
              HomeScreenCarousel(),
              SizedBox(height: 16.h),
              TabBar(
                labelStyle: AppTextStyles.homeScreenTab, //faded
                indicatorColor: const Color(0XFF5D4037),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: const Color(0XFFEFEBE9),
                controller: tabController,
                unselectedLabelColor: const Color(0XFF868686),
                tabs: const [
                  Tab(text: AppStrings.homeScreenTab1),
                  Tab(text: AppStrings.homeScreenTab2),
                  Tab(text: AppStrings.homeScreenTab3),
                ],
              ),
              Flexible(
                child: TabBarView(
                  //physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                    CoffeeTab(),
                    CoffeeTab(),
                    CoffeeTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
