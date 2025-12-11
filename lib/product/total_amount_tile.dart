import 'package:coffee_shop/constants/app_colors.dart';
import 'package:coffee_shop/presentation/checkout/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalAmountTile extends StatelessWidget {
  const TotalAmountTile({super.key, this.onAddOrder, required this.price});

  final VoidCallback? onAddOrder;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.9.sw,
      height: 66.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColorParagraph),
                ),
                Text(
                  "Rp${price.toStringAsFixed(3)}",
                  style: TextStyle(
                    color: AppColors.textColorHeading,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              if (onAddOrder != null) {
                onAddOrder!();
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CheckoutScreen()));
              }
            },
            child: Container(
              height: 48.h,
              width: 132.w,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: AppColors.brandColor,
                border: Border.all(
                  color: AppColors.brandColor,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  "Add Order",
                  style: TextStyle(
                    color: AppColors.brandColor50,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
