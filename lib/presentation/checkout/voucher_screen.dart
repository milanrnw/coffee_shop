import 'package:coffee_shop/constants/app_colors.dart';
import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:coffee_shop/presentation/checkout/voucher_item_widget.dart';
import 'package:coffee_shop/presentation/checkout/voucher_model_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VoucherScreen extends StatefulWidget {
  final int? initialSelectedId;

  const VoucherScreen({super.key, this.initialSelectedId});

  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  int? _selectedVoucherId;

  @override
  void initState() {
    super.initState();
    _selectedVoucherId = widget.initialSelectedId;
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
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: voucherList.length,
              separatorBuilder: (context, index) =>
                  Divider(color: Colors.grey[200], thickness: 1),
              itemBuilder: (context, index) {
                final voucher = voucherList[index];
                return VoucherItemWidget(
                  voucher: voucher,
                  isSelected: voucher.id == _selectedVoucherId,
                  onTap: () {
                    setState(() {
                      if (_selectedVoucherId == voucher.id) {
                        _selectedVoucherId = null;
                      } else {
                        _selectedVoucherId = voucher.id;
                      }
                    });
                  },
                );
              },
            ),
          ),
          if (_selectedVoucherId != null)
            Container(
              height: 76.h,
              width: 375.w,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
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
                  Text(
                    "1 promo selected",
                    style: AppTextStyles.createPinAppBarTitle
                        .copyWith(fontSize: 14.sp),
                  ),
                  SizedBox(
                    width: 156.w,
                    height: 48.h,
                    child: ElevatedButton(
                      onPressed: () {
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
}
