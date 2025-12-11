import 'package:coffee_shop/constants/app_colors.dart';
import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:coffee_shop/presentation/payment/bank_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedValue = 1;

  bool _isTransferExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFEFEFE),
      appBar: AppBar(
        leadingWidth: 40,
        backgroundColor: const Color(0XFFFEFEFE),
        centerTitle: false,
        leading: IconButton(
            iconSize: 24.sp,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          "Payment Method",
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              thickness: 2.h,
              color: const Color(0XFFF5F5F5),
            ),
            SizedBox(height: 32.h),
            InkWell(
              onTap: () {
                setState(() {
                  _selectedValue = 1;
                });
                Navigator.pop(context, "GoPay (Rp 85.000)");
              },
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Image.asset(
                      "assets/images/payment/go_pay.png",
                      height: 48.h,
                      width: 48.w,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("GoPay",
                            style: AppTextStyles.onboardingSlideDescription),
                        SizedBox(height: 4.h),
                        Text("Saldo: Rp85.000",
                            style: AppTextStyles.loginNumberHint),
                      ],
                    ),
                  ),
                  Radio(
                    value: 1,
                    groupValue: _selectedValue,
                    activeColor: AppColors.semanticColorInfo,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value as int;
                      });
                    },
                  ),
                  SizedBox(width: 20.w),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: const EdgeInsets.only(left: 90, right: 26),
              child: Divider(
                thickness: 1.h,
                color: const Color(0xFFD9D9D9),
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Image.asset(
                    "assets/images/payment/payment_card.png",
                    height: 48.h,
                    width: 48.w,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Credit or debit card",
                          style: AppTextStyles.onboardingSlideDescription),
                      SizedBox(height: 4.h),
                      Text("Visa, Mastercard, AMEX, and JCB",
                          maxLines: 2, style: AppTextStyles.loginNumberHint),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: AppColors.brandColor,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text("Add", style: AppTextStyles.authButton),
                ),
                SizedBox(width: 20.w),
              ],
            ),
            SizedBox(height: 24.h),
            Divider(
              thickness: 4.h,
              color: AppColors.neutralColorMedium,
            ),
            SizedBox(height: 24.h),
            InkWell(
              onTap: () {
                setState(() {
                  _isTransferExpanded = !_isTransferExpanded;
                });
              },
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Image.asset(
                      "assets/images/payment/transfer.png",
                      height: 48.h,
                      width: 48.w,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Transfer Bank",
                            style: AppTextStyles.onboardingSlideDescription),
                        SizedBox(height: 4.h),
                        Text("(Automatic Check)",
                            maxLines: 2, style: AppTextStyles.loginNumberHint),
                      ],
                    ),
                  ),
                  Icon(
                    _isTransferExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.black,
                  ),
                  SizedBox(width: 20.w),
                ],
              ),
            ),
            SizedBox(height: 4.h),
            Padding(
              padding: const EdgeInsets.only(left: 90, right: 26),
              child: Divider(
                thickness: 1.h,
                color: const Color(0xFFD9D9D9),
              ),
            ),
            if (_isTransferExpanded) ...[
              InkWell(
                onTap: () => Navigator.pop(context, "Bank BCA"),
                child: const BankWidget(
                    bankName: "Bank BCA",
                    imagePath: "assets/images/payment/bank_bca.png"),
              ),
              InkWell(
                onTap: () => Navigator.pop(context, "Bank Mandiri"),
                child: const BankWidget(
                    bankName: "Bank Mandiri",
                    imagePath: "assets/images/payment/bank_mandiri.png"),
              ),
              InkWell(
                onTap: () => Navigator.pop(context, "Bank BNI"),
                child: const BankWidget(
                    bankName: "Bank BNI",
                    imagePath: "assets/images/payment/bank_bni.png"),
              ),
              InkWell(
                onTap: () => Navigator.pop(context, "Bank BRI"),
                child: const BankWidget(
                    bankName: "Bank BRI",
                    imagePath: "assets/images/payment/bank_bri.png"),
              ),
            ],
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
