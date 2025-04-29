import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee_shop/constants/app_strings.dart';
import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:coffee_shop/model/pills_model.dart';
import 'package:coffee_shop/model/product_items_model.dart';
import 'package:coffee_shop/presentation/custom_widgets/home_carousel_item.dart';
import 'package:coffee_shop/presentation/custom_widgets/pills.dart';
import 'package:coffee_shop/presentation/custom_widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/presentation/home/search_bar.dart' as sb;
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int carouselIndex = 0;
  double scrollOffset = 0;
  late CarouselController homeCarouselController;
  late TabController tabController;
  
  final productItemData = [
    ProductItemsModel(
        productImage: "assets/images/home/products/item_1.png",
        productLabel: "Coffee Milk",
        productDescription: "ice americano + fresh milk",
        productPrice: 25.000),
    ProductItemsModel(
        productImage: "assets/images/home/products/item_2.png",
        productLabel: "Cocoa Caramel Latte",
        productDescription: "streamed milk with mocha and caramel sauces",
        productPrice: 35.500),
    ProductItemsModel(
        productImage: "assets/images/home/products/item_1.png",
        productLabel: "Nitro Cold Brew",
        productDescription: "cold brew with nitrogen without sugar, velvety crema.",
        productPrice: 31.000),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    homeCarouselController = CarouselController(initialItem: carouselIndex);
  }

  List<String> carouselImages = [
    'assets/images/home/carousel/carousel1.png',
    'assets/images/home/carousel/carousel2.png',
    'assets/images/home/carousel/carousel3.png',
  ];

  List<PillsModel> pillsList = const [
    PillsModel(icon: Icons.filter, text: 'Filter'),
    PillsModel(icon: Icons.star, text: 'Rating 4.5+'),
    PillsModel(icon: Icons.price_check_rounded, text: 'Price'),
    PillsModel(icon: Icons.discount, text: 'Promo'),
  ];

  final productitemcontroller = PageController();

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
              CarouselSlider(
              options: CarouselOptions(
              height: 137.h,
              pageSnapping: true,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),),
              items: carouselImages.map((image) {
              return Builder(
              builder: (BuildContext context) {
              return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: HomeCarouselItem(imageUrl: image),
            );
          },
        );
      }).toList(),
    ),
              SizedBox(height: 16.h),
              TabBar(
                labelStyle: AppTextStyles.homeScreenTab,
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
                    Column(
                      children: [
                        SizedBox(height: 8.h),
                        SizedBox(
                          height: 42.h,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount: pillsList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Pills(
                              pillData: pillsList[index],
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        ListView.builder(itemBuilder: (context, index) => ProductTile(
                        productlabel:productItemData[index].productLabel,
                        productDescription: productItemData[index].productDescription,
                        productImage: productItemData[index].productImage,
                        originalPrice: productItemData[index].productOriginalPrice),
                        itemCount:productItemData.length,
                        shrinkWrap: true,
                        ),
                      ],
                    ),
                    const Text('2'),
                    const Text('3'),
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
