import 'package:coffee_shop/presentation/authentication/registration_screen.dart';
import 'package:coffee_shop/presentation/custom_widgets/auth_button.dart';
import 'package:coffee_shop/presentation/custom_widgets/auth_screen_footer_text.dart';
import 'package:coffee_shop/presentation/custom_widgets/common_text_field.dart';
import 'package:coffee_shop/presentation/custom_widgets/shop_fee_icon.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.192),

                  ShopFeeIcon(),
                  SizedBox(height: screenHeight * 0.04),
                  
                  CommonTextField(
                    controller: numberController,
                    labelName: 'Mobile No.',
                    hintText: 'Input your number',
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(height: screenHeight * 0.0197),

                  AuthButton(buttonText: 'Login', onTap: () {}),
                  SizedBox(height: screenHeight * 0.33),

                  AuthScreenFooterText(
                      initialText: 'Don\'t have and account? ',
                      linkText: 'Register',
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
