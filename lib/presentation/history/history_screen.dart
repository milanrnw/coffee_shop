import 'package:coffee_shop/constants/app_colors.dart';
import 'package:coffee_shop/constants/app_strings.dart';
import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:coffee_shop/dashboard/dashboard_screen.dart';
import 'package:coffee_shop/presentation/checkout/checkout_screen.dart';
import 'package:coffee_shop/presentation/track_order/ordered_product_card.dart';
import 'package:coffee_shop/presentation/transaction/order_receipt_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryScreen extends StatefulWidget {
  final int initialIndex;
  const HistoryScreen({super.key, this.initialIndex = 0});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 2, vsync: this, initialIndex: widget.initialIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _handleBackNavigation() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const DashboardScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        _handleBackNavigation();
      },
      child: Scaffold(
        backgroundColor: const Color(0XFFFEFEFE),
        appBar: AppBar(
          leadingWidth: 40,
          backgroundColor: const Color(0XFFFEFEFE),
          centerTitle: false,
          leading: IconButton(
            iconSize: 24.sp,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            onPressed: _handleBackNavigation,
            icon: const Icon(Icons.arrow_back),
          ),
          title: Text(
            "History Orders",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            TabBar(
              labelPadding: EdgeInsets.zero,
              labelStyle: AppTextStyles.homeScreenTab,
              indicatorColor: AppColors.brandColor,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: const Color(0XFFEFEBE9),
              controller: _tabController,
              unselectedLabelColor: const Color(0XFF868686),
              tabs: [
                Tab(text: AppStrings.historyTab1),
                Tab(text: AppStrings.historyTab2),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView(
                    padding: EdgeInsets.only(top: 10.h),
                    children: [
                      OrderedProductCard(
                        isHistory: false,
                        onActionTap: () {},
                      ),
                    ],
                  ),
                  ListView(
                    padding: EdgeInsets.only(top: 10.h),
                    children: [
                      Column(
                        children: [
                          OrderedProductCard(
                            isHistory: true,
                            onActionTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => OrderReceiptScreen(
                                    buttonText: "Order Again",
                                    onButtonTap: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CheckoutScreen()),
                                        (route) => false,
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Divider(
                              color: AppColors.neutralColorMedium,
                              thickness: 2.h,
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  color: const Color(0xFFE0E0E0), width: 1),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Row(
                              children: [
                                Container(
                                  color: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12.h, horizontal: 16.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        "5",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(width: 4.w),
                                      Icon(Icons.star,
                                          color: Colors.amber, size: 24.sp),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    color: AppColors.neutralColorMedium,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12.h, horizontal: 16.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Review",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp),
                                        ),
                                        SizedBox(height: 4.h),
                                        Text(
                                          "“The coffee is delicious, light and reasonably priced.",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.grey[700]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
