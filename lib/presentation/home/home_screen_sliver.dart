import 'package:coffee_shop/constants/app_colors.dart';
import 'package:coffee_shop/constants/app_strings.dart';
import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:coffee_shop/presentation/home/coffee_tab_sliver.dart';
import 'package:coffee_shop/presentation/home/home_screen_carousel.dart';
import 'package:coffee_shop/presentation/home/search_bar.dart';
import 'package:flutter/material.dart' hide SearchBar;

class HomeScreenSliver extends StatefulWidget {
  const HomeScreenSliver({super.key});

  @override
  State<HomeScreenSliver> createState() => _HomeScreenSliverState();
}

class _HomeScreenSliverState extends State<HomeScreenSliver> with TickerProviderStateMixin {

  late TabController tabController;
  final _controller = ScrollController();

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      debugPrint(_controller.offset.toString());
    });
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CustomScrollView(
        controller: _controller,
        //physics: const ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: SearchBar(),
            pinned: true,
          ),

          SliverToBoxAdapter(
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
            child: HomeScreenCarousel()),
          ),

          SliverAppBar(
            pinned: true,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TabBar(
                labelPadding: EdgeInsets.zero,
                labelStyle: AppTextStyles.homeScreenTab,
                indicatorColor: AppColors.brandColor,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: const Color(0XFFEFEBE9),
                controller: tabController,
                unselectedLabelColor: const Color(0XFF868686),
                tabs: [
                  Tab(text: AppStrings.homeScreenTab1,),
                  Tab(text: AppStrings.homeScreenTab2,),
                  Tab(text: AppStrings.homeScreenTab3,),
                ],
              ),
            ),
          ),

          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TabBarView(
                controller: tabController,
                children: [
                  CoffeeTabSliver(),
                  CoffeeTabSliver(),
                  CoffeeTabSliver(),
                ],
              ),
            ),
          )
          
        ],
      )),
    );
  }
}