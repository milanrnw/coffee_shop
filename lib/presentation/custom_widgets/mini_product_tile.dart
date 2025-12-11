import 'package:coffee_shop/constants/app_colors.dart';
import 'package:coffee_shop/presentation/checkout/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MiniProductTile extends StatelessWidget {
  final String productName;
  final double price;
  final int itemCount;

  const MiniProductTile({
    super.key,
    required this.productName,
    required this.price,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 56.h,
      margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 8.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: AppColors.brandColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CheckoutScreen()));
        },
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "$itemCount item${itemCount > 1 ? 's' : ''}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  productName,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              "Rp${price.toStringAsFixed(3)}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 12.w),
            Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 24.sp),
          ],
        ),
      ),
    );
  }
}
