import 'package:coffee_shop/constants/app_colors.dart';
import 'package:coffee_shop/constants/app_strings.dart';
import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:coffee_shop/model/product_items_model.dart';
import 'package:coffee_shop/presentation/custom_widgets/mini_product_tile.dart';
import 'package:coffee_shop/presentation/home/coffee_tab_sliver.dart';
import 'package:coffee_shop/presentation/home/home_screen_carousel.dart';

import 'package:coffee_shop/presentation/home/search_bar.dart';
import 'package:flutter/material.dart' hide SearchBar;

class HomeScreenSliver extends StatefulWidget {
  const HomeScreenSliver({super.key});

  @override
  State<HomeScreenSliver> createState() => _HomeScreenSliverState();
}

class _HomeScreenSliverState extends State<HomeScreenSliver>
    with TickerProviderStateMixin {
  late TabController tabController;
  final _controller = ScrollController();

  int _cartItemCount = 0;
  ProductItemsModel? _lastAddedProduct;
  double _cartTotalPrice = 0;

  void _handleOrderAdded(ProductItemsModel product) {
    setState(() {
      _cartItemCount++;
      _lastAddedProduct = product;
      _cartTotalPrice += product.productPrice;
    });
  }

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
      body: Stack(
        children: [
          SafeArea(
              child: CustomScrollView(
            controller: _controller,
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                scrolledUnderElevation: 0,
                surfaceTintColor: Colors.transparent,
                backgroundColor: Theme.of(context).colorScheme.surface,
                forceElevated: false,
                title: SearchBar(),
                pinned: true,
              ),
              SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: HomeScreenCarousel()),
              ),
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                elevation: 0,
                scrolledUnderElevation: 0,
                surfaceTintColor: Colors.transparent,
                backgroundColor: Theme.of(context).colorScheme.surface,
                forceElevated: false,
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
                      Tab(text: AppStrings.homeScreenTab1),
                      Tab(text: AppStrings.homeScreenTab2),
                      Tab(text: AppStrings.homeScreenTab3),
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
                      CoffeeTabSliver(onOrderAdded: _handleOrderAdded),
                      CoffeeTabSliver(onOrderAdded: _handleOrderAdded),
                      CoffeeTabSliver(onOrderAdded: _handleOrderAdded),
                    ],
                  ),
                ),
              )
            ],
          )),
          if (_cartItemCount > 0 && _lastAddedProduct != null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                top: false,
                child: MiniProductTile(
                  productName: _lastAddedProduct!.productLabel,
                  price: _cartTotalPrice,
                  itemCount: _cartItemCount,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
