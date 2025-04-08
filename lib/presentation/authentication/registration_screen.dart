import 'package:coffee_shop/presentation/authentication/login_screen.dart';
import 'package:coffee_shop/presentation/custom_widgets/auth_button.dart';
import 'package:coffee_shop/presentation/custom_widgets/auth_screen_footer_text.dart';
import 'package:coffee_shop/presentation/custom_widgets/common_text_field.dart';
import 'package:coffee_shop/presentation/custom_widgets/send_otp_code_popup.dart';
import 'package:coffee_shop/presentation/custom_widgets/shop_fee_icon.dart';
import 'package:coffee_shop/presentation/custom_widgets/terms_and_privacy_text.dart';
import 'package:flutter/material.dart';

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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0XFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.053,
          ),
          child: Center(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.127),
                  ShopFeeIcon(),
                  SizedBox(height: screenHeight * 0.0344),
                  CommonTextField(
                      controller: nameController,
                      labelName: 'Name',
                      hintText: 'Input your name',
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.name),
                  SizedBox(height: screenHeight * 0.01),
                  CommonTextField(
                    controller: numberController,
                    labelName: 'Mobile No.',
                    hintText: 'Input your number',
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TermsAndPrivacyText(),
                  SizedBox(height: screenHeight * 0.0344),
                  AuthButton(
                      buttonText: 'Register',
                      onTap: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => SendOtpCodePopup());
                      }),
                  SizedBox(height: screenHeight * 0.225),

                  AuthScreenFooterText(
                      initialText: 'Have an account? ',
                      linkText: 'Login',
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
