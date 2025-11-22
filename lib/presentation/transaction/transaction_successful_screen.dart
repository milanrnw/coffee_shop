import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionSuccessfulScreen extends StatefulWidget {
  const TransactionSuccessfulScreen({
    super.key,
    required this.nextScreen,
  });

  final Widget nextScreen;

  @override
  State<TransactionSuccessfulScreen> createState() =>
      _TransactionSuccessfulScreen();
}

class _TransactionSuccessfulScreen extends State<TransactionSuccessfulScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      if (!mounted) return;
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => widget.nextScreen),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFEFEFE),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 107.h,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/gif/successful.gif',
              scale: 0.5,
            ),
          ),
          Positioned(
            top: 407.h,
            left: 20.h,
            right: 20.h,
            child: Column(
              children: [
                Text(
                  "Yeayy!! Your Transaction was successful",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.onboardingSlideLabel,
                ),
                SizedBox(height: 20.h),
                Text(
                  "Coffee shop takes your order",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.onboardingSlideDescription,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
