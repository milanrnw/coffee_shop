import 'package:coffee_shop/presentation/authentication/confirm_otp_screen.dart';
import 'package:coffee_shop/presentation/authentication/otp_loading_screen.dart';
import 'package:coffee_shop/presentation/custom_widgets/sent_otp_popup_common_cta.dart';
import 'package:flutter/material.dart';

class SendOtpCodePopup extends StatelessWidget {
  const SendOtpCodePopup({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Dialog(
      backgroundColor: Color(0XFFF5F5F5),
      insetPadding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.125,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 17,
          horizontal: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/register_otp_popup.png',
              height: 168,
              width: 161,
            ),
            //SizedBox(height: 24),
            SizedBox(height: screenHeight * 0.029),
            Text(
              'Send OTP code',
              style: TextStyle(
                color: Color(0XFF000000),
                fontSize: 14,
              ),
            ),
            //SizedBox(height: 8),
            SizedBox(height: screenHeight * 0.01),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'We will send the OTP code via SMS. Make sure the number',
                    style: TextStyle(
                      color: Color(0XFF555555),
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                      text: ' 1234567890 ',
                      style: TextStyle(
                        color: Color(0XFF3C3C3C),
                        fontSize: 12,
                      )),
                  TextSpan(
                    text: 'is active',
                    style: TextStyle(
                      color: Color(0XFF555555),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            //SizedBox(height: 24),
            SizedBox(height: screenHeight * 0.029),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SentOtpPopupCommonCta(
                  buttonText: 'Cancel',
                  onTap: () => {Navigator.of(context).pop()},
                  buttonBackground: Color(0XFFFEFEFE),
                  buttonTextColor: Color(0XFF3C3C3C),
                ),
                SentOtpPopupCommonCta(
                buttonText: 'Continue',
                onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => OtpLoadingScreen(nextScreen: const ConfirmOtpScreen()),
            ));
            },)
              ],
            )
          ],
        ),
      ),
    );
  }
}
