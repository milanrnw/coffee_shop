import 'package:coffee_shop/constants/app_colors.dart';
import 'package:coffee_shop/constants/app_strings.dart';
import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:coffee_shop/presentation/authentication/create_pin_screen.dart';
import 'package:coffee_shop/presentation/authentication/otp_loading_screen.dart';
import 'package:coffee_shop/presentation/custom_widgets/custom_snackbar.dart';
import 'package:coffee_shop/presentation/custom_widgets/otp_textfield.dart';
import 'package:coffee_shop/presentation/custom_widgets/auth_button.dart';
import 'package:coffee_shop/presentation/custom_widgets/auth_screen_footer_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmOtpScreen extends StatefulWidget {
  const ConfirmOtpScreen({super.key});

  @override
  State<ConfirmOtpScreen> createState() => _ConfirmOtpScreenState();
}

class _ConfirmOtpScreenState extends State<ConfirmOtpScreen> {
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        backgroundColor: Color(0XFFFEFEFE),
        centerTitle: false,
        leading: IconButton(
            iconSize: 24.sp,
            padding: EdgeInsets.symmetric(horizontal: 16),
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back)),
        title: Text(
          AppStrings.confirmOtpAppBarTitle,
          style: AppTextStyles.confirmOtpAppBarTitle,
        ),
      ),
      backgroundColor: Color(0XFFFEFEFE),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Color(0XFF3C3C3C).withValues(alpha: 0.15),
                  blurRadius: 50.r,
                  spreadRadius: 0,
                  offset: Offset(0, 50),
                )
              ]),
              child: Divider(
                color: Color(0XFF3C3C3C).withValues(alpha: 0.15),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 32.h),
                  Text(
                    AppStrings.confirmOtpNumber,
                    style: AppTextStyles.confirmOtpNumber,
                  ),
                  Text(
                    AppStrings.confirmOtpDescription,
                    style: AppTextStyles.confirmOtpDescription,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32.h),
                  OtpTextfield(controller: otpController),
                  SizedBox(height: 32.h),
                  AuthScreenFooterText(
                    initialText: AppStrings.confirmOtpFooterText,
                    linkText: AppStrings.confirmOtpFooterLinkText,
                    onTapLink: () {},
                    initialTextColor: Color(0XFF000000),
                    linkTextColor: AppColors.semanticColorInfo,
                  ),
                  SizedBox(height: 102.h),
                  AuthButton(
                    buttonText: 'Confirm',
                    onTap: () {
                      if (otpController.text.isEmpty) {
                        showCustomSnackbar(
                            context, "Enter your OTP Code first");
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                OtpLoadingScreen(nextScreen: CreatePin())));
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
