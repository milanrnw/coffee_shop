import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:coffee_shop/model/onboarding_model.dart';
import 'package:coffee_shop/presentation/custom_widgets/skip_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingSlideData extends StatefulWidget {
  final OnboardingModel onboardingData;
  final int slidelength;
  final int currentindex;
  final Function ontapbutton;

  const OnboardingSlideData({
    super.key,
    required this.onboardingData,
    required this.slidelength,
    required this.currentindex,
    required this.ontapbutton,
  });

  @override
  State<OnboardingSlideData> createState() => _OnboardingSlideDataState();
}

class _OnboardingSlideDataState extends State<OnboardingSlideData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SkipButton(),
        SizedBox(height: 52.h),
        Image.asset(
          widget.onboardingData.imageurl,
          width: 284.w,
          height: 261.h,
        ),
        SizedBox(height: 63.h),
        Text(widget.onboardingData.labeltext,
            style: AppTextStyles.onboardingSlideLabel),
        SizedBox(height: 16.h),
        Text(widget.onboardingData.descriptiontext,
            style: AppTextStyles.onboardingSlideDescription),
        Flexible(
          child: SizedBox.expand(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedSmoothIndicator(
              activeIndex: widget.currentindex,
              count: widget.slidelength,
              effect: ExpandingDotsEffect(
                activeDotColor: Color(0XFF5D4037),
                dotHeight: 12.h,
                dotWidth: 12.h,
                expansionFactor: 2,
              ),
            ),
            GestureDetector(
              onTap: () => widget.ontapbutton(),
              child: Container(
                width: 156.w,
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: Color(0XFF5D4037),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Text(
                      widget.onboardingData.buttontext,
                      style: TextStyle(
                        color: Color(0XFFFEFEFE),
                        fontSize: 14.sp,
                      ),
                    ),
                    Icon(Icons.arrow_forward,
                        color: Color(0XFFFEFEFE), size: 16.r),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
