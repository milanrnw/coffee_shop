import 'package:coffee_shop/constants/app_colors.dart';
import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:coffee_shop/presentation/custom_widgets/auth_button.dart';
import 'package:coffee_shop/presentation/rating/common_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RateAppScreen extends StatefulWidget {
  const RateAppScreen({super.key});

  @override
  State<RateAppScreen> createState() => _RateAppScreenState();
}

class _RateAppScreenState extends State<RateAppScreen> {
  double _userRating = 0.0;

  void _handleRatingChange(double newRating) {
    setState(() {
      _userRating = newRating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFEFEFE),
      appBar: AppBar(
        leadingWidth: 40,
        backgroundColor: const Color(0XFFFEFEFE),
        centerTitle: false,
        leading: IconButton(
            iconSize: 24.sp,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close)),
        title: Text(
          "Rating and Review",
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              color: Color(0xFFEFEBE9),
              thickness: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  Image.asset(
                    'assets/images/rate_app.png',
                    width: 181.w,
                    height: 166.h,
                  ),
                  Text(
                    "How's your order this time?",
                    style: AppTextStyles.otpLoadingScreenLabel,
                  ),
                  SizedBox(height: 8.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Rating",
                      style: AppTextStyles.checkOutTitleBar,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  CommonRatingBar(
                    initialRating: _userRating,
                    onRatingChanged: _handleRatingChange,
                    itemSize: 62.sp,
                  ),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
            Divider(
              color: Color(0xFFEFEBE9),
              thickness: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 8.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Review",
                      style: AppTextStyles.checkOutTitleBar,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextField(
                    textInputAction: TextInputAction.done,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Tell us about your experience',
                      hintStyle: const TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.all(12.w),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Reviews will be visible to the public",
                      style: AppTextStyles.otpLoadingScreenLabel,
                    ),
                  ),
                  SizedBox(height: 84.h),
                  AuthButton(
                    buttonText: "Send a review",
                    onTap: () {},
                    buttonColor: AppColors.brandColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
