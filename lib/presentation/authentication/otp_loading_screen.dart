import 'package:coffee_shop/constants/app_strings.dart';
import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpLoadingScreen extends StatefulWidget {
  const OtpLoadingScreen({
    super.key,
    required this.nextScreen,
  });

  final Widget nextScreen;

  @override
  State<OtpLoadingScreen> createState() => _OtpLoadingScreenState();
}

class _OtpLoadingScreenState extends State<OtpLoadingScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      if (!mounted) return;
      await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => widget.nextScreen),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFEFEFE),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/coffee_loading.gif',
              scale: 0.5,
            ),
            SizedBox(height: 16.h),
            Text(
              AppStrings.otpLoadingScreenLabel,
              style: AppTextStyles.otpLoadingScreenLabel,
            ),
            Text(
              AppStrings.otpLoadingScreenDescription,
              style: AppTextStyles.otpLoadingScreenDescription,
            )
          ],
        ),
      ),
    );
  }
}
