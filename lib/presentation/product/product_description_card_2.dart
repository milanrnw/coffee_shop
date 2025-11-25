import 'package:coffee_shop/product/common_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coffee_shop/constants/app_colors.dart';
import 'package:coffee_shop/presentation/custom_widgets/quantity_adjust.dart';

class ProductDescriptionCard2 extends StatelessWidget {
  const ProductDescriptionCard2({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonCardWidget(
      title: "Coffee", // Optional title
      description: "Ice americano + fresh milk", // Optional description
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Rp25.000",
            style: TextStyle(
              color: AppColors.textColorHeading,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          QuantityAdjust(
            quantity: 1,
            onQuantityChanged: (int) {},
          ),
        ],
      ),
    );
  }
}
