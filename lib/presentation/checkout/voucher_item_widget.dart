import 'package:coffee_shop/model/voucher_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VoucherItemWidget extends StatelessWidget {
  final VoucherModel voucher;
  final bool isSelected;
  final VoidCallback onTap;

  const VoucherItemWidget({
    super.key,
    required this.voucher,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isAvailable = voucher.warning == null;

    Color titleColor = isAvailable ? Colors.black : Colors.grey.shade400;
    Color subtitleColor =
        isAvailable ? Colors.grey.shade600 : Colors.grey.shade400;

    return InkWell(
      onTap: isAvailable ? onTap : null,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildVoucherIcon(voucher.imagePath),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    voucher.title,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: titleColor,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    voucher.subtitle,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: subtitleColor,
                    ),
                  ),
                  if (!isAvailable) ...[
                    SizedBox(height: 4.h),
                    Text(
                      voucher.warning!,
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.red[400],
                      ),
                    ),
                  ]
                ],
              ),
            ),
            if (isAvailable)
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? Colors.green : Colors.transparent,
                    border: Border.all(
                      color: isSelected ? Colors.green : Colors.grey.shade400,
                      width: 1.5,
                    ),
                  ),
                  child: isSelected
                      ? Icon(Icons.check, color: Colors.white, size: 16.sp)
                      : null,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildVoucherIcon(String imagePath) {
    return Container(
      width: 48.w,
      height: 48.w,
      padding: EdgeInsets.all(8.w),
      decoration: const BoxDecoration(
        color: Color(0xFFF4F4F4),
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
      ),
    );
  }
}
