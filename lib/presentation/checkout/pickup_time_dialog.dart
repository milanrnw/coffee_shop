import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PickUpTimeDialog extends StatefulWidget {
  const PickUpTimeDialog({super.key});

  @override
  State<PickUpTimeDialog> createState() => _PickUpTimeDialogState();
}

class _PickUpTimeDialogState extends State<PickUpTimeDialog> {
  int _selectedHour = 1;
  int _selectedMinute = 0;
  bool _isAm = true;

  late FixedExtentScrollController _hourController;
  late FixedExtentScrollController _minuteController;

  final List<int> _hours = List.generate(12, (index) => index + 1);
  final List<int> _minutes = List.generate(12, (index) => index * 5);

  @override
  void initState() {
    super.initState();
    _hourController = FixedExtentScrollController(
      initialItem: _hours.indexOf(_selectedHour),
    );
    _minuteController = FixedExtentScrollController(
      initialItem: _minutes.indexOf(_selectedMinute),
    );
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 180.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // HOURS
                  _buildWheelColumn(
                    controller: _hourController,
                    itemCount: _hours.length,
                    onChanged: (index) {
                      setState(() => _selectedHour = _hours[index]);
                    },
                    itemBuilder: (index) =>
                        _hours[index].toString().padLeft(2, '0'),
                  ),

                  SizedBox(width: 10.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 6.w,
                          height: 6.w,
                          decoration: const BoxDecoration(
                              color: Color(0xFF323232),
                              shape: BoxShape.circle)),
                      SizedBox(height: 10.h),
                      Container(
                          width: 6.w,
                          height: 6.w,
                          decoration: const BoxDecoration(
                              color: Color(0xFF323232),
                              shape: BoxShape.circle)),
                    ],
                  ),
                  SizedBox(width: 10.w),

                  _buildWheelColumn(
                    controller: _minuteController,
                    itemCount: _minutes.length,
                    onChanged: (index) {
                      setState(() => _selectedMinute = _minutes[index]);
                    },
                    itemBuilder: (index) =>
                        _minutes[index].toString().padLeft(2, '0'),
                  ),

                  SizedBox(width: 20.w),

                  _buildAmPmToggle(),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Cancel",
                    style: AppTextStyles.homeScreenTab,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    final period = _isAm ? "AM" : "PM";
                    final h = _selectedHour.toString().padLeft(2, '0');
                    final m = _selectedMinute.toString().padLeft(2, '0');
                    Navigator.pop(context, "$h:$m $period");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5D4037),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
                  ),
                  child: Text(
                    "Continue",
                    style: AppTextStyles.authButton,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWheelColumn({
    required FixedExtentScrollController controller,
    required int itemCount,
    required ValueChanged<int> onChanged,
    required String Function(int) itemBuilder,
  }) {
    return SizedBox(
      width: 70.w,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFEBE4DF),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(8.r)),
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFEBE4DF),
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(8.r)),
                  ),
                ),
              ),
            ],
          ),
          ListWheelScrollView.useDelegate(
            controller: controller,
            itemExtent: 50.h,
            perspective: 0.005,
            diameterRatio: 1.2,
            physics: const FixedExtentScrollPhysics(),
            onSelectedItemChanged: onChanged,
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: itemCount,
              builder: (context, index) {
                return Center(
                  child: Text(
                    itemBuilder(index),
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF323232),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmPmToggle() {
    return Container(
      height: 100.h,
      width: 50.w,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF5D4037), width: 1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Expanded(child: _buildToggleItem("AM", _isAm)),
          Container(height: 1, color: const Color(0xFF5D4037)),
          Expanded(child: _buildToggleItem("PM", !_isAm)),
        ],
      ),
    );
  }

  Widget _buildToggleItem(String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isAm = text == "AM";
        });
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF5D4037) : Colors.transparent,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: isSelected ? Colors.white : const Color(0xFF323232),
          ),
        ),
      ),
    );
  }
}
