import 'package:coffee_shop/presentation/track_order/timeline_event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MytimelineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final Widget eventcard;

  const MytimelineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.eventcard,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: TweenAnimationBuilder<Color?>(
        duration: const Duration(milliseconds: 2500),
        tween: ColorTween(
          begin: const Color(0xFFE0E0E0),
          end: isPast ? const Color(0xFF43936C) : const Color(0xFFE0E0E0),
        ),
        builder: (context, color, child) {
          return TimelineTile(
            isFirst: isFirst,
            isLast: isLast,
            beforeLineStyle: LineStyle(
              color: color ?? const Color(0xFFE0E0E0),
            ),
            indicatorStyle: IndicatorStyle(
              width: 20,
              color: color ?? const Color(0xFFE0E0E0),
              iconStyle: isPast
                  ? IconStyle(
                      iconData: Icons.check,
                      color: Colors.white,
                      fontSize: 14,
                    )
                  : null,
            ),
            endChild: TimelineEventCard(
              isPast: isPast,
              child: eventcard,
            ),
          );
        },
      ),
    );
  }
}
