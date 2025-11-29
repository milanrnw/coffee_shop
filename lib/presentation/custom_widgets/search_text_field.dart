import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: 294.w,
        height: 40.h,
        child: TextField(
          controller: TextEditingController(),
          style: AppTextStyles.searchTextFieldText,
          cursorColor: Color(0XFF8A8A8A),
          cursorHeight: 16.h,
          cursorErrorColor: Colors.red,
          decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.search,
                size: 24.r,
              ),
              suffixIconColor: Color(0XFFCACACA),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Color(0XFFD7CCC8),
                ),
                borderRadius: BorderRadius.circular(16.r),
              ),
              hintText: "What would you like to drink today?",
              hintStyle: AppTextStyles.sendOtpPopupDescription1,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Color(0XFFD7CCC8),
                ),
                borderRadius: BorderRadius.circular(16.r),
              )),
        ),
      ),
    );
  }
}
