import 'package:flutter/material.dart';

class HomeCarouselItem extends StatelessWidget {
  const HomeCarouselItem({super.key,
  required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage(imageUrl),
        fit: BoxFit.cover
        )
      ),
    );
  }
}
