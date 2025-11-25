import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CommonRatingBar extends StatelessWidget {
  final double initialRating;
  final Function(double) onRatingChanged;

  final double itemSize;

  const CommonRatingBar({
    super.key,
    required this.initialRating,
    required this.onRatingChanged,
    this.itemSize = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: initialRating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: itemSize,
      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
      ratingWidget: RatingWidget(
        full: const Icon(Icons.star, color: Colors.amber),
        half: const Icon(Icons.star_half, color: Colors.amber),
        empty: const Icon(Icons.star_border, color: Colors.grey),
      ),
      onRatingUpdate: onRatingChanged,
      glow: false,
    );
  }
}
