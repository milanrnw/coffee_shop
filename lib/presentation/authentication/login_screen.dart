import 'package:coffee_shop/constants/app_strings.dart';
import 'package:coffee_shop/presentation/authentication/pin_input_screen.dart';
import 'package:coffee_shop/presentation/authentication/registration_screen.dart';
import 'package:coffee_shop/presentation/custom_widgets/auth_button.dart';
import 'package:coffee_shop/presentation/custom_widgets/auth_screen_footer_text.dart';
import 'package:coffee_shop/presentation/custom_widgets/common_text_field.dart';
import 'package:coffee_shop/presentation/custom_widgets/custom_snackbar.dart';
import 'package:coffee_shop/presentation/custom_widgets/shop_fee_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 156.h),
                  ShopFeeIcon(),
                  SizedBox(height: 32.h),
                  CommonTextField(
                    controller: numberController,
                    labelName: AppStrings.loginLabel,
                    hintText: AppStrings.loginNumberHint,
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(height: 16.h),
                  AuthButton(
                      buttonText: 'Login',
                      onTap: () {
                        if (numberController.text.isEmpty) {
                          showCustomSnackbar(
                              context, "Enter your mobile number first.");
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PinInputScreen()),
                          );
                        }
                      }),
                  SizedBox(height: 268.h),
                  AuthScreenFooterText(
                    initialText: AppStrings.loginFooterText,
                    linkText: AppStrings.loginLinkText,
                    onTapLink: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationScreen(),
                        ),
                        (val) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
