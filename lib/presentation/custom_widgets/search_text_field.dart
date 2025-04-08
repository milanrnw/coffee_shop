import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: TextEditingController(),
        style: TextStyle(
          fontSize: 14,
          color: Color(0XFF3C3C3C),
        ),
        cursorColor: Color(0XFF8A8A8A),
        cursorHeight: 16,
        cursorErrorColor: Colors.red,
        decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.search,
              size: 24,
            ),
            suffixIconColor: Color(0XFFCACACA),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: Color(0XFFD7CCC8),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            hintText: "What would you like to drink today?",
            hintStyle: TextStyle(
              color: Color(0XFFCACACA),
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,color: Color(0XFFD7CCC8),
              ),
              borderRadius: BorderRadius.circular(16),
            )),
      ),
    );
  }
}
