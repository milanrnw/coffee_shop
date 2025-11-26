import 'package:coffee_shop/constants/app_colors.dart';
import 'package:coffee_shop/constants/app_strings.dart';
import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:coffee_shop/presentation/custom_widgets/auth_button.dart';
import 'package:coffee_shop/presentation/rating/rate_app_screen.dart';
import 'package:coffee_shop/presentation/track_order/mytimeline_tile.dart';
import 'package:coffee_shop/presentation/track_order/order_complete_dialog.dart';
import 'package:coffee_shop/presentation/track_order/ordered_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackingOrderScreen extends StatefulWidget {
  const TrackingOrderScreen({super.key});

  @override
  State<TrackingOrderScreen> createState() => _TrackingOrderScreenState();
}

class _TrackingOrderScreenState extends State<TrackingOrderScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2600), () {
      if (!mounted) return;
      if (ModalRoute.of(context)?.isCurrent != true) return;

      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => const OrderCompleteDialog(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFEFEFE),
      appBar: AppBar(
        leadingWidth: 40,
        backgroundColor: const Color(0XFFFEFEFE),
        centerTitle: false,
        leading: IconButton(
            iconSize: 24.sp,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          AppStrings.trackOrderTitle,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            thickness: 4.h,
            color: const Color(0xFFF4F4F4),
          ),
          OrderedProductCard(
            showAction: false,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Receipt Order",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF5D4037),
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Icon(Icons.keyboard_arrow_right_outlined,
                      size: 14.sp, color: const Color(0xFF5D4037)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Divider(
              thickness: 2.h,
              color: const Color(0xFFF4F4F4),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                MytimelineTile(
                  isFirst: true,
                  isLast: false,
                  isPast: true,
                  eventcard: Text("Coffee shop takes your order"),
                ),
                MytimelineTile(
                  isFirst: false,
                  isLast: false,
                  isPast: true,
                  eventcard: Text("Prepare your order"),
                ),
                MytimelineTile(
                  isFirst: false,
                  isLast: true,
                  isPast: true,
                  eventcard: Text(
                    "Your order is complete. Please pick it up at the bar. Schedule Pick Up (05.15 PM)",
                    maxLines: 3,
                  ),
                ),
                SizedBox(
                  height: 64.h,
                ),
                AuthButton(
                    buttonColor: AppColors.brandColor,
                    buttonText: "Take Order",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RateAppScreen()));
                    }),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "Take order when you have\nreceived your order.",
                  style: AppTextStyles.commonTextFieldText,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
