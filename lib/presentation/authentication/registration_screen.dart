import 'package:coffee_shop/constants/app_strings.dart';
import 'package:coffee_shop/presentation/authentication/login_screen.dart';
import 'package:coffee_shop/presentation/custom_widgets/auth_button.dart';
import 'package:coffee_shop/presentation/custom_widgets/auth_screen_footer_text.dart';
import 'package:coffee_shop/presentation/custom_widgets/common_text_field.dart';
import 'package:coffee_shop/presentation/custom_widgets/send_otp_code_popup.dart';
import 'package:coffee_shop/presentation/custom_widgets/shop_fee_icon.dart';
import 'package:coffee_shop/presentation/custom_widgets/terms_and_privacy_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final nameController = TextEditingController();
  final numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Center(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 103.h),
                  ShopFeeIcon(),
                  SizedBox(height: 28.h),
                  CommonTextField(
                      controller: nameController,
                      labelName: 'Name',
                      hintText: AppStrings.registerNameHint,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.name),
                  SizedBox(height: 8.h),
                  CommonTextField(
                    controller: numberController,
                    labelName: 'Mobile No.',
                    hintText: AppStrings.registerNumberHint,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(height: 16.h),
                  TermsAndPrivacyText(),
                  SizedBox(height: 28.h),
                  AuthButton(
                      buttonText: 'Register',
                      onTap: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => SendOtpCodePopup());
                      }),
                  SizedBox(height: 183.h),
                  AuthScreenFooterText(
                      initialText: AppStrings.registerFooterText,
                      linkText: AppStrings.registerLinkText,
                      onTapLink: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                            (val) => false);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
