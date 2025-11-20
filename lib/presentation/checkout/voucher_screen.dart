import 'package:coffee_shop/constants/app_colors.dart';
import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:coffee_shop/model/voucher_model.dart';
import 'package:coffee_shop/presentation/checkout/voucher_model_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VoucherScreen extends StatefulWidget {
  final int? initialSelectedId; // Added to accept initial selection

  const VoucherScreen({super.key, this.initialSelectedId});

  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  int? _selectedVoucherId;

  @override
  void initState() {
    super.initState();
    _selectedVoucherId = widget.initialSelectedId; // Initialize selection
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 24.sp),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Voucher",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // 1. VOUCHER CODE INPUT
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: const Color(0xFFD0D0D0)),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter the voucher code here",
                  hintStyle: AppTextStyles.registerNameHint,
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                ),
              ),
            ),
          ),

          // 2. VOUCHER LIST
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: voucherList.length,
              separatorBuilder: (context, index) =>
                  Divider(color: Colors.grey[200], thickness: 1),
              itemBuilder: (context, index) {
                final voucher = voucherList[index];
                return _buildVoucherItem(voucher);
              },
            ),
          ),

          // 3. BOTTOM BAR (Only show if selected)
          if (_selectedVoucherId != null)
            Container(
              height: 76.h, // Increased height to fit button nicely
              width: 375.w,
              padding: EdgeInsets.symmetric(
                  horizontal: 20.w, vertical: 12.h), // Adjusted padding
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("1 promo selected",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600)),
                  SizedBox(
                    width: 156.w,
                    height: 48.h,
                    child: ElevatedButton(
                      onPressed: () {
                        // Apply voucher logic: Return ID
                        Navigator.pop(context, _selectedVoucherId);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.brandColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                      child: Text(
                        "Use",
                        style: AppTextStyles.authButton,
                      ),
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }

  Widget _buildVoucherItem(VoucherModel voucher) {
    bool isAvailable = voucher.warning == null;
    bool isSelected = _selectedVoucherId == voucher.id;

    Color titleColor = isAvailable ? Colors.black : Colors.grey.shade400;
    Color subtitleColor =
        isAvailable ? Colors.grey.shade600 : Colors.grey.shade400;

    return InkWell(
      onTap: isAvailable
          ? () {
              setState(() {
                if (_selectedVoucherId == voucher.id) {
                  _selectedVoucherId = null;
                } else {
                  _selectedVoucherId = voucher.id;
                }
              });
            }
          : null,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ICON WITH IMAGE
            _buildVoucherIcon(voucher.imagePath),

            SizedBox(width: 12.w),

            // TEXT
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

            // SELECTION RADIO
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
      padding:
          EdgeInsets.all(8.w), // Add padding if logo touches the circle edges
      decoration: const BoxDecoration(
        color: Color(0xFFF4F4F4), // Light grey background
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
      ),
    );
  }
}
