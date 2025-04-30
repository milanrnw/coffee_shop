import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee_shop/presentation/custom_widgets/home_carousel_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenCarousel extends StatelessWidget {
  const HomeScreenCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> carouselImages = [
    'assets/images/home/carousel/carousel1.png',
    'assets/images/home/carousel/carousel2.png',
    'assets/images/home/carousel/carousel3.png',
  ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 137.h,
        pageSnapping: true,
        viewportFraction: 1,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
      ),
      items: carouselImages.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: HomeCarouselItem(imageUrl: image),
            );
          },
        );
      }).toList(),
    );
  }
}
