import 'package:coffee_shop/constants/app_strings.dart';
import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:coffee_shop/dashboard/dashboard_screen.dart';
import 'package:coffee_shop/presentation/custom_widgets/auth_button.dart';
import 'package:coffee_shop/presentation/custom_widgets/create_pin_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatePin extends StatefulWidget {
  const CreatePin({super.key});

  @override
  State<CreatePin> createState() => _CreatePinState();
}

class _CreatePinState extends State<CreatePin> {
  final createPinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0XFFFEFEFE),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back),
          iconSize: 24,
        ),
        title: Text(
          AppStrings.createPinAppBarTitle,
          style: AppTextStyles.createPinAppBarTitle,
        ),
      ),
      backgroundColor: Color(0XFFFEFEFE),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(
                color: Color(0XFF3C3C3C).withValues(alpha: 0.15),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Column(
                  children: [
                    Image.asset('assets/images/create_pin_image.png'),
                    SizedBox(height: 32.h),
                    Text(
                      AppStrings.createPinDescription1,
                      style: AppTextStyles.createPinDescription1,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      AppStrings.createPinDescription2,
                      style: AppTextStyles.createPinDescription2,
                    ),
                    SizedBox(height: 24.h),
                    CreatePinField(createPinController: createPinController),
                    SizedBox(height: 8.h),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          'show your PIN',
                          style: TextStyle(
                            color: Color(0XFF555555),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Icon(Icons.remove_red_eye_outlined),
                    ],
                    ),
                    SizedBox(height: 240.h),
                    AuthButton(
                        buttonText: 'Confirm',
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => DashboardScreen()),
                          );
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
