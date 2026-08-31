import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';

class ToneRuleChartView extends StatelessWidget {
  const ToneRuleChartView({super.key});

  Widget _buildHeaderCell(String text) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: AppColors.primaryLight.withAlpha(80),
      alignment: Alignment.center,
      child: Text(
        text,
        style: AppTypography.toneLabel.copyWith(
          color: AppColors.primaryDark,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildCell(String text, {Color? bg, Color? textColor}) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: bg ?? Colors.white,
      alignment: Alignment.center,
      child: Text(
        text,
        style: AppTypography.bodySmall.copyWith(
          color: textColor ?? AppColors.textPrimaryLight,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Thai Tone Rules Summary', style: AppTypography.h3),
          const SizedBox(height: 4),
          Text(
            'ထိုင်းအသံထွက် ဥပဒေသ ဇယား (ဗျည်းအမျိုးအစား + သရအရှည်/အသို + အသတ်)',
            style: AppTypography.myanmarText.copyWith(color: AppColors.textSecondaryLight),
          ),
          const SizedBox(height: 16),
          Table(
            border: TableBorder.all(color: AppColors.borderLight, width: 1),
            columnWidths: const {
              0: FlexColumnWidth(1.2),
              1: FlexColumnWidth(1.0),
              2: FlexColumnWidth(1.0),
              3: FlexColumnWidth(1.0),
              4: FlexColumnWidth(1.0),
            },
            children: [
              TableRow(
                children: [
                  _buildHeaderCell('Class'),
                  _buildHeaderCell('No Mark\n(Live)'),
                  _buildHeaderCell('No Mark\n(Dead)'),
                  _buildHeaderCell('Mai Ek\n( -่ )'),
                  _buildHeaderCell('Mai Tho\n( -้ )'),
                ],
              ),
              TableRow(
                children: [
                  _buildCell('Middle\n(အလယ်သံ)', bg: AppColors.toneMid.withAlpha(20)),
                  _buildCell('MID\n(สามัญ)', textColor: AppColors.toneMid),
                  _buildCell('LOW\n(เอก)', textColor: AppColors.toneLow),
                  _buildCell('LOW\n(เอก)', textColor: AppColors.toneLow),
                  _buildCell('FALLING\n(โท)', textColor: AppColors.toneFalling),
                ],
              ),
              TableRow(
                children: [
                  _buildCell('High\n(အမြင့်သံ)', bg: AppColors.toneFalling.withAlpha(20)),
                  _buildCell('RISING\n(จัตวา)', textColor: AppColors.toneRising),
                  _buildCell('LOW\n(เอก)', textColor: AppColors.toneLow),
                  _buildCell('LOW\n(เอก)', textColor: AppColors.toneLow),
                  _buildCell('FALLING\n(โท)', textColor: AppColors.toneFalling),
                ],
              ),
              TableRow(
                children: [
                  _buildCell('Low\n(အနိမ့်သံ)', bg: AppColors.toneLow.withAlpha(20)),
                  _buildCell('MID\n(สามัญ)', textColor: AppColors.toneMid),
                  _buildCell('Short=HIGH\nLong=FALL', textColor: AppColors.toneHigh),
                  _buildCell('FALLING\n(โท)', textColor: AppColors.toneFalling),
                  _buildCell('HIGH\n(ตรี)', textColor: AppColors.toneHigh),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
