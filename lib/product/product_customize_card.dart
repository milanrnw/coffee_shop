import 'package:coffee_shop/constants/app_colors.dart';
import 'package:coffee_shop/presentation/custom_widgets/product_customize_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCustomizeCard extends StatefulWidget {
  const ProductCustomizeCard({super.key});

  @override
  State<ProductCustomizeCard> createState() => _ProductCustomizeCardState();
}

class _ProductCustomizeCardState extends State<ProductCustomizeCard> {
  String selectedVariant = "Ice";
  String selectedSize = "Regular";
  String selectedSugar = "Normal";
  String selectedIce = "Normal";

  void _onVariantSelected(String variant) {
    setState(() {
      selectedVariant = variant;
    });
  }

  void _onSizeSelected(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  void _onSugarSelected(String sugar) {
    setState(() {
      selectedSugar = sugar;
    });
  }

  void _onIceSelected(String ice) {
    setState(() {
      selectedIce = ice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        width: 0.9.sw,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Customize",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textColorHeading,
              ),
            ),
            SizedBox(height: 10.h),

            // Variant
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Variant",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.textColorHeading,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    ProductCustomizeButton(
                      buttonText: "Ice",
                      isSelected: selectedVariant == "Ice",
                      onTap: () => setState(() => selectedVariant = "Ice"),
                    ),
                    SizedBox(width: 8.w),
                    ProductCustomizeButton(
                      buttonText: "Hot",
                      isSelected: selectedVariant == "Hot",
                      onTap: () => setState(() => selectedVariant = "Hot"),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12.h),

            Row(
              children: [
                Text(
                  "Size",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.textColorHeading,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    ProductCustomizeButton(
                      buttonText: "Regular",
                      isSelected: selectedSize == "Regular",
                      onTap: () => setState(() => selectedSize = "Regular"),
                    ),
                    SizedBox(width: 8.w),
                    ProductCustomizeButton(
                      buttonText: "Medium",
                      isSelected: selectedSize == "Medium",
                      onTap: () => setState(() => selectedSize = "Medium"),
                    ),
                    SizedBox(width: 8.w),
                    ProductCustomizeButton(
                      buttonText: "Large",
                      isSelected: selectedSize == "Large",
                      onTap: () => setState(() => selectedSize = "Large"),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12.h),

            // Sugar
            Row(
              children: [
                Text(
                  "Sugar",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.textColorHeading,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    ProductCustomizeButton(
                      buttonText: "Normal",
                      isSelected: selectedSugar == "Normal",
                      onTap: () => setState(() => selectedSugar = "Normal"),
                    ),
                    SizedBox(width: 8.w),
                    ProductCustomizeButton(
                      buttonText: "Less",
                      isSelected: selectedSugar == "Less",
                      onTap: () => setState(() => selectedSugar = "Less"),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12.h),
            // Ice
            Row(
              children: [
                Text(
                  "Ice",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.textColorHeading,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    ProductCustomizeButton(
                      buttonText: "Normal",
                      isSelected: selectedIce == "Normal",
                      onTap: () => setState(() => selectedIce = "Normal"),
                    ),
                    SizedBox(width: 8.w),
                    ProductCustomizeButton(
                      buttonText: "Less",
                      isSelected: selectedIce == "Less",
                      onTap: () => setState(() => selectedIce = "Less"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
