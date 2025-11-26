import 'package:coffee_shop/model/onboarding_model.dart';
import 'package:coffee_shop/presentation/authentication/login_screen.dart';
import 'package:coffee_shop/presentation/onboarding/onboarding_slide_data.dart';
import 'package:flutter/material.dart';

class OnboardingMain extends StatelessWidget {
  OnboardingMain({super.key});

  final onboardingSlideData = [
    OnboardingModel(
      imageurl: 'assets/images/onboarding/slide1.png',
      labeltext: "Choose and customize your Drinks",
      descriptiontext:
          "Customize your own drink exactly how you like it by adding any topping you like!!!",
      buttontext: 'NEXT',
    ),
    OnboardingModel(
      imageurl: 'assets/images/onboarding/slide2.png',
      labeltext: "Quickly and easily",
      descriptiontext:
          "You can place your order quickly and easly without wasting time. You can also schedule orders via your smarthphone.",
      buttontext: 'NEXT',
    ),
    OnboardingModel(
      imageurl: 'assets/images/onboarding/slide3.png',
      labeltext: "Get and Redeem Voucher",
      descriptiontext:
          "Exciting prizes await you! Redeem yours by collecting all the points after purchase in the app!",
      buttontext: 'Login/Register',
    ),
  ];

  final pagecontroller = PageController();

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
          child: PageView.builder(
              controller: pagecontroller,
              itemCount: onboardingSlideData.length,
              itemBuilder: (context, index) => OnboardingSlideData(
                  onboardingData: onboardingSlideData[index],
                  slidelength: onboardingSlideData.length,
                  currentindex: index,
                  ontapbutton: () {
                    if (index == (onboardingSlideData.length - 1)) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                        (val) => false,
                      );
                      return;
                    }
                    pagecontroller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease);
                  })),
        ),
      ),
    );
  }
}
