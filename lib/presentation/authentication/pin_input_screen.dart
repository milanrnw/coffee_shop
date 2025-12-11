import 'package:coffee_shop/constants/app_colors.dart';
import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:coffee_shop/dashboard/dashboard_screen.dart';
import 'package:coffee_shop/presentation/custom_widgets/auth_button.dart';
import 'package:coffee_shop/presentation/custom_widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PinInputScreen extends StatefulWidget {
  const PinInputScreen({super.key});

  @override
  State<PinInputScreen> createState() => _PinInputScreenState();
}

class _PinInputScreenState extends State<PinInputScreen> {
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String _pin = "";

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onConfirm() {
    if (_pin.length == 6) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFEFEFE),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0XFFFEFEFE),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Input your PIN",
          style: AppTextStyles.createPinAppBarTitle,
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Divider(
                color: const Color(0XFF3C3C3C).withValues(alpha: 0.15),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/create_pin_image.png",
                      height: 200.h,
                      width: 200.w,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.security,
                            size: 100.h, color: Colors.grey);
                      },
                    ),
                    SizedBox(height: 32.h),
                    Text(
                      "Enter 6 digit PIN for secure account access",
                      style: AppTextStyles.createPinDescription2,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24.h),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Opacity(
                          opacity: 0,
                          child: TextField(
                            controller: _pinController,
                            focusNode: _focusNode,
                            keyboardType: TextInputType.number,
                            maxLength: 6,
                            onChanged: (value) {
                              setState(() {
                                _pin = value;
                              });
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _focusNode.requestFocus();
                            // Keep keyboard visible
                            if (MediaQuery.of(context).viewInsets.bottom == 0) {
                              SystemChannels.textInput
                                  .invokeMethod('TextInput.show');
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(6, (index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 8.w),
                                width: 24.w,
                                height: 24.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: _pin.length > index
                                        ? AppColors.brandColor
                                        : Colors.grey,
                                    width: 1.5,
                                  ),
                                  color: _pin.length > index
                                      ? AppColors.brandColor
                                      : Colors.transparent,
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Forgot PIN? ",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.textColorParagraph,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Change PIN.",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.brandColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),
                    AuthButton(
                      buttonText: "Confirm",
                      buttonColor: AppColors.brandColor,
                      onTap: () {
                        if (_pin.length < 6) {
                          showCustomSnackbar(context, "Enter your PIN first.");
                        } else {
                          _onConfirm();
                        }
                      },
                    ),
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
