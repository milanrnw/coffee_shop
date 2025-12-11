import 'package:coffee_shop/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showCustomSnackbar(BuildContext context, String message) {
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => _TopSnackbarWidget(
      message: message,
      onDismiss: () {
        overlayEntry.remove();
      },
    ),
  );

  Overlay.of(context).insert(overlayEntry);
}

class _TopSnackbarWidget extends StatefulWidget {
  final String message;
  final VoidCallback onDismiss;

  const _TopSnackbarWidget({
    required this.message,
    required this.onDismiss,
  });

  @override
  State<_TopSnackbarWidget> createState() => _TopSnackbarWidgetState();
}

class _TopSnackbarWidgetState extends State<_TopSnackbarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.5), // Start slightly further up
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        _controller.reverse().then((value) {
          widget.onDismiss();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      left: 0,
      right: 0,
      child: Material(
        color: Colors.transparent,
        child: SlideTransition(
          position: _offsetAnimation,
          child: Center(
            child: Container(
              width: 335.w,
              height: 40.h,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.semanticColorDanger,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
