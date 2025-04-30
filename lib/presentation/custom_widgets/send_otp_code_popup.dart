import 'package:coffee_shop/constants/app_strings.dart';
import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:coffee_shop/presentation/authentication/confirm_otp_screen.dart';
import 'package:coffee_shop/presentation/authentication/otp_loading_screen.dart';
import 'package:coffee_shop/presentation/custom_widgets/sent_otp_popup_common_cta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendOtpCodePopup extends StatelessWidget {
  const SendOtpCodePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0XFFF5F5F5),
      insetPadding: EdgeInsets.symmetric(
        horizontal: 48.w,
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
            SizedBox(height: 24.h),
            Text(
              AppStrings.sendOtpPopupLabel,
              style: AppTextStyles.sendOtpPopupLabel,
            ),
            SizedBox(height: 8.h),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        AppStrings.sendOtpPopupDescription1,
                    style: AppTextStyles.sendOtpPopupDescription1,
                  ),
                  TextSpan(
                      text: AppStrings.sendOtpPopupDescription2,
                      style: AppTextStyles.sendOtpPopupDescription2,),
                  TextSpan(
                    text: AppStrings.sendOtpPopupDescription3,
                    style: AppTextStyles.sendOtpPopupDescription3,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
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
