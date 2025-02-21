import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingSlide3 extends StatefulWidget {
  const OnboardingSlide3({super.key});

  @override
  State<OnboardingSlide3> createState() => _OnboardingSlide3State();
}

class _OnboardingSlide3State extends State<OnboardingSlide3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                  ),
                ),
                  Text(
                    'Skip',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Color(0XFF3C3C3C),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 52),
              Image.asset(
                'assets/images/onboarding/slide3.png',
                width: 284,
                height: 261,
                alignment: Alignment.center,
              ),
              const SizedBox(height: 63),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Get and Redeem Voucher",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Exciting prizes await you! Redeem yours\nby collecting all the points after purchase\nin the app!",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 210,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedSmoothIndicator(
                        activeIndex: 2,
                        count: 3,
                        effect: ExpandingDotsEffect(
                            activeDotColor: Color(0XFF5D4037),
                            dotColor: Color(0XFFCACACA),
                            dotHeight: 12,
                            dotWidth: 12,
                            expansionFactor: 2),
                      ),
                      Container(
                          width: 156,
                          height: 48,
                          padding: const EdgeInsets.symmetric(
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
                                'Login/Register',
                                style: TextStyle(
                                    fontSize: 14, color: Color(0XFFFEFEFE)),
                              ),
                              Icon(
                                Icons.arrow_forward_rounded,
                                color: Color(0XFFFEFEFE),
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
