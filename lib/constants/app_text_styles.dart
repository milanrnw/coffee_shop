import 'package:coffee_shop/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyles {
  static TextStyle skipButton = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Color(0XFF3C3C3C),
  );

  static TextStyle authButton = GoogleFonts.poppins(
    fontSize: 14.sp,
    color: Color(0XFFFFFFFF),
  );

  static TextStyle commonTextFieldText = GoogleFonts.poppins(
    fontSize: 14.sp,
    color: Color(0XFF3C3C3C),
  );

  static TextStyle createPinFieldText = GoogleFonts.poppins(
    fontSize: 24.sp,
    color: Color(0XFF555555),
  );

  static TextStyle otpTextFieldText = GoogleFonts.poppins(
    fontSize: 40.sp,
    color: Color(0XFF555555),
  );

  static TextStyle productRatingText = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: Color(0XFF3C3C3C),
  );

  static TextStyle productLabelText = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Color(0XFF555555),
  );

  static TextStyle productDescriptionText = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: Color(0XFF555555),
  );

  static TextStyle originalPrice = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: Color(0XFF555555),
  );

  static TextStyle salePrice = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Color(0xff555555),
  );

  static TextStyle searchTextFieldText = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: Color(0XFFCACACA),
  );

  static TextStyle searchTextFieldHintText = GoogleFonts.poppins(
    fontSize: 14.sp,
    color: Color(0XFF3C3C3C),
  );

  static TextStyle onboardingSlideLabel = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: Color(0XFF3C3C3C),
  );
  static TextStyle onboardingSlideDescription = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: Color(0XFF555555),
  );

  static TextStyle otpLoadingScreenLabel = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textColorHeading,
  );
  static TextStyle otpLoadingScreenDescription = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textColorHeading,
  );

  static TextStyle loginLabel = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textColorHeading,
  );
  static TextStyle loginNumberHint = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: Color(0XFF8A8A8A),
  );
  static TextStyle loginFooterText = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Color(0XFF555555),
  );
  static TextStyle loginLinkText = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.brandColor,
  );

  static TextStyle registerNameHint = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: Color(0XFF8A8A8A),
  );
  static TextStyle registerNumberHint = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: Color(0XFF8A8A8A),
  );
  static TextStyle registerFooterText = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textColorParagraph,
  );
  static TextStyle registerLinkText = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.brandColor,
  );

  static TextStyle registerTermsAndPrivacyText1 = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: Color(0XFF7C7C7C),
  );
  static TextStyle registerTermsAndPrivacyText2 = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: Color(0XFF032172),
  );
  static TextStyle registerTermsAndPrivacyText3 = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: Color(0XFF7C7C7C),
  );
  static TextStyle registerTermsAndPrivacyText4 = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: Color(0XFF032172),
  );

  static TextStyle sendOtpPopupLabel = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Color(0XFF000000),
  );
  static TextStyle sendOtpPopupDescription1 = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textColorParagraph,
  );
  static TextStyle sendOtpPopupDescription2 = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textColorHeading,
  );
  static TextStyle sendOtpPopupDescription3 = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textColorParagraph,
  );

  static TextStyle confirmOtpAppBarTitle = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textColorHeading,
  );
  static TextStyle confirmOtpNumber = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textColorHeading,
  );
  static TextStyle confirmOtpDescription = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textColorHeading,
  );
  static TextStyle confirmOtpFooterText = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: Color(0XFF000000),
  );
  static TextStyle confirmOtpFooterLinkText = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.semanticColorInfo,
  );

  static TextStyle createPinAppBarTitle = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textColorHeading,
  );
  static TextStyle createPinDescription1 = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textColorHeading,
  );
  static TextStyle createPinDescription2 = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textColorHeading,
  );

  static TextStyle homeScreenTab = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.brandColor,
  );

  static TextStyle bottomNavigationBarNav = GoogleFonts.poppins(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.brandColor,
  );
}
