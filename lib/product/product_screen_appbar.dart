import 'package:coffee_shop/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreenAppbar extends StatefulWidget {
  const ProductScreenAppbar({super.key});

  @override
  State<ProductScreenAppbar> createState() => _ProductScreenAppbarState();
}

class _ProductScreenAppbarState extends State<ProductScreenAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Customize order",
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textColorHeading,
        ),
      ),
      leadingWidth: 40.h,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(Icons.arrow_back),
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
