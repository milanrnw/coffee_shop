import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee_shop/model/pills_model.dart';
import 'package:coffee_shop/presentation/custom_widgets/home_carousel_item.dart';
import 'package:coffee_shop/presentation/custom_widgets/pills.dart';
import 'package:coffee_shop/presentation/custom_widgets/product_tile.dart';
import 'package:coffee_shop/presentation/custom_widgets/search_text_field.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    homeCarouselController = CarouselController(initialItem: carouselIndex);
    //_incrementCounter();
  }

  // _incrementCounter() {
  //   Timer.periodic(const Duration(seconds: 3), (val) {
  //     if (carouselIndex < 2) {
  //       scrollOffset = scrollOffset + 400;
  //       homeCarouselController.jumpTo(scrollOffset);

  //       carouselIndex++;
  //     } else if (carouselIndex == 2) {
  //       carouselIndex = 0;
  //       scrollOffset = 0;
  //       homeCarouselController.jumpTo(scrollOffset);
  //     }
  //     setState(() {});
  //   });
  // }

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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Expanded(
                    child: SearchTextField(),
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: Color(0XFF5D4037),
                      size: 24,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              // SizedBox(
              //   height: screenHeight * 0.168,
              //   width: screenWidth,
              //   child: CarouselView(
              //     controller: homeCarouselController,
              //     scrollDirection: Axis.horizontal,
              //     itemSnapping: true,
              //     itemExtent: screenWidth,
              //     children: carouselImages
              //         .map(
              //           (image) => HomeCarouselItem(imageUrl: image),
              //         )
              //         .toList(),
              //   ),
              // ),

              CarouselSlider(
                items: carouselImages
                    .map(
                      (Image) => HomeCarouselItem(imageUrl: Image),
                    )
                    .toList(),
                options: CarouselOptions(
                  height: screenHeight * 0.168,
                  autoPlay: true,
                ),
              ),
              const SizedBox(height: 16),
              TabBar(
                labelStyle: const TextStyle(
                  fontSize: 16,
                  color: Color(0XFF5D4037),
                  fontWeight: FontWeight.w500,
                ),
                indicatorColor: const Color(0XFF5D4037),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: const Color(0XFFEFEBE9),
                controller: tabController,
                unselectedLabelColor: const Color(0XFF868686),
                tabs: const [
                  Tab(text: 'Coffee'),
                  Tab(text: 'Non Coffee'),
                  Tab(text: 'Pastry'),
                  Tab(text: 'tab 4'),
                ],
              ),
              Flexible(
                child: TabBarView(
                  //physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 8),
                        SizedBox(
                          height: screenHeight * 0.0517,
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
                        const SizedBox(height: 6),
                        const ProductTile(),
                      ],
                    ),
                    const Text('Hello from tab 2'),
                    const Text('Hello from tab 3'),
                    const Text('Hello from tab 4'),
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
