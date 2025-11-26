import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderCompleteDialog extends StatefulWidget {
  const OrderCompleteDialog({super.key});

  @override
  State<OrderCompleteDialog> createState() => _OrderCompleteDialogState();
}

class _OrderCompleteDialogState extends State<OrderCompleteDialog> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 8.h),
            Image.asset(
              'assets/gif/successful.gif',
              scale: 0.5,
            ),
            SizedBox(height: 8.h),
            Text(
              "Yeay Your order is complete.\nYou can pick it up at the bar.",
              textAlign: TextAlign.center,
              style: AppTextStyles.createPinAppBarTitle,
            ),
          ],
        ),
      ),
    );
  }
}
