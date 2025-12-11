import 'package:coffee_shop/constants/app_colors.dart';
import 'package:coffee_shop/model/product_items_model.dart';
import 'package:coffee_shop/presentation/custom_widgets/quantity_adjust.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDescriptionCard extends StatefulWidget {
  const ProductDescriptionCard({
    super.key,
    required this.onQuantityChanged,
    required this.product,
  });

  final Function(int) onQuantityChanged;
  final ProductItemsModel product;

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
                    widget.product.productLabel,
                    style: TextStyle(
                      color: AppColors.textColorHeading,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Rp${widget.product.productPrice.toStringAsFixed(3)}",
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
                  Flexible(
                    child: Text(
                      widget.product.productDescription,
                      style: TextStyle(
                        color: AppColors.textColorParagraph,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
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
                    widget.product.productRatings.toString(),
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
