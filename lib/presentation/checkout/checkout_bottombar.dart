import 'package:coffee_shop/constants/app_colors.dart';
import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutBottomBar extends StatelessWidget {
  const CheckoutBottomBar({
    super.key,
    required this.onCheckoutPressed,
    required this.totalPrice, // Added this
  });

  final VoidCallback onCheckoutPressed;
  final String totalPrice; // Added this

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66.h,
      width: 375.w,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total",
                style: AppTextStyles.createPinDescription2,
              ),
              SizedBox(height: 4.h),
              Text(
                totalPrice, // Using the dynamic price
                style: AppTextStyles.createPinAppBarTitle,
              ),
            ],
          ),
          SizedBox(
            width: 132.w,
            height: 48.h,
            child: ElevatedButton(
              onPressed: onCheckoutPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.brandColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: Text(
                "Checkout",
                style: AppTextStyles.authButton,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
