import 'package:coffee_shop/product/common_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCustomizeCard2 extends StatelessWidget {
  const ProductCustomizeCard2({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonCardWidget(
      title: "Customize Your Coffee",
      description: "Choose your preferences",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Option 1"),
          SizedBox(height: 8.h),
          Text("Option 2"),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
