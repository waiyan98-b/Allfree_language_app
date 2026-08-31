import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../models/vocabulary_model.dart';

class ToneBadge extends StatelessWidget {
  final ThaiTone tone;
  final bool showLabel;

  const ToneBadge({
    super.key,
    required this.tone,
    this.showLabel = true,
  });

  static Color getToneColor(ThaiTone tone) {
    switch (tone) {
      case ThaiTone.mid:
        return AppColors.toneMid;
      case ThaiTone.low:
        return AppColors.toneLow;
      case ThaiTone.falling:
        return AppColors.toneFalling;
      case ThaiTone.high:
        return AppColors.toneHigh;
      case ThaiTone.rising:
        return AppColors.toneRising;
    }
  }

  static String getToneName(ThaiTone tone) {
    switch (tone) {
      case ThaiTone.mid:
        return 'Mid';
      case ThaiTone.low:
        return 'Low';
      case ThaiTone.falling:
        return 'Falling';
      case ThaiTone.high:
        return 'High';
      case ThaiTone.rising:
        return 'Rising';
    }
  }

  static String getToneThaiName(ThaiTone tone) {
    switch (tone) {
      case ThaiTone.mid:
        return 'สามัญ';
      case ThaiTone.low:
        return 'เอก';
      case ThaiTone.falling:
        return 'โท';
      case ThaiTone.high:
        return 'ตรี';
      case ThaiTone.rising:
        return 'จัตวา';
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = getToneColor(tone);
    final name = getToneName(tone);
    final thaiName = getToneThaiName(tone);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withAlpha(38),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          if (showLabel) ...[
            const SizedBox(width: 6),
            Text(
              '$name ($thaiName)',
              style: AppTypography.toneLabel.copyWith(
                color: color,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
