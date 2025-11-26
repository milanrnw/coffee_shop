import 'package:coffee_shop/constants/app_colors.dart';
import 'package:coffee_shop/presentation/custom_widgets/quantity_adjust.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDescriptionCard extends StatefulWidget {
  const ProductDescriptionCard({super.key, required this.onQuantityChanged});

  final Function(int) onQuantityChanged;

  @override
  State<ProductDescriptionCard> createState() => _ProductDescriptionCardState();
}

class _ProductDescriptionCardState extends State<ProductDescriptionCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 0.9.sw,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Coffee",
                style: TextStyle(
                  color: AppColors.brandColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Coffee milk",
                    style: TextStyle(
                      color: AppColors.textColorHeading,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Rp25.000",
                    style: TextStyle(
                      color: AppColors.textColorHeading,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ice americano + fresh milk",
                    style: TextStyle(
                      color: AppColors.textColorParagraph,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  QuantityAdjust(
                    quantity: 1,
                    onQuantityChanged: widget.onQuantityChanged,
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  Text(
                    "4.9",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColorHeading,
                    ),
                  ),
                  Text(
                    " (23) • Ratings and reviews",
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  Spacer(),
                  Icon(Icons.chevron_right, color: AppColors.brandColor),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
