import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimelineEventCard extends StatelessWidget {
  final bool isPast;
  final child;
  const TimelineEventCard(
      {super.key, required this.isPast, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          left: 18.w,
        ),
        child: child);
  }
}
