import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankWidget extends StatelessWidget {
  final String bankName;
  final String imagePath;

  const BankWidget({
    super.key,
    required this.bankName,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        Row(
          children: [
            SizedBox(width: 90.w),
            Image.asset(
              imagePath,
              height: 24.h,
              width: 24.w,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.account_balance,
                    size: 24.h, color: Colors.blue);
              },
            ),
            SizedBox(width: 12.w),
            Text(
              bankName,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: const EdgeInsets.only(left: 90, right: 26),
          child: Divider(
            thickness: 1.h,
            color: const Color(0xFFD9D9D9),
          ),
        ),
      ],
    );
  }
}
