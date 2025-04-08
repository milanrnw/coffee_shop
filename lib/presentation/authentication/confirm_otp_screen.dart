import 'package:coffee_shop/presentation/authentication/create_pin_screen.dart';
import 'package:coffee_shop/presentation/authentication/otp_loading_screen.dart';
import 'package:coffee_shop/presentation/custom_widgets/otp_textfield.dart';
import 'package:coffee_shop/presentation/custom_widgets/auth_button.dart';
import 'package:coffee_shop/presentation/custom_widgets/auth_screen_footer_text.dart';
import 'package:flutter/material.dart';

class ConfirmOtpScreen extends StatefulWidget {
  const ConfirmOtpScreen({super.key});

  @override
  State<ConfirmOtpScreen> createState() => _ConfirmOtpScreenState();
}

class _ConfirmOtpScreenState extends State<ConfirmOtpScreen> {
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    //final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        backgroundColor: Color(0XFFFEFEFE),
        centerTitle: false,
        leading: IconButton(
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 16),
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back)),
        title: Text(
          'Confirm OTP code',
          style: TextStyle(
            fontSize: 16,
            color: Color(0XFF3C3C3C),
            fontWeight: FontWeight.w600,
          ),
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
                  blurRadius: 50,
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
                  SizedBox(height: screenHeight * 0.04),
                  Text(
                    '1234567890',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Enter the 5-digit OTP code that has been sent from SMS to complete your account registration',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  OtpTextfield(controller: otpController),
                  SizedBox(height: screenHeight * 0.04),
                  AuthScreenFooterText(
                    initialText: 'Haven\'t got the confirmation code yet? ',
                    linkText: 'Resend',
                    onTapLink: () {},
                    linkTextColor: Colors.blue,
                  ),
                  SizedBox(height: screenHeight * 0.125),
                  AuthButton(
                    buttonText: 'Confirm',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => OtpLoadingScreen(nextScreen: CreatePin())));
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
