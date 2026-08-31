import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class AppProgressBar extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final double height;
  final Color fillColor;
  final Color backgroundColor;

  const AppProgressBar({
    super.key,
    required this.progress,
    this.height = 10.0,
    this.fillColor = AppColors.primary,
    this.backgroundColor = const Color(0xFFE0E0E0),
  });

  @override
  Widget build(BuildContext context) {
    final clamped = progress.clamp(0.0, 1.0);
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: clamped == 0.0 ? 0.001 : clamped,
        child: Container(
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(height / 2),
          ),
        ),
      ),
    );
  }
}
