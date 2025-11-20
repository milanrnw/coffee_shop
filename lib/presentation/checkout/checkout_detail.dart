import 'package:coffee_shop/constants/app_colors.dart';
import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:coffee_shop/presentation/checkout/pickup_time_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum OrderType { asap, later }

class CheckoutDetail extends StatefulWidget {
  const CheckoutDetail({super.key});

  @override
  State<CheckoutDetail> createState() => _CheckoutDetailState();
}

class _CheckoutDetailState extends State<CheckoutDetail> {
  OrderType _selectedOrderType = OrderType.asap;
  String _scheduledTime = "Schedule Pick Up";

  void _handleSelection(OrderType value) async {
    setState(() {
      _selectedOrderType = value;
    });

    if (value == OrderType.later) {
      final result = await showDialog(
        context: context,
        builder: (context) => const PickUpTimeDialog(),
      );

      if (result != null) {
        setState(() {
          _scheduledTime = result;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("When do you want order?",
                  style: AppTextStyles.createPinAppBarTitle),
              SizedBox(height: 4.h),
              Text("*We are open from 08.00 - 20.00 WIB",
                  style: AppTextStyles.createPinDescription2),
              SizedBox(height: 16.h),
              _buildRadioOption(
                title: "As Soon as Possible",
                subtitle: "Now - 10 Minute",
                value: OrderType.asap,
              ),
              Divider(
                thickness: 2.h,
                color: const Color(0xFFF4F4F4),
              ),
              _buildRadioOption(
                title: "Later",
                subtitle: _selectedOrderType == OrderType.later
                    ? _scheduledTime
                    : "Schedule Pick Up",
                value: OrderType.later,
              ),
              Divider(
                thickness: 2.h,
                color: const Color(0xFFF4F4F4),
              ),
              Text("Payment Method", style: AppTextStyles.createPinAppBarTitle),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Text("Gopay(Rp25.000)",
                      style: AppTextStyles.createPinDescription2),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios,
                      size: 20.sp, color: Colors.black54),
                ],
              ),
              SizedBox(height: 8.h),
              Divider(
                thickness: 2.h,
                color: const Color(0xFFF4F4F4),
              ),
              Text("Voucher", style: AppTextStyles.createPinAppBarTitle),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Text("no voucher added",
                      style: AppTextStyles.createPinDescription2),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios,
                      size: 20.sp, color: Colors.black54),
                ],
              ),
              SizedBox(height: 8.h),
              Divider(
                thickness: 2.h,
                color: const Color(0xFFF4F4F4),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Divider(
          thickness: 4.h,
          color: const Color(0xFFF4F4F4),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Payment Summary",
                  style: AppTextStyles.createPinAppBarTitle),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Text("Price", style: AppTextStyles.createPinDescription2),
                  Spacer(),
                  Text("Rp25.000", style: AppTextStyles.createPinDescription2),
                ],
              ),
              SizedBox(height: 4.h),
              Text("(1 items)", style: AppTextStyles.sendOtpPopupDescription1),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Text("Total", style: AppTextStyles.createPinDescription1),
                  Spacer(),
                  Text("Rp25.000", style: AppTextStyles.createPinAppBarTitle),
                ],
              ),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRadioOption({
    required String title,
    required String subtitle,
    required OrderType value,
  }) {
    return InkWell(
      onTap: () => _handleSelection(value),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.createPinAppBarTitle),
                  SizedBox(height: 4.h),
                  Text(subtitle, style: AppTextStyles.createPinDescription2),
                ],
              ),
            ),
            Radio<OrderType>(
              value: value,
              groupValue: _selectedOrderType,
              onChanged: (val) => _handleSelection(val!),
              activeColor: AppColors.brandColor,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ],
        ),
      ),
    );
  }
}
