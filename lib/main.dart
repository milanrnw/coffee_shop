import 'package:coffee_shop/dashboard/dashboard_screen.dart';
import 'package:coffee_shop/presentation/checkout/checkout_screen.dart';
import 'package:coffee_shop/presentation/history/history_screen.dart';
import 'package:coffee_shop/presentation/onboarding/onboarding_main.dart';
import 'package:coffee_shop/presentation/product/product_screen.dart';
import 'package:coffee_shop/presentation/rating/rate_app_screen.dart';
import 'package:coffee_shop/presentation/track_order/tracking_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: DashboardScreen(),
      ),
    );
  }
}
