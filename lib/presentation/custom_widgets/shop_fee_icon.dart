import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopFeeIcon extends StatelessWidget {
  const ShopFeeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/register_logo.png',
        width: 219.w,
        height: 100.h,
        alignment: Alignment.center,
      ),
    );
  }
}
