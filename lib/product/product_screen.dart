import 'package:coffee_shop/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBar(
              title: Text("Customize order",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.textColorHeading,
              ),
              ),
              leadingWidth: 40.h,
              leading: IconButton(onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.arrow_back,),
              padding: EdgeInsets.symmetric(horizontal: 16),
              ),
              ),
              Divider(color: Colors.grey,height: 0),
              Container(
                child: Stack(
                  children: [
                    Image.asset("assets/images/home/products/product.png"),
                    Container(
                      margin: EdgeInsets.only(top: 384,left: 20,right: 20),
                      height: 300,
                      width: 355,
                      color: Colors.amber,
                    ),
                    
                  ],
                ),
              )
        ],
        ),
      ),
    );
  }
}
