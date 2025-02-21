import 'package:coffee_shop/onboarding/onboarding_slide2.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingSlide1 extends StatefulWidget {
  const OnboardingSlide1({super.key});

  @override
  State<OnboardingSlide1> createState() => _OnboardingSlide1State();
}

class _OnboardingSlide1State extends State<OnboardingSlide1> {
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                'assets/images/onboarding/slide1.png',
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
                        "Choose and customize your Drinks",
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
                        "Customize your own drink exactly how you \nlike it by adding any topping you like!!!",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  //flexible sizebox not working
                  SizedBox(
                    height: 230,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedSmoothIndicator(
                        activeIndex: 0,
                        count: 3,
                        effect: ExpandingDotsEffect(
                            activeDotColor: Color(0XFF5D4037),
                            dotColor: Color(0XFFCACACA),
                            dotHeight: 12,
                            dotWidth: 12,
                            expansionFactor: 2),
                      ),
                      GestureDetector(
                          onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const OnboardingSlide2(),
                            ),
                          );
                        },
                            child: Container(
                            width: 156,
                            height: 48,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0XFF5D4037),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(),
                                Text(
                                  'NEXT',
                                  style: TextStyle(
                                    color: Color(0XFFFEFEFE),
                                    fontSize: 14,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Color(0XFFFEFEFE),
                                  size: 16,
                                )
                              ],
                            ),
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
