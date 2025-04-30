import 'package:coffee_shop/model/pills_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Pills extends StatelessWidget {
  const Pills({
    super.key,
    required this.pillData,
    this.onTap,
  });

  final PillsModel pillData;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: pillData.isSelected
              ? const Color(0XFF5D4037)
              : const Color(0XFFEFEBE9),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.only(right: 8, top: 4, bottom: 4),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          children: [
            Icon(
              pillData.icon,
              size: 16,
              color: pillData.isSelected
                  ? const Color(0XFFFEFEFE)
                  : const Color(0XFF3C3C3C),
            ),
            SizedBox(width: 4.w),
            Text(
              pillData.text,
              style: TextStyle(
                fontSize: 12.sp,
                color: pillData.isSelected
                    ? const Color(0XFFFEFEFE)
                    : const Color(0XFF3C3C3C),
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}