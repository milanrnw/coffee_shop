import 'package:coffee_shop/model/onboarding_model.dart';
import 'package:coffee_shop/presentation/custom_widgets/skip_button.dart';
import 'package:flutter/material.dart';
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
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SkipButton(),
        SizedBox(height: screenheight * 0.064),
        Image.asset(
          widget.onboardingData.imageurl,
          width: screenwidth * 0.757,
          height: screenheight * 0.321,
        ),

        SizedBox(height: screenheight * 0.077),
        Text(
          widget.onboardingData.labeltext,
          style: TextStyle(
            fontSize: screenheight * 0.0246,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: screenheight * 0.0197),
        Text(
          widget.onboardingData.descriptiontext,
          style: TextStyle(
            fontSize: screenheight * 0.0197,
          ),
        ),

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
              dotHeight: screenheight * 0.01477,
              dotWidth: screenheight * 0.01477,
              expansionFactor: 2,
            ),
            ),
            GestureDetector(
              onTap: () => widget.ontapbutton(),
              
              child: Container(
                width: screenwidth * 0.416,
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: Color(0XFF5D4037),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Text(
                      widget.onboardingData.buttontext,
                      style: TextStyle(
                        color: Color(0XFFFEFEFE),
                        fontSize: screenheight * 0.0172,
                      ),
                    ),
                    Icon(Icons.arrow_forward,
                    color: Color(0XFFFEFEFE),
                    size: screenheight * 0.0197),
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