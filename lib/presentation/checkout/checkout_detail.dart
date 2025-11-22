import 'package:coffee_shop/constants/app_colors.dart';
import 'package:coffee_shop/model/voucher_model.dart';
import 'package:coffee_shop/presentation/checkout/pickup_time_dialog.dart';
import 'package:coffee_shop/presentation/checkout/voucher_model_list.dart';
import 'package:coffee_shop/presentation/checkout/voucher_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum OrderType { asap, later }

class CheckoutDetail extends StatefulWidget {
  final VoucherModel? selectedVoucher;
  final Function(VoucherModel?) onVoucherSelected;
  final double subtotal;
  final double discountAmount;
  final double total;
  final int quantity;

  const CheckoutDetail({
    super.key,
    required this.selectedVoucher,
    required this.onVoucherSelected,
    required this.subtotal,
    required this.discountAmount,
    required this.total,
    required this.quantity,
  });

  @override
  State<CheckoutDetail> createState() => _CheckoutDetailState();
}

class _CheckoutDetailState extends State<CheckoutDetail> {
  OrderType _selectedOrderType = OrderType.asap;
  String _scheduledTime = "Schedule Pick Up";

  final TextStyle _titleStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  final TextStyle _subtitleStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Colors.grey[600],
  );

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
              Text("When do you want order?", style: _titleStyle),
              SizedBox(height: 4.h),
              Text("*We are open from 08.00 - 20.00 WIB",
                  style: _subtitleStyle),
              SizedBox(height: 16.h),
              _buildRadioOption(
                title: "As Soon as Possible",
                subtitle: "Now - 10 Minute",
                value: OrderType.asap,
              ),
              Divider(thickness: 2.h, color: const Color(0xFFF4F4F4)),
              _buildRadioOption(
                title: "Later",
                subtitle: _selectedOrderType == OrderType.later
                    ? _scheduledTime
                    : "Schedule Pick Up",
                value: OrderType.later,
              ),
              Divider(thickness: 2.h, color: const Color(0xFFF4F4F4)),
              Text("Payment Method", style: _titleStyle),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Text("Gopay(Rp85.000)", style: _subtitleStyle),
                  const Spacer(),
                  Icon(Icons.arrow_forward_ios,
                      size: 20.sp, color: Colors.black54),
                ],
              ),
              SizedBox(height: 8.h),
              Divider(thickness: 2.h, color: const Color(0xFFF4F4F4)),
              InkWell(
                onTap: () async {
                  final selectedId = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VoucherScreen(
                              initialSelectedId: widget.selectedVoucher?.id,
                            )),
                  );
                  if (selectedId != null) {
                    try {
                      final voucher =
                          voucherList.firstWhere((v) => v.id == selectedId);
                      widget.onVoucherSelected(voucher);
                    } catch (e) {}
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Voucher", style: _titleStyle),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.selectedVoucher != null
                                ? widget.selectedVoucher!.title
                                : "no voucher added",
                            style: widget.selectedVoucher != null
                                ? _titleStyle.copyWith(fontSize: 14.sp)
                                : _subtitleStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Spacer(),
                        Icon(Icons.arrow_forward_ios,
                            size: 20.sp, color: Colors.black54),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Divider(thickness: 2.h, color: const Color(0xFFF4F4F4)),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Divider(thickness: 4.h, color: const Color(0xFFF4F4F4)),
        SizedBox(height: 16.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Payment Summary", style: _titleStyle),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Text("Price", style: _subtitleStyle),
                  const Spacer(),
                  Text("Rp${widget.subtotal.toStringAsFixed(0)}",
                      style: _subtitleStyle),
                ],
              ),
              SizedBox(height: 4.h),
              Text("(${widget.quantity} items)",
                  style: _subtitleStyle.copyWith(fontSize: 12.sp)),
              if (widget.discountAmount > 0) ...[
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Text("Voucher", style: _subtitleStyle),
                    const Spacer(),
                    Text("-Rp${widget.discountAmount.toStringAsFixed(0)}",
                        style: _subtitleStyle.copyWith(color: Colors.red)),
                  ],
                ),
              ],
              SizedBox(height: 8.h),
              Row(
                children: [
                  Text("Total",
                      style: _subtitleStyle.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  const Spacer(),
                  Text("Rp${widget.total.toStringAsFixed(0)}",
                      style: _titleStyle),
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
                  Text(title, style: _titleStyle),
                  SizedBox(height: 4.h),
                  Text(subtitle, style: _subtitleStyle),
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
